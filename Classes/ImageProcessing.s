// ********************************************************************************
//  Image Processing class.
// ********************************************************************************
// Taking this outside of Toolkit because it is getting crowded.
// Insert this class before the toolkit.
// Do not add any online-only functions. Used for data processing, not live imaging.

// NOT updated to use image tags or image set data.

class ImageProcessing
{
	number ImageProcessingID; // the ID of this object
	number ToolkitID; // the ID of the toolkit
	number dataObjectID;
	number imageSetToolsID;
	number imageAlignmentDialogID;
	number debugMode;	

	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID, number theAlignmentDialogID){
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		imageSetToolsID = theImageSetToolsID;
		imageAlignmentDialogID = theAlignmentDialogID;
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Image Processing Object");}
	}
	
		/* Prints out the stored variables in the object */
	void printAll(object self)
	{
		result("\n\nImageProcessing Debug Values")
		result("\n------------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ImageProcessingID +\
			"\n DebugMode: " + debugMode +\
			"\n ToolkitID: " + ToolkitID +\
			"\n DataObjectID: " + DataObjectID +\
			"\n ImageSetToolsID: " + ImageSetToolsID +\
			"\n imageAlignmentDialogID: " + imageAlignmentDialogID;
		result(textstring);
		result("\n-------End----------------")
	}
	
	
	
	/* Finds the level of brightness needed to filter out the less bright pixels
		Values to customize in this function:
		targetPercentage = The % of total counts at which brightness is declared. e.g. 99 will return the brightness level that includes only the top 1% brightest pixels.
	*/
	number findBackgroundBrightness (object self, image thisImage, number targetPercentage)
	{
		string imageName = thisImage.ImageGetName()
		if(debugMode==true){result("\nStarting background brightness search for top " + targetPercentage + "% brightest pixels in " + imageName + "... ");}
		number imageHeight, imageWidth;
		getSize(thisImage, imageWidth, imageHeight);
		number minimum = floor(min(thisImage));
		number maximum = ceil(max(thisImage));
		number range = maximum - minimum;
		minimum = round(minimum);
		maximum = round(maximum);
		number n = imageHeight * imageWidth;
		if(debugMode==true){result("\nThis Image has " + n + " pixels ranging from " + minimum + " to " + maximum + " in brightness.");}
		number justBlack; // do not count pixels if they are simply black because they have been added by the alignment system
		image processImage = BinaryImage ("Checking for black pixels", imageWidth, imageHeight );
		processImage = tert ( (thisImage == 0), 1, 0 );
		justBlack = sum(processImage);
		if(debugMode==true){result("\nThere are " + justBlack + " black pixels in the image. These will not be counted in the thresholding.");}
		
		number targetNumber = ((100 - targetPercentage) / 100) * (n - justBlack)
		if(debugMode==true){result("\nTarget number of pixels for " + (100 - targetPercentage) + "% is " + targetNumber);}
		number highLevel = maximum;
		number lowLevel = minimum;
		number found = 0;
		number timeCheck = 0;
		while( (found==0) && (timeCheck < 50) ){
			number newLevel = floor(lowLevel + ( (highLevel - lowLevel) / 2 )); // half way between, but still integer
			image processImage = BinaryImage ("Processing Level " + newLevel, imageWidth, imageHeight );
			processImage = tert ( (thisImage > newLevel), 1, 0 );
			number count = sum(processImage);
			if(count >= targetNumber){
				lowLevel = newLevel;
			} else {
				highLevel = newLevel;
			}
			if( (highLevel - lowLevel) <= 2){
				found = 1;
			}
			timeCheck ++
		}
		if(debugMode==true){result("\nLevels found are " + lowLevel + " and " + highLevel);}
		if(debugMode==true){result("\n" + targetPercentage + "% of the pixels are below " + highLevel + " in brightness.");}
		if(debugMode==true){result(lowLevel);}
		return lowLevel;
	}
	
	
	//****************************************************
	// BINARY IMAGE PROCESSING FUNCTIONS
	//****************************************************

	// Returns a binary image that has been thresholded and despeckled.
		// thisImage = input image
		// targetPercentage = The percentage of the pixels that will be ignored, based on their brightness.
			// e.g. 99 would select only the brightest 1% of pixels to appear on the map.
	image levelAndDespeckleImage(object self, image thisImage, number targetPercentage)
	{
		image originalImage = thisImage; // make copy to avoid affecting original image
		number xsize, ysize;
		number xMin, yMin, xMax, yMax, minimum, maximum; // for debug
		getSize(originalImage, xsize, ysize);
		number dataType = ImageGetDataType( originalImage );
		// the image should be the type directly from the microscope. Tthis is integer, 4 bytes, unsigned.
		if(dataType!=7){
			ImageChangeDataType(originalImage, 7);
		}

		// Find the brightness level to isolate the desired data.
		number Threshold = self.findBackgroundBrightness(originalImage, targetPercentage);

		image binImage = tert( ( originalImage > Threshold), 1 , 0 );
		
		ImageChangeDataType(binImage, 2); // change to real image to do median work for despeckle.
		image despeckledImage = MedianFilter( binImage, 3, 3 );
		
		number despecThreshold = 0.34 // The threshold used to remove the speckles. 0.34 = needs 3 adjacent pixels
		/* The mean of the nearest 9 pixels needs to be:
			Sum of Pixels	Mean value
				9				1
				8				0.888
				7				0.777
				6				0.666
				5				0.555
				4				0.444
				3				0.333
				2				0.222
				1				0.111
				0				0
		*/

		image mapImage = tert( despeckledImage < despecThreshold, 0 , 1 );
		ImageChangeDataType(mapImage, 14); // change to Binary image
		return mapImage;
	}

	/* Function to convert binary image into RGBA image for editting by external software
		The transparency does not work at the moment but I am using it anyway for possible future solutions.
		Saves the image as a Gif file which is usually about 6Kb in size. Nice and small, and why I did not use Tiffs.
	*/
	void transparencyExport(object self, image &binaryImage, string saveDirectory)
	{
		number width, height;
		GetSize(binaryImage, width, height);
		string imageName = ImageGetName(binaryImage);
		image transparencyImage = RGBImage( imageName, 4, width, height );
		//RGBNumberExpression rgba( RealNumberExpression red, RealNumberExpression green, RealNumberExpression blue, RealNumberExpression alpha )
		transparencyImage = rgba(binaryImage * 255, binaryImage * 255, binaryImage * 255, binaryImage * 255);
		string filePath = PathConcatenate (saveDirectory, imageName );
		SaveAsGif( transparencyImage, filePath );
	}

	/* Create a map using aligned binaries and an aligned bright field image. List all images by ID in an imageList*/
	image createMap(object self, Taggroup imageList){
		image originalBaseImage, image2;
		if(!GetTwoImagesWithPrompt("Select the Bright Field Image", "Choose Base Image", originalBaseImage, image2 )){
			exit(0);
		}
		number width, height, baseImageID;
		baseImageID = originalBaseImage.ImageGetID();
		GetSize(originalBaseImage, width, height);
		string baseImageName = ImageGetName(originalBaseImage);
		string mapImageName = baseImageName + " Composite Map";
		image compositeImage = RGBImage( mapImageName, 4, width, height );
		// Set thresholds using display settings for base image
		imageDisplay baseImageDisplay = originalBaseImage.ImageGetImageDisplay(0);
		number minCon, maxCon;
		BaseImageDisplay.ImageDisplayGetContrastLimits(minCon, maxCon);
		number range = maxCon-minCon;
		number scaleFactor = 255 / range
		result("\nMinCon = " + minCon + ", MaxCon = " + maxCon);
		result("\nScale Factor = " + scaleFactor + ", Range = " + range);
		image baseImage = tert( (originalBaseImage < minCon), minCon, originalBaseImage);
		baseImage = tert( (originalbaseImage > maxCon), maxCon, baseImage);
		baseImage = baseImage - minCon;
		showImage(baseImage);
		
		compositeImage = rgb(baseImage*scaleFactor, baseImage*scaleFactor, baseImage*scaleFactor);
		showImage(compositeImage);
		result("\nmaking composite image map from a set of images...")
		number totalImages = taggroupcounttags(imageList);
		result("\n\tFound " + totalImages + " images.");
		number i;
		rgbNumber mapColor = rgb(255,0,0);
		for(i=0; i < totalImages; i++){
			number ImageID
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			if(ImageID == baseImageID){
				continue; // It is the base image, ignore it.
			}
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			number dataType = ImageGetDataType( thisImage );
			// the image should be a binary type. DM will open gifs as an integer image but not set it to binary automatically.
			if(dataType!=14){
				ImageChangeDataType(thisImage, 14); // change to Binary image
			}
			compositeImage = tert( (thisImage==1), mapColor, compositeImage );
			compositeImage.SetName(mapImageName);
			copyTags(compositeImage, originalBaseImage);
			copyScale(compositeImage, originalBaseImage);
		}
		showImage(compositeImage);
		result("\nComposite map generated.")
	}
	
	/* This function creates a tag group to be processed further by other image processing functions.
		returns DFList tag group formatted as so
			DFList	:	UseImageID
						BaseImage
						Directory
						Spot#### : 	HIGHER
									MIDDLE
									LOWER	
	 */
	TagGroup makeDFFileListGroup(object self)
	{
		string newDir;
		TagGroup DFList = NewTagGroup();
		if(!SaveAsDialog("","Press Save to select this directory", newDir))
		{
			throw("User cancelled operation: No directory selected");
		}
		
		//string PathExtractDirectory( string path, number path_type )
			// returns the directory portion of the given path according to the path_type parameter. The path_type variable should be 0.
		newDir = PathExtractDirectory( newDir, 0 ); // newDir is now the directory path
		if(debugMode==true){result("\nDirectory '" + newDir + "' selected.");}
		TagGroupCreateNewLabeledTag( DFList, "Directory" ); // Creates the tag for the file directory
		DFList.TagGroupSetTagAsString( "Directory" , newDir ); // sets the directory
		TagGroupCreateNewLabeledTag( DFList, "UseImageID" ); // Creates the tag for UseImageID tag.
		DFList.TagGroupSetTagAsNumber( "UseImageID" , 0 ); // Must be 0 since it is a file list looking in a directory.
		TagGroupCreateNewLabeledTag( DFList, "ShadowMode" ); // Creates the tag for the shadowing mode. 0 = off, 1 = on.
		
		//TagGroup GetFilesInDirectory( string directory_name, number search_flags )
			// returns a list of string tags with the files in directory_name.
			// The search_flags parameter can be a 1 to include only files; 2 to include only directories; or 3 to include both files and directories.
		TagGroup fileList = GetFilesInDirectory(newDir, 1);
		// The tag list is indexed from 0 and each entry has an entry called "Name"
		Number fileListLength = taggroupcounttags(fileList)
		if(debugMode==true){result("\nLength of fileList: " + fileListLength);}
		number i
		string fileName
		TagGroup fileGroup
		for(i=0; i < fileListLength; i++){
			if(debugMode==true){result("\nFile " + i + "...");}
			// Boolean TagGroupGetIndexedTagAsTagGroup( TagGroup tagGroup, Number index, TagGroup subGroup )
			fileList.TagGroupGetIndexedTagAsTagGroup(i, fileGroup )
			fileGroup.TagGroupGetTagAsString( "Name", fileName )
			if(debugMode==true){Result("\n\tFilename: " + fileName );}
				//File Name format: DarkField_####_[HIGHER/LOWER]_[#######]_[######]_[#####].dm#
			number stringLength = fileName.len()
			number namePartOneIndex = fileName.find("_"); // DarkField or BrightField
			string namePartOne = fileName.left(namePartOneIndex);
			if(debugMode==true){result("\n\tName part one: " + namePartOne);}
			namePartOne = namePartOne.StringToLower();
			if(namePartOne == "brightfield"){
				if(debugMode==true){result("\n\tBrightfield image detected.");}
				TagGroupCreateNewLabeledTag( DFList, "BaseImage" );
				DFList.TagGroupSetTagAsString( "BaseImage" , fileName );
				continue;
			}
			if(namePartOne == "dp"){
				if(debugMode==true){result("\n\tDiffraction Pattern image detected.");}
				continue;
			}
			if(namePartOne != "darkfield"){
				if(debugMode==true){result("\n\tUnknown image detected.");}
				continue;
			}
			string namePartTwo = fileName.right(stringLength - namePartOneIndex - 1); // Get rid of first part
			if(debugMode==true){result("\n\tName part two (first step): " + namePartTwo);}
			number namePartTwoIndex = namePartTwo.find("_"); // The Spot ID number (should be 4 characters)
			if(debugMode==true){result("\n\tName part two (index): " + namePartTwoIndex);}
			if(namePartTwoIndex == -1){
				namePartTwoIndex = namePartTwo.find(".");
			}
			namePartTwo = namePartTwo.left(namePartTwoIndex);
			if(debugMode==true){result("\n\tSpotID: " + namePartTwo);} // This is the Spot ID
			string namePartThree	// Could be HIGHER_.../LOWER_... or just "dm3"
			namePartThree = fileName.right(stringLength - namePartOneIndex - namePartTwoIndex - 2); // Get rid of the other parts
			if(debugMode==true){result("\n\tName part three (first step): " + namePartThree);}
			number namePartThreeIndex = namePartThree.find("_");
			if(debugMode==true){result("\n\tName part three (index): " + namePartThreeIndex);}
			if(namePartThreeIndex == -1){ //No '_' detected.
				namePartThreeIndex = namePartThree.find(".");
				if(namePartThreeIndex == -1){ //No '.' detected.
					// namePartThreeIndex = ""; // is blank
				} else {
					namePartThree = namePartThree.left(namePartThreeIndex);
				}
			}
			if(debugMode==true){result("\n\tPart 3: " + namePartThree);}
			
			// Record the information in a tag group of the format:
			// 	DFList:Spot####:Higher/Lower/Middle (#### is spot ID)
			string tagPath = "Spot" + namePartTwo
			if(!TagGroupDoesTagExist( DFList, tagPath )){
				// Is higher or lower, so add to list to multiply.
				TagGroup SpotGroup = NewTagGroup(); // the tagGroup that will hold this data and then be attached to the DFList.
				TagGroupCreateNewLabeledTag( SpotGroup, "LOWER" ); // Creates the tag for LOWER data
				TagGroupCreateNewLabeledTag( SpotGroup, "HIGHER" ); // Creates the tag for HIGHER data
				TagGroupCreateNewLabeledTag( SpotGroup, "MIDDLE" ); // Creates the tag for MIDDLE data
				TagGroupAddLabeledTagGroup( DFList, tagPath, SpotGroup );
			}
			
			if(namePartThree.left(1).StringToLower() == "h"){
				DFList.TagGroupSetTagAsString( (tagPath + ":HIGHER") , fileName ); // sets the filename within the HIGHER/LOWER tag
			}
			else if(namePartThree.left(1).StringToLower() == "l")
			{
				DFList.TagGroupSetTagAsString( (tagPath + ":LOWER") , fileName ); // sets the filename within the HIGHER/LOWER tag
			}
			else
			{
				DFList.TagGroupSetTagAsString( (tagPath + ":MIDDLE") , fileName ); // sets the MIDDLE tag
			}
		}
		// Set the shadowing mode by looking for Higher / Lower images
		number shadowMode = 0;
		number shadowCount = taggroupcounttags(DFList)
		for(i=0; i < shadowCount; i++){
			string tagPath
			string filePath
			string shadowLabel = DFList.TagGroupGetTagLabel( i )
			if(shadowLabel.left(4) == "Spot"){
				tagPath = shadowLabel + ":LOWER"
				DFList.TagGroupGetTagAsString(tagPath, filePath);
				if(filePath != "0"){
					result("\nShadow Images Confirmed.")
					shadowMode = 1;
					break;
				}
			}
		}
		DFList.TagGroupSetTagAsNumber( "ShadowMode" , shadowMode );
		if(debugMode==true){DocumentWindow tagViewWindow = TagGroupOpenBrowserWindow( DFList, 0 );} // Used to check on the Tag group when debugging
		// The taggroup DFList now contains the files that need to be multiplied together.
		return DFList;
	}

	/* This function will take a TagGroup of stored images and then process them based on the input arguments.
		The input TagGroup is the output of makeDFFileListGroup()
		useShadowImages 0/1 - use the shadowing method. This will only use the higher/lower images of a darkfield set. If 0 it will only use the Middle images.
		makeBinaries 0/1 - Run the levelAndDespeckleImage() function on the images before addition or multiplication. If set to 0 it assumes the input images are all ready binaries.
		targetPercentage - number. The % of the dimmest pixels to be removed. 99 is generally used. Is the input for levelAndDespeckleImage function.
		DisplayImages 0/1 - show binary images on screen after processing
		SaveImages 0/1/2 - 	2 = Will automatically save binary images, shadow images and summed images to a directory.
							1 = Will save binaries and summed images (not individual shadowed binaries)
							0 = Will not save anything
			If DisplayImages and SaveImages are both 0 then only the sum total image will be returned and the others will be lost.
		ExportImages 0/1/2 - 	0 = no additional action
								1 = save any binary images that are saved in gatan format in gif format as well.
								2 = save ALL binary images produced as gif format as well.
		debugMode 0/1 - Lots of feedback.
		
	*/
	image processDarkFieldImages(object self, TagGroup DFList, number useShadowImages, number makeBinaries, number targetPercentage,\
			number DisplayImages, number SaveImages, number ExportImages ){
		if( ( DisplayImages != 1) && ( DisplayImages != 0 ) ){
			throw("DisplayImages parameter not set correctly");
		}
		if( ( SaveImages != 1) && ( SaveImages != 0 ) && ( SaveImages != 2) ){
			throw("SaveImages parameter not set correctly");
		}
		if( ( makeBinaries != 1) && ( makeBinaries != 0 ) ){
			throw("makeBinaries parameter not set correctly");
		}
		if( ( useShadowImages != 1) && ( useShadowImages != 0 ) ){
			throw("useShadowImages parameter not set correctly");
		}
		if( ( targetPercentage < 0) || ( targetPercentage > 100 ) ){
			throw("targetPercentage parameter not set correctly");
		}
		result("\nProcessing a set of Darkfield Images.");
		if(debugMode==true){
			result("Parameters set as:" + \
			"\n\tuseShadowImages: " + useShadowImages + \
			"\n\tmakeBinaries: "+ makeBinaries + \
			"\n\ttargetPercentage: "+ targetPercentage + \
			"\n\tDisplayImages: " + DisplayImages + \
			"\n\tSaveImages: " + SaveImages);
		}

		number UseImageID; // 0/1 for if the images are referenced with file paths or imageID numbers.
		DFList.TagGroupGetTagAsNumber("UseImageID", UseImageID);
		if(debugMode==true){result("\n\tUseImageID: " + UseImageID);}
		string directory;
		DFList.TagGroupGetTagAsString("Directory", directory);
		if(debugMode==true){result("\n\tDirectory selected: " + directory);} // Directory can be used for just saving if not loading
		string saveDirectory; // directory to save the images in.
		string subdirectoryName; // subdirectory to save processed images inside.
		subdirectoryName = (useShadowImages == 1) ? ("shadowed_" + constructTimeStamp()) : ("Not_shadowed_" + constructTimeStamp());
		if((SaveImages != 0) || (ExportImages != 0)){ // will need to make a subdirectory
			saveDirectory = PathConcatenate ( directory, subdirectoryName )
			createDirectory(saveDirectory);
		}	
		
		/* This part needs fixing to not use the raw camera size. */
		
		number cameraWidth, cameraHeight;
		sscgetsize(cameraWidth, cameraHeight);
		
		image binarySum; // image that each binary image will be added to.
		binarySum = IntegerImage( "Binary Sum", 1, 0, cameraWidth, cameraHeight );
		binarySum.ImageSetName("Binary Sum " + constructTimeStamp());
		string binarySumFileName, binarySumFilePath

		number totalSpots, i;
		totalSpots = taggroupcounttags(DFList);
		
		image RefIm;
		number RefImStored = 0; // save an image for later use.
		
		// Go to each 'Spot' set.
		for(i=0;i<totalSpots;i++)
		{
			image binaryImage;
			String label = DFList.TagGroupGetTagLabel( i ); // Will be of format Spot#### if a spot set.
			if(label.left(4) != "Spot"){
				if(debugMode==true){result("\n" + label + " is not a spot set");}
				continue;
			}
			string tagPathToLower = label + ":LOWER"; // will be of format: ID or file path
			string tagPathToHigher = label + ":HIGHER";
			string tagPathToMiddle = label + ":MIDDLE";
			
			if(debugMode==true){
				result("\ntagPathToLower: " + tagPathToLower);
				result("\ntagPathToHigher: " + tagPathToHigher);
				result("\ntagPathToMiddle: " + tagPathToMiddle);
			}
			
			if(useShadowImages==1){
				// Reference the two images to multiply together.
				image higherImage, lowerImage;
				if(UseImageID){
					number imageIDLower, imageIDHigher;
					imageIDLower = DFList.TagGroupGetTagAsNumber(tagPathToLower, imageIDLower);
					imageIDHigher = DFList.TagGroupGetTagAsNumber(tagPathToHigher, imageIDHigher);
					
					lowerImage = GetImageFromID( imageIDLower );
					higherImage = GetImageFromID( imageIDHigher );
					if(lowerImage.ImageIsValid() == 0){
						throw("Lower Image not found by ID");
					}
					if(higherImage.ImageIsValid() == 0){
						throw("Higher Image not found by ID");
					}
				}
				else // Use filepaths
				{
					string lowerImagePath, higherImagePath;
					DFList.TagGroupGetTagAsString(tagPathToLower, lowerImagePath);
					DFList.TagGroupGetTagAsString(tagPathToHigher, higherImagePath);
					lowerImagePath = PathConcatenate( directory, lowerImagePath);
					higherImagePath = PathConcatenate( directory, higherImagePath);
					if(debugMode==true){result("\nLower File: " + lowerImagePath);}
					if(debugMode==true){result("\nHigher File: " + higherImagePath);}
					
					higherImage := OpenImage ( higherImagePath );
					lowerImage := OpenImage ( lowerImagePath );
					if(lowerImage.ImageIsValid() == 0){
						throw("Lower Image not found by File Path");
					}
					if(higherImage.ImageIsValid() == 0){
						throw("Higher Image not found by File Path");
					}
				}
				// Store an image if needed for referencing later.
				if(!RefImStored){
					RefIm = higherImage;
					RefImStored = 1;
				}
				if(makeBinaries){ // Images need making into binaries first.
					lowerImage := self.levelAndDespeckleImage(lowerImage, targetPercentage);
					higherImage := self.levelAndDespeckleImage(higherImage, targetPercentage);
				}
				lowerImage.ImageSetName(label + "_binary_lower")
				higherImage.ImageSetName(label + "_binary_higher")
				binaryImage = tert( ( ( lowerImage == 1 ) && ( higherImage == 1 ) ), 1, 0 );
				binaryImage.ImageSetName(label + "_binary_shadowed");
				copyTags(binaryImage, lowerImage);
				ImageChangeDataType(binaryImage, 14); // change to Binary image
				if(debugMode==true){
					result("\n\tImages made into Binaries and shadowed.");
				}
				if(DisplayImages==1){ // Show the binary images on the screen. Contrast needs setting to avoid blankness
					showImage(lowerImage);
					showImage(higherImage);
					showImage(binaryImage);
					ImageDisplay lowerImageDisplay = ImageGetImageDisplay( lowerImage, 0 )
					ImageDisplay higherImageDisplay = ImageGetImageDisplay( higherImage, 0 )
					ImageDisplay binaryImageDisplay = ImageGetImageDisplay( binaryImage, 0 )
					lowerImageDisplay.ImageDisplaySetContrastLimits(0,1);
					higherImageDisplay.ImageDisplaySetContrastLimits(0,1);
					binaryImageDisplay.ImageDisplaySetContrastLimits(0,1);
				}
				if(SaveImages != 0){ // save the images to the listed subdirectory unless set to 0
					string binaryFileName, binaryFilePath, lowerFileName, lowerFilePath, higherFileName, higherFilePath;
					binaryFileName = label + "_binary_shadowed"
					binaryFilePath = PathConcatenate ( saveDirectory, binaryFileName )
					SaveAsGatan(binaryImage, binaryFilePath);
					if(SaveImages == 2){
						lowerFileName = label + "_binary_lower"
						lowerFilePath = PathConcatenate ( saveDirectory, lowerFileName )
						SaveAsGatan(lowerImage, lowerFilePath);
						higherFileName = label + "_binary_higher"
						higherFilePath = PathConcatenate ( saveDirectory, higherFileName )
						SaveAsGatan(higherImage, higherFilePath);
					}
				}
				if(ExportImages != 0){
					self.transparencyExport(binaryImage, saveDirectory)
					if(ExportImages == 2){
						self.transparencyExport(lowerImage, saveDirectory)
						self.transparencyExport(higherImage, saveDirectory)
					}
				}
			}
			else 
			{ // Image is not to use the shadowing feature, so just use the middle image
				image middleImage;
				if(UseImageID){
					number imageID
					DFList.TagGroupGetTagAsNumber(tagPathToMiddle, imageID);
					middleImage = GetImageFromID( imageID );
					if(middleImage.ImageIsValid() == 0){
						throw("Image not found by ID method");
					}
				}
				else // Use filepaths
				{
					string ImagePath;
					DFList.TagGroupGetTagAsString(tagPathToMiddle, ImagePath);
					ImagePath = PathConcatenate( directory, ImagePath);
					if(debugMode==true){result("\nImage File: " + ImagePath);}
					
					middleImage := OpenImage ( ImagePath );
					if(middleImage.ImageIsValid() == 0){
						throw("Image not found by File Path method");
					}
				}
				// Store an image if needed for referencing later.
				if(!RefImStored){
					RefIm = middleImage;
					RefImStored = 1;
				}
				if(makeBinaries){ // Image needs making into binary first.
					middleImage := self.levelAndDespeckleImage(middleImage, targetPercentage);
				}
				binaryImage := middleImage;
				binaryImage.ImageSetName(label + "_binary_no_shadow");
				if(DisplayImages){
					showImage(middleImage);
					ImageDisplay middleImageDisplay = ImageGetImageDisplay( middleImage, 0 )
					middleImageDisplay.ImageDisplaySetContrastLimits(0,1);
				}
				if(SaveImages){ // save the images to the listed subdirectory unless set to 0
					string binaryFileName, binaryFilePath;
					binaryFileName = label + "_binary_no_shadow"
					binaryFilePath = PathConcatenate ( saveDirectory, binaryFileName );
					SaveAsGatan(middleImage, binaryFilePath);
				}
				if(ExportImages){
					self.transparencyExport(binaryImage, saveDirectory)
				}	
			}
			// The images will all be added together, regardless of the parameters.
			binarySum = binarySum + binaryImage;
		} // end of loop
		copyTags(binarySum, RefIm);
		
		string binarySumTitle = (useShadowImages != 0) ? "Sum_from_Shadows" : "Sum_from_Middle" ;
		binarySum.ImageSetName(binarySumTitle);
		if(SaveImages){
			binarySumFileName = binarySumTitle
			binarySumFilePath = PathConcatenate ( saveDirectory, binarySumFileName )
			SaveAsGatan(binarySum, binarySumFilePath);
		}
		if(DisplayImages){
			showImage(binarySum);
		}
		if(ExportImages){
			self.transparencyExport(binarySum, saveDirectory);
		}
		return binarySum;
	}

	/* Function to make binary images out of a generic image list */
	void binaryAllImages(object self, TagGroup imageList, number targetPercentage, number ExportImages, string saveDirectory){
		result("\nmaking binaries of a set of images...")
		number totalImages = taggroupcounttags(imageList);
		result("\n\tFound " + totalImages + " images.");
		number i;
		for(i=0; i < totalImages; i++){
			number ImageID
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			image binaryImage :=  self.levelAndDespeckleImage(thisImage, targetPercentage);
			showImage(binaryImage);
			binaryImage.ImageSetName(imageTitle + " binary");
			if(ExportImages){
				self.transparencyExport(binaryImage , saveDirectory);
			}
		}
		result("\nAll Images processed.");
	}

	/* Function to align an entire directory */
	void alignAllImages(object self, TagGroup imageList){
		result("\nAligning a set of images...")
		number totalImages = taggroupcounttags(imageList);
		result("\n\tFound " + totalImages + " images.");
		number i;
		number maxXShift, maxYShift, minXShift, minYShift;
		image xShiftImage := IntegerImage( "xShift Array", 4, 1, totalImages, 1);
		image yShiftImage := IntegerImage( "yShift Array", 4, 1, totalImages, 1);
		image image2, baseImage;
		if(!GetTwoImagesWithPrompt( "Select the Base Image to compare all others to", "Base Image Selection", baseImage, image2) ){
			exit(0);
		}
		string baseImageTitle = baseImage.GetName();
		
		for(i=0; i < totalImages; i++){
			number ImageID
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			if(imageTitle == baseImageTitle){
				continue;
			}
			number offsetX, offsetY;
			if(! GetScriptObjectFromID(imageAlignmentDialogID).alignTwoImages(thisImage, baseImage, offsetX, offsetY)){
				// User pressed Cancel. Stop everything.
				return;
			}
			xShiftImage.setPixel(i, 0, -offsetX);
			yShiftImage.setPixel(i, 0, -offsetY);
		}
		result("\nAll Images aligned. Making aligned image set...");
		//Find the maximum shift values.
		ImageCalculateMinMax( xShiftImage, 0, 0, minXShift, maxXShift );
		if(debugMode==true){result("\n\tmaxXShift = " + maxXShift + "\n\tminXShift = " + minXShift);}
		ImageCalculateMinMax( yShiftImage, 0, 0, minYShift, maxYShift );
		if(debugMode==true){result("\n\tmaxYShift = " + maxYShift + "\n\tminYShift = " + minYShift);}
		
		// minX/YShifts need to be either 0 or the largest -ve number.
		// maxX/YShifts need to be either 0 or the largest +ve number
		maxXShift = tert( (maxXShift >= 0), maxXShift, 0 );
		minXShift = tert( (minXShift <= 0), minXShift, 0 );
		maxYShift = tert( (maxYShift >= 0), maxYShift, 0 );
		minYShift = tert( (minYShift <= 0), minYShift, 0 );
		
		for(i=0; i < totalImages; i++){
			number ImageID, XShift, YShift, xSize, ySize;
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			XShift = getPixel( xShiftImage, i, 0 );
			YShift = getPixel( yShiftImage, i, 0 );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			result("\n\tProcessing " + imageTitle)
			GetSize(thisImage, xSize, ySize);
			image alignedImage :=  GetScriptObjectFromID(imageAlignmentDialogID).createAlignedImage (thisImage, minXShift, minYShift, maxXShift, maxYShift, XShift, YShift);
			showImage(alignedImage);
		}
	}
	
	
		// constructor
	ImageProcessing(object self){
		ImageProcessingID = self.ScriptObjectGetID();
	}
	
	// destructor
	~ImageProcessing(object self){
		if(debugMode == 1){result("\nImageProcessing object deleted.");}
	}
}

