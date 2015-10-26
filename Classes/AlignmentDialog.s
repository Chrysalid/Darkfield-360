// ********************************
//	Image Alignment Dialog Class
// ********************************
// the class alignmentdialog is of the type user interface frame, and responds to interaction
// It is used to manually align two images and return the offset of each of them.

class AlignmentDialog : uiframe
{
	// Global variables
	image imagea, imageb // The two images to mess with. Will be provided at start.
	number offsetx, offsety;
	number movementSensitivity, movementSensitivitySetting;
	Number dataObjectID;
	Number ToolkitID;
	Number AlignmentID;
	number debugMode;
	
	// variable to keep track of when the thread is running and when it is not.
	Number ScanIsOn
	
	// Control signals for the thread
	Object StartSignal
	Object StopSignal
	number do_break
	
	object childDialog; // Store a clone of this dialog here for repeated use.

	// Returns the Alignment Dialog ID to external functions.
	number getAlignmentDialogID(object self){
		return AlignmentID;
	}

	// allows external functions to extract the offset values from this object. Able to call it after the dialog is closed. Not sure how long it lasts.
	void getOffsets(object self, number &offsetXExternal, number &offsetYExternal){
		offsetXExternal = offsetX;
		offsetYExternal = offsetY;
	}
	
	void stopLoop(object self){
		result("\nAttempting to stop loop");
		do_break = 1;
	}
	
	// Remove the object references to try make child dialogs drop from scope
	void cleanReferences(object self){
		childDialog = NULL
		StartSignal = NULL
		StopSignal = NULL
	}
	//----------------------------------------
	//		Image Processing Functions
	//----------------------------------------

	// Creates two offset images of a new size.
	void makeOffsetImages(object self, image imagea, image imageb, image &newImageA, image &newImageB, number offsetx, number offsety){
		number axsize, bxsize, aysize, bysize
		getsize(imagea, axsize, aysize)
		getsize(imageb, bxsize, bysize)
		number biggestX = max(axsize, bxsize);
		number biggestY = max(aysize, bysize);
		// Check assumption that image 2 is the smaller of the two.
		if((axsize < bxsize) || (aysize < bysize) ) {
			throw ("Make the second image the smaller one");
		}
		// the placement of the second image compared to the first image. Lets us see what is out of bounds.
		// offsets can be -ve (upwards and to the left) or +ve (downwards and to the right)
		number offsetRectangleTop, offsetRectangleLeft, offsetRectangleBottom, offsetRectangleRight;
		offsetRectangleTop = offsety;
		offsetRectangleLeft = offsetx;
		offsetRectangleBottom = offsety + bysize-1;
		offsetRectangleRight = offsetx + bxsize-1;
		
		// What additional space is needed on a new image
		number extraSpaceTop, extraSpaceLeft, extraSpaceBottom, extraSpaceRight;
		extraSpaceTop = (offsetRectangleTop < 0) ? abs(offsety) : 0 ;
		extraSpaceBottom = (offsetRectangleBottom < aysize) ? 0 : (offsetRectangleBottom - aysize +2);
		extraSpaceLeft = (offsetRectangleLeft < 0) ? abs(offsetx) : 0 ; 
		extraSpaceRight = (offsetRectangleRight < axsize) ? 0 : (offsetRectangleRight - axsize +2) ;
		
		number newWidth =  axsize + extraSpaceLeft + extraSpaceRight;
		number newHeight = aysize + extraSpaceBottom + extraSpaceTop;
		// New image (a)
		newImageA := RealImage("Image A aligned", 4, newWidth, newHeight);
		newImageA = 0; // black image
		newImageA [extraSpaceTop, extraSpaceLeft, extraSpaceTop + aysize - 1, extraSpaceLeft + axsize - 1] = imagea [0,0,(aysize-1),(axsize-1)]; // paste imageA on top
		
		// New image (b)
		newImageB := RealImage("Image B aligned", 4, newWidth, newHeight);
		newImageB = 0; //blank;
		number imageBXCoord = (offsetRectangleLeft >= 0) ? offsetRectangleLeft : 0 ;
		number imageBYCoord = (offsetRectangleTop >= 0) ? offsetRectangleTop : 0;
		newImageB [imageBYCoord, imageBXCoord , imageBYCoord + bysize -1, imageBXCoord + bxsize -1] = imageb [0,0,bysize-1, bxsize-1];

		// change titles
		newImageA.setname(getname(imagea) + " Aligned");
		newImageB.setname(getname(imageb) + " Aligned");
	}
	
	/* Used for difficult to align images such as ring integrations.
		Spatially averages the images before Cross Correlation, which is then also spatially averaged.
		Processor intensive. May not work on the 2100 computer as it throws odd error messages when averaging sometimes.
			Will document errors more later.
	*/
	void findImageShiftAdvanced(object self, image refIm, image newIm, number &XShift, number &YShift){
		number mpV, mpX, mpY, xSize, ySize;
		GetSize( refIm, xSize, ySize );
		string title1 = refIm.GetName();
		string title2 = newIm.GetName();
		if(debugMode==1){result("\n\tFinding image shifts for " + title1 + " and " + title2);}
		image filteredrefIm = MedianFilter(refIm,3,5);
		filteredrefIm.ImageSetName("Reference Image");
		image filterednewIm = MedianFilter(newIm,3,5);
		filterednewIm.ImageSetName("Second Image");
		image cc := CrossCorrelate( filteredrefIm, filterednewIm ); // New correlation image.
		image filteredcc = MedianFilter(cc, 3,5);
		mpV = max( filteredcc, mpX, mpY ); // Finds coords of maximum bright point in correlation image.
		XShift = mpX - trunc( xSize / 2 ); // Shift in x-pixel coord.
		YShift = mpY - trunc( ySize / 2 ); // Shift in y-pixel coord.
		if(debugMode==true){result("\n\txShift = " + xShift + "\n\tyShift = " + yShift);}
	}
	
	/* Return image arrays listing the relative X/Y shifts of the images from an image list tag group.
		Also record the display settings to be applied to the aligned images.
		Image list is an indexed TagList of imageIDs such as created from makeImageIDList().
	*/
	void findAllShifts (object self, TagGroup imageList, image &XShiftDataArray, image &YShiftDataArray, image &contrastSettings, \
		number &maxXShift, number &maxYShift, number &minXShift, number &minYShift){
		number totalImages = taggroupcounttags(imageList);
		if(debugMode==true){result("\nFinding shifts for a set of " + totalImages + " images.");}
		number i
		number totalXShift = 0;
		number totalYShift = 0;
		XShiftDataArray := RealImage("XShift Data Array", 4,totalImages,1);
		YShiftDataArray := RealImage("YShift Data Array", 4,totalImages,1);
		contrastSettings := RealImage("Contrast Data Array", 4,totalImages,2);
		// Find the images shifts
		for(i=0; i < (totalImages-1); i++){
			if(debugMode == true){result("\n\tProcessing image " + i);}
			number Image1ID, Image2ID, XShift, YShift;
			TagGroupGetIndexedTagAsNumber( imageList, i, image1ID );
			TagGroupGetIndexedTagAsNumber( imageList, i+1, image2ID );
			image Im1 := GetImageFromID(Image1ID);
			image Im2 := GetImageFromID(Image2ID);
			self.findImageShiftAdvanced(Im1, Im2, XShift, YShift) // Run the Advanced Alignment code to find numbers.
			totalXShift += XShift; // Keep a running total of the relative shifts
			totalYShift += YShift;
			setPixel(XShiftDataArray, (i+1), 0, totalXShift)
			setPixel(YShiftDataArray, (i+1), 0, totalYShift)
			// Record the Contrast settings for displays later
			number highContrast1, lowContrast1, highContrast2, lowContrast2;
			ImageDisplay Im1Display = Im1.ImageGetImageDisplay( 0 );
			ImageDisplay Im2Display = Im2.ImageGetImageDisplay( 0 );
			Im1Display.ImageDisplayGetContrastLimits( lowContrast1, highContrast1 )
			Im2Display.ImageDisplayGetContrastLimits( lowContrast2, highContrast2 )
			contrastSettings.setPixel(i,0, lowContrast1)
			contrastSettings.setPixel(i,1, highContrast1)
			contrastSettings.setPixel(i+1,0, lowContrast2)
			contrastSettings.setPixel(i+1,1, highContrast2)
		}
		//Find the maximum shift values.
		ImageCalculateMinMax( XShiftDataArray, 0, 0, minXShift, maxXShift );
		if(debugMode==true){result("\n\tmaxXShift = " + maxXShift + "\n\tminXShift = " + minXShift);}
		ImageCalculateMinMax( YShiftDataArray, 0, 0, minYShift, maxYShift );
		if(debugMode==true){result("\n\tmaxYShift = " + maxYShift + "\n\tminYShift = " + minYShift);}
		// minX/YShifts need to be either 0 or the largest -ve number.
		// maxX/YShifts need to be either 0 or the largest +ve number
		
		maxXShift = tert( (maxXShift >= 0), maxXShift, 0 );
		minXShift = tert( (minXShift <= 0), minXShift, 0 );
		maxYShift = tert( (maxYShift >= 0), maxYShift, 0 );
		minYShift = tert( (minYShift <= 0), minYShift, 0 );
		if(debugMode==true){
			result("\n\tCalculating magnitudes...\n\tmaxXShift = " + maxXShift + "\n\tminXShift = " + minXShift);
			result("\n\tmaxYShift = " + maxYShift + "\n\tminYShift = " + minYShift);
			result("\nAll Shifts found.");
		}
	}

	/* To align images without losing any data we must make a new version of them.
			They are their original size + |maxXShift| + |minXShift| in X,  + |maxYShift| + |minXShift| in Y.
			The extra space will be filled with black space (0) based on their shift.
			Returns a single image.
			If the images are different sizes then max/min values will need adjusting.
	*/
	image createAlignedImage (object self, image thisImage, number minXShift, number minYShift, number maxXShift,\
			number maxYShift, number XShift, number YShift) {
		if(debugMode==true){result("\nCreating an aligned image from ");}
		number xSize, ySize;
		GetSize( thisImage, xSize, ySize );
		number newSizeX =  xSize + abs(maxXShift) + abs(minXShift);
		number newSizeY = ySize + abs(maxYShift) + abs(minYShift);
		string thisImageTitle;
		thisImage.GetName(thisImageTitle);
		if(debugMode==true){result(thisImageTitle);}
		
		// Make a new canvas to position the image
		image alignedImage = RealImage( "Aligned", 4, newSizeX, newSizeY );
		alignedImage = 0;
		
		// The placement of the image on the new canvas
		number top,left,bottom,right;
		left = abs(minXShift) + XShift;
		if(debugMode==true){result("\n\tLeft = " + left);}
		top = abs(minYShift) + YShift ;
		if(debugMode==true){result("\n\tTop = " + top);}
		bottom = top + ySize;
		right = left + xSize;
		alignedImage [ top, left, bottom, right ] = thisImage; // insert image

		alignedImage.ImageSetName(thisImageTitle + "Aligned");
		copyTags(alignedImage, thisImage);
		copyScale(alignedImage, thisImage);
		return alignedImage;
	}

	/* Function to align images from an indexed TagList of image IDs. Uses Automatic searching, not manual.
		Runs the findAllShifts() function to get the numbers.
		Cycle through images and make them larger to make them align with each other
		Return a tag group of image IDs for the new aligned images.
	*/
	TagGroup autoAlignAllImages (object self, TagGroup imageList){
		if(debugMode==true){result("\nAligning a set of images...");}
		TagGroup alignedImageList = NewTagList();
		number maxXShift, maxYShift, minXShift, minYShift;
		image XShiftDataArray, YShiftDataArray, contrastSettings;
		self.findAllShifts (imageList, XShiftDataArray, YShiftDataArray, contrastSettings, \
		maxXShift, maxYShift, minXShift, minYShift);
		number totalImages = taggroupcounttags(imageList);
		if(debugMode==true){result("\n\tFound " + totalImages + " images.");}
		number i;
		for(i=0; i < totalImages; i++){
			number ImageID, XShift, YShift, xSize, ySize;
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			XShift = getPixel( XShiftDataArray, i, 0 );
			YShift = getPixel( YShiftDataArray, i, 0 );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			result("\n\tProcessing " + imageTitle)
			GetSize(thisImage, xSize, ySize);
			image alignedImage :=  self.createAlignedImage (thisImage, minXShift, minYShift, maxXShift, maxYShift, XShift, YShift);
			showImage(alignedImage);
			// Add aligned image to aligned image list tag group for further processing.
			number alignedImageID = alignedImage.ImageGetID();
			alignedImageList.TagGroupInsertTagAsNumber( infinity(), alignedImageID );
		}
		if(debugMode==true){result("\nAll Images Aligned.");}
		return alignedImageList;
	}

	/* Creates an average image from a set of aligned images
		the list of image IDs is the output of the alignAllImages() function
		Useful to get a quick idea of if the alignment has worked without external editting software
	*/
	image createAverageAlignedImage (object self, TagGroup alignedImageList) {
		number totalImages = taggroupcounttags(alignedImageList);
		number i, imageID;
		TagGroupGetIndexedTagAsNumber( alignedImageList, 0, imageID );
		image averageImage = GetImageFromID( imageID );
		for(i=1;i < totalImages;i++){
			TagGroupGetIndexedTagAsNumber( alignedImageList, i, imageID );
			image thisImage = GetImageFromID( imageID );
			averageImage += thisImage;
		}
		averageImage = averageImage / totalImages;
		// averageImage := MedianFilter(averageImage, 3,5); //Do we need the extra averaging?
		averageImage.ImageSetName("Averaged Aligned Image");
		return averageImage;
	}

	//----------------------------------------
	//		Manual Alignment Functions
	//----------------------------------------
	
	/* This function needs to be run as its own thread with the startAligning() method.
		It will show an image display and begin switching between the two images intermittently.
		The images will be aligned by user input on the buttons of the dialog
		The thread will be stuck in a While loop during the process and will wait for a signal to stop.	
	*/
	void manualalign(object self)
	{
		// Set up the images for alignment
		image newImageA, newImageB
		self.makeOffsetImages(imagea, imageb, newImageA, newImageB, 0, 0);

		image displayimage := newImageA
		showimage(displayimage)
		
		imagedisplay dispdisp=displayimage.imagegetimagedisplay(0)
		dispdisp.imagedisplaysetdoautosurvey(0)
		
		setname(displayimage, "Manual Aligment")
		offsetx = 0
		offsety = 0;
		number lastOffsetx = 0;
		number lastOffsety = 0;
		number switch, counter;

		image alignimage=newImageB
		number moderadio=dlggetvalue(self.lookupelement("moderadio"))
	
		self.lookupelement("crosscorrlabel").dlgtitle("Cross Correl'n: ")
		self.lookupelement("xoffsetlabel").dlgtitle("X Offset: ")
		self.lookupelement("yoffsetlabel").dlgtitle("Y Offset: ")
		self.validateview()

		string delaytitle=dlggettitle(self.lookupelement("speedlabel"))
		number delay=val(right(delaytitle,1))
		
		number low, high;
		dispdisp.ImageDisplayGetContrastLimits( low, high )

		number OSTicksPerSecond = GetOSTicksPerSecond();
		number OSTickCount = GetOSTickCount();
		number targetTick = OSTickCount + (OSTicksPerSecond * (1/delay));

		// Variable to set true when the thread needs to be terminated
		do_break=false
		// Loop the thread until a stop signal is encountered
		while( true )
			{
				try {
					moderadio=dlggetvalue(self.lookupelement("moderadio"))
					OSTickCount = GetOSTickCount();
					self.lookupelement("xoffsetlabel").dlgtitle("X Offset: "+format((offsetx*-1),"%3.1f")) // NB oFfsets are x -1 as the values displayed in the
					self.lookupelement("yoffsetlabel").dlgtitle("Y Offset: "+format((offsety*-1),"%3.1f")) // dialog are the shifts of B relative to A. offsetx and y are the corretions to align them
					self.lookupelement("sensitivitylabel").dlgtitle("Sensitivity: " + movementSensitivitySetting)
					self.validateview()
					// The display mode is set in the manual alignment box setting 0=alternate, 1=simulateous
					number newX, newY;
					if(moderadio==0)
					{
						// alternate between the two images when the offset is changed or when the timer has reached a certain value
						if( (OSTickCount >= targetTick) )
						{
							delaytitle=dlggettitle(self.lookupelement("speedlabel"));
							delay=val(right(delaytitle,1));
							OSTickCount = GetOSTickCount();
							targetTick = OSTickCount + (OSTicksPerSecond * (1/delay));
							// create the new images based on offset change
							self.makeOffsetImages(imagea, imageb, newImageA, newImageB, offsetx, offsety);
							// switch image tracker
							if(switch==0) switch=1
							else switch=0
							// display correct new image
							if(switch==0){
								getSize(newImageA, newX, newY);
								ImageResize( displayImage, 2, newX, newY );
								displayimage = newImageA;
								// Change contrast settings for this image
								number imageAminContrastValue, imageAmaxContrastValue;
								// DLGGetValue( object frame, string identifier, number &val )
								self.dlgGetValue("imageAminContrast", imageAminContrastValue)
								self.dlgGetValue("imageAmaxContrast", imageAmaxContrastValue)							
								ImageDisplaySetContrastLimits(dispdisp, imageAminContrastValue, imageAmaxContrastValue)
							}
							else { 
								getSize(newImageB, newX, newY);
								ImageResize( displayImage, 2, newX, newY );
								displayimage = newImageB
								number imageBminContrastValue, imageBmaxContrastValue;
								self.dlgGetValue("imageBminContrast", imageBminContrastValue)
								self.dlgGetValue("imageBmaxContrast", imageBmaxContrastValue)
								ImageDisplaySetContrastLimits(dispdisp, imageBminContrastValue, imageBmaxContrastValue)
							}
							zoomImage(displayimage);
							updateimage(displayimage);
						}
					}		
					else if( (OSTickCount >= targetTick) )// Simulataneous mode is on instead
					{
						delaytitle=dlggettitle(self.lookupelement("speedlabel"));
						delay=val(right(delaytitle,1));
						OSTickCount = GetOSTickCount();
						targetTick = OSTickCount + (OSTicksPerSecond * (1/delay));
						// create the new images based on offset change
						self.makeOffsetImages(imagea, imageb, newImageA, newImageB, offsetx, offsety);
						getSize(newImageA, newX, newY);
						ImageResize( displayImage, 2, newX, newY );
						displayimage = (newImageA + newImageB) / 2;
						// Change contrast settings for this image
						number imageAminContrastValue, imageAmaxContrastValue;
						// DLGGetValue( object frame, string identifier, number &val )
						self.dlgGetValue("imageAminContrast", imageAminContrastValue)
						self.dlgGetValue("imageAmaxContrast", imageAmaxContrastValue)							
						ImageDisplaySetContrastLimits(dispdisp, imageAminContrastValue, imageAmaxContrastValue);
						zoomImage(displayimage);
						updateimage(displayimage);
					}
				}
				Catch // If any exceptions occur or a stop signal is received stop the thread.
				{
					// A break was encountered, set the tilt back to its starting point and break out of the Try/Catch loop
					do_break = true
					stopsignal.resetsignal()
					Break
				}
				// Stop the thread by breaking out of the function. Otherwise the start signal is reset to keep the thread
				// running
				If(do_break) break
			}
		// Delete temporary images and renable dialog buttons and radios
		deleteimage(displayimage)
		deleteimage(alignimage)
		self.cleanReferences()
		result("\nAlignment loop terminated");
	}

	// Loads two images to be aligned.
	void loadImages(object self, image &imageaExternal, image &imagebExternal)
	{
		imagea := imageaExternal;
		imageb := imagebExternal;
		// Get the image sizes.
		number axsize, bxsize, aysize, bysize
		getsize(imagea, axsize, aysize)
		getsize(imageb, bxsize, bysize)
		if(debugMode==1){result("\n\tLoading Images: ");}
		
		// Update the dialog with the image names
		string imageaname=getname(imagea)
		string imagebname=getname(imageb)
		if(debugMode==1){result(imageaname + " and " + imagebname);}
		
		number alen=len(imageaname)
		number blen=len(imagebname)

		if(alen>24) imageaname=mid(imageaname,0,23)
		if(blen>24) imagebname=mid(imagebname,0,23)

		self.lookupelement("imagealabel").dlgtitle("Image A: "+imageaname)
		self.lookupelement("imageblabel").dlgtitle("Image B: "+imagebname)
		if(debugMode==1){result("\n\tApplied names to dialog ");}
		
		// Set the contrast limits on the dialgoue fields. Used to make the images viewable if they have very different brightnesses.
		number imageAminContrastValue, imageAmaxContrastValue, imageBminContrastValue, imageBmaxContrastValue;
		ImageDisplay imageDispA = imagea.ImageGetImageDisplay( 0 );
		ImageDisplay imageDispB = imageb.ImageGetImageDisplay( 0 );
		ImageDisplayGetContrastLimits(imageDispA, imageAminContrastValue, imageAmaxContrastValue)
		ImageDisplayGetContrastLimits(imageDispB, imageBminContrastValue, imageBmaxContrastValue)
		self.dlgvalue("imageAminContrast", imageAminContrastValue)
		self.dlgvalue("imageAmaxContrast", imageAmaxContrastValue)
		self.dlgvalue("imageBminContrast", imageBminContrastValue)
		self.dlgvalue("imageBmaxContrast", imageBmaxContrastValue)

		// Create the stop and start signals for the thread
		startsignal=NewSignal(0)
		stopsignal=NewSignal(0)
		
		movementSensitivity = 32;
		movementSensitivitySetting = 5;
	}
	
	//----------------------------------------
	//		Dialog Control Functions
	//----------------------------------------
	
	// Responds when the + button is pressed to increase the delay between alternating images
	taggroup increasespeed(object self)
	{
		string delaytitle=dlggettitle(self.lookupelement("speedlabel"))
		number delay=val(right(delaytitle,1))

		delay=delay+1
		if(delay>9) delay=9
		self.lookupelement("speedlabel").dlgtitle("Delay: "+delay)
	}
	// Responds when the - button is pressed to decrease the delay between alternating images
	taggroup decreasespeed(object self)
	{
		string delaytitle=dlggettitle(self.lookupelement("speedlabel"))
		number delay=val(right(delaytitle,1))

		delay=delay-1
		if(delay<1) delay=1
		self.lookupelement("speedlabel").dlgtitle("Delay: "+delay)
	}	

	// Starts the manual alignment function as its own thread.
	void startAligning(object self)
	{
		// Call the function to start the thread
		scanison=true
		self.startthread("manualAlign")
	}	
		
	void offsetUpButtonPress(object self)
	{
		offsety += movementSensitivity;
	}
	void offsetDownButtonPress(object self)
	{
		offsety -= movementSensitivity;
	}
	void offsetLeftButtonPress(object self)
	{
		offsetx -= movementSensitivity;
	}
	void offsetRightButtonPress(object self)
	{
		offsetx += movementSensitivity;
	}
	
	void sensitivityUpPress(object self)
	{
		movementSensitivitySetting +=1;
		movementSensitivitySetting = (movementSensitivitySetting > 10) ? 10 : movementSensitivitySetting;
		movementSensitivity = 2 ** movementSensitivitySetting;
	}
	
	void sensitivityDownPress(object self)
	{
		movementSensitivitySetting -= 1;
		movementSensitivitySetting = (movementSensitivitySetting < 0) ? 0 : movementSensitivitySetting;
		movementSensitivity = 2 ** movementSensitivitySetting;
	}
	
	void radiochanged(object self, taggroup tg)
	{
		// null changed method
	}

	//----------------------------------
	//		Dialog Construction
	//----------------------------------
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
	}

	// this function creates a button taggroup which returns the taggroup 'box' which is added to
	// the dialog in the createdialog function.
	taggroup MakeSourceImagesBox(object self)
	{
		// Creates a box in the dialog which surrounds the button

		taggroup box_items
		taggroup box=dlgcreatebox("  Source Images  ", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		// Create the labels for the image names
		
		taggroup imagealabel=dlgcreatelabel("Image A:                                 ").dlgidentifier("imagealabel")
		taggroup imageblabel=dlgcreatelabel("Image B:                                 ").dlgidentifier("imageblabel")
		taggroup labelgroup=dlggroupitems(imagealabel, imageblabel).dlgtablelayout(1,2,0)

		// Create inputs for contrast settings of each image
		taggroup imageAminContrast = DLGCreateIntegerField( 0, 8 ).dlgidentifier("imageAminContrast");
		taggroup imageAmaxContrast = DLGCreateIntegerField( 100, 8 ).dlgidentifier("imageAmaxContrast");
		taggroup imageAContrastFields=dlggroupitems(dlgcreatelabel("Contrast A:"), imageAminContrast, dlgcreatelabel("-"), imageAmaxContrast).dlgtablelayout(4,1,0)
		taggroup imageBminContrast = DLGCreateIntegerField( 0, 8 ).dlgidentifier("imageBminContrast");
		taggroup imageBmaxContrast = DLGCreateIntegerField( 100, 8 ).dlgidentifier("imageBmaxContrast");
		taggroup imageBContrastFields=dlggroupitems(dlgcreatelabel("Contrast B:"), imageBminContrast, dlgcreatelabel("-"), imageBmaxContrast).dlgtablelayout(4,1,0)
		
		// Put them all together
		taggroup imagegroup = dlggroupitems(labelgroup, imageAContrastFields, imageBContrastFields);
		box_items.dlgaddelement(imagegroup)
		return box
	}

	// Create the Manual Alignment box
	taggroup makemanualbox(object self)
	{
		taggroup manualboxitems
		taggroup manualbox=dlgcreatebox(" Alignment Control ", manualboxitems).dlginternalpadding(4,6)
		taggroup startAlignmentButton=dlgcreatepushbutton("Start Alignment", "onStartClick").dlgidentifier("startAlignmentButton");
		manualboxitems.dlgaddelement(startAlignmentButton)
		
		// Create the manual display mode radio items
		taggroup moderadioitems
		number moderadio
		getpersistentnumbernote("Align Images:Default Values:Alternate Radio",moderadio)
		taggroup moderadiolist=dlgcreateradiolist(moderadioitems, moderadio, "radiochanged").dlgidentifier("moderadio").dlgexternalpadding(6,0)
		moderadioitems.dlgaddelement(dlgcreateradioitem("Alternate",0))
		moderadioitems.dlgaddelement(dlgcreateradioitem("Simultaneous",1))
		number delay
		getpersistentnumbernote("Align Images:Default Values:Delay",delay)
		// Create the control for the speed of oscillation
		taggroup increasespeed=dlgcreatepushbutton("+","increasespeed").dlgidentifier("increasespeed")
		taggroup decreasespeed=dlgcreatepushbutton("-","decreasespeed").dlgidentifier("decreasespeed").dlginternalpadding(2,0)
		taggroup speedlabel=dlgcreatelabel("Delay: "+delay).dlgidentifier("speedlabel")
		taggroup buttongroup=dlggroupitems(increasespeed, decreasespeed).dlgtablelayout(2,1,0)
		taggroup speedgroup=dlggroupitems(buttongroup, speedlabel).dlgtablelayout(2,1,0).dlgexternalpadding(6,0)
		// Create alignment offset buttons
		taggroup offsetRightButton=dlgcreatepushbutton(">", "offsetRightButtonPress").dlgidentifier("offsetRightButton");
		taggroup offsetLeftButton=dlgcreatepushbutton("<", "offsetLeftButtonPress").dlgidentifier("offsetLeftButton");
		taggroup offsetUpButton=dlgcreatepushbutton("^", "offsetUpButtonPress").dlgidentifier("offsetUpButton");
		taggroup offsetDownButton=dlgcreatepushbutton("v", "offsetDownButtonPress").dlgidentifier("offsetDownButton");
		taggroup sensitivityUpButton=dlgcreatepushbutton("x2", "sensitivityUpPress").dlgidentifier("sensitivityUpButton");
		taggroup sensitivityDownButton=dlgcreatepushbutton("/2", "sensitivityDownPress").dlgidentifier("sensitivityDownButton");
		taggroup sensitivitylabel=dlgcreatelabel("Sensitivity: "+ sqrt(movementSensitivity)).dlgidentifier("sensitivitylabel")
		taggroup blankspace = dlgcreatelabel("");
		taggroup offsetButtons = dlggroupitems(dlggroupitems(blankspace, offsetUpButton, blankspace).dlgtablelayout(3,1,0),\
			dlggroupitems(offsetLeftButton, blankspace, offsetRightButton).dlgtablelayout(3,1,0),\
			dlggroupitems(blankspace, offsetDownButton, blankspace).dlgtablelayout(3,1,0) ).dlgtablelayout(1,3,0);
		taggroup sensitivityButtons = dlggroupitems(sensitivityUpButton, sensitivityDownButton, sensitivitylabel).dlgtablelayout(3,1,0)
		taggroup bottommeasuregroup=dlggroupitems(moderadiolist, speedgroup, offsetButtons, sensitivityButtons).dlgtablelayout(1,4,0)
		manualboxitems.dlgaddelement(bottommeasuregroup)
		return manualbox
	}

	// Create the results box
	taggroup makeresultsbox(object self)
	{
		taggroup resultsboxitems
		taggroup resultsbox=dlgcreatebox(" Alignment Measurement ",resultsboxitems).dlginternalpadding(12,6)
		taggroup offsetxlabel=dlgcreatelabel("X Offset:                         ").dlgidentifier("xoffsetlabel").dlganchor("West")
		taggroup offsetylabel=dlgcreatelabel("Y Offset:                         ").dlgidentifier("yoffsetlabel").dlganchor("West")
		taggroup crosscorrlabel=dlgcreatelabel("Cross Correl'n:                         ").dlgidentifier("crosscorrlabel").dlganchor("West")
		taggroup resultslabelgroup=dlggroupitems(offsetxlabel,offsetylabel,crosscorrlabel).dlgtablelayout(1,3,0)
		resultsboxitems.dlgaddelement(resultslabelgroup)
		return resultsbox
	}

	// This function creates the dialog tag group, drawing togther the various boxes which make it up
	taggroup CreateDialog(object self)
	{
		TagGroup dialog_items;	
		TagGroup dialog = DLGCreateDialog("Image Alignment", dialog_items)
		dialog_items.dlgaddelement( self.MakeSourceImagesBox() );
		dialog_items.dlgaddelement( self.MakeManualBox() );
		dialog_items.dlgaddelement( self.MakeResultsBox() );
		return dialog;
	}

	/* Create the Dialog. Must be called before showAlignmentDialog. Uses the CreateDialog Tag group output */
	void generateDialog(object self){
		self.super.init( self.CreateDialog() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showAlignmentDialog(object self){
		// Display and position the dialog
		number xpos, ypos;
		getpersistentnumbernote("Align Images:Dialog Position:Left",xpos);
		getpersistentnumbernote("Align Images:Dialog Position:Top",ypos);

		//self.display("Align Images") // display dialog as modeless; the calling script will continue after it has been created
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// In order to make function calls after this we will need a 'start' button on the controls.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// The constructor
	alignmentdialog(object self)
	{
		AlignmentID = self.ScriptObjectGetID();
	}

	// The destructor (does nothing)
	~alignmentdialog(object self)
	{
		result("\nAlignment Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}
		
	// If the dialog is closed, the thread is stopped
	void abouttoclosedocument(object self)
	{
		if(scanison) 
		{
			result("\nAlignment thread stopped before destruction of dialog.");
		}
	}
	
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Alignment Dialog");}
	}
	
	// Function used to align two images. The images are inputted and their offsets are output by the function. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	number alignTwoImages(object self, image imageaInput, image imagebInput, number &offsetXExternal, number &offsetYExternal)
	{
		imagea := imageaInput;
		imageb := imagebInput;
		if(debugMode==1){result("\nCreating child dialog Object");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showAlignmentDialog();	// Display the child with Pose() system
			// When the child's Record alignment button is pressed, give the offsets to this (parent) object
			// Use the original AlignmentID, which was not changed during cloning (?);
			//	childDialog.loadImages(imageaInput, imagebInput); // code to Add images to the child dialog
		if(useValues == 1){
			childDialog.getOffsets(offsetXExternal, offsetYExternal); // load the offsets into the external function. Note: The dialog is still in memory and can be referenced. No idea how to get rid of it actually. As long as the thread closes we should be fine.
		}
		childDialog.stopLoop(); // Stop the thread looping the images
		childDialog = NULL; // NULL the childDialog so it can go out of scope.
		return useValues;
	}
	
	void onStartClick(object self){
		if(debugMode==1){result("\nLoading child dialog");}
		self.loadImages(imagea, imageb); // code to Add images to the child dialog
		if(debugMode==1){result("\nStarting Alignment Process");}
		self.startAligning();
	}
	
}


