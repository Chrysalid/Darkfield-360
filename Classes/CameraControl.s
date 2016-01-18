// ********************************************************************************
//  Class with Imaging controls.
// ********************************************************************************
// Taking this outside of Toolkit because it is getting crowded.
// Insert this class before the toolkit.
// Does NOT include image processing and offline functions.
// This class is only for online camera use, and should not be called by offline functions.

class CameraControl
{
	number CameraControlID; // the ID of this object
	number ToolkitID; // the ID of the toolkit
	number dataObjectID;

	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image. Is 0 or 1.
	number debugMode;
	
	number cameraWidth, cameraHeight;
	number binningMultiplier;
	number DFExposure; // # of seconds to expose the camera for taking DarkField images.
	number DPExposure; // # of seconds to expose the camera for taking Diffraction Pattern images.
	number BFExposure; // # of seconds to expose the camera for taking BrightField images.
	
	TagGroup ImagingModes; // Taglist of the names used for imaging modes
	TagGroup DiffractionModes;// Taglist of names used for diffraction modes

	/* These are components displayed on the Live View Window which the user interacts with */
	component markerRing;
	component ringRadiusText;
	
	/* The various aspects of the View Window the toolkit needs to know about */
	DocumentWindow ViewWindow;
	Image ViewImage;
	ImageDocument ViewImageDocument;
	ImageDisplay ViewImageDisplay;
	
	// Function to print out the various saved variables for debugging
	void printAllValues(object self)
	{
		result("\n\nCamera Control Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + CameraControlID +\
			"\n DebugMode: " + debugMode +\
			"\n EMonline: " + EMOnline +\
			"\n AllowControl: " + AllowControl +\
			"\n dataObjectID: " + dataObjectID +\
			"\n cameraWidth: " + cameraWidth +\
			"\n cameraHeight: " + cameraHeight +\
			"\n binningMultiplier: " + binningMultiplier +\
			"\n DFExposure: " + DFExposure +\
			"\n DPExposure: " + DPExposure +\
			"\n BFExposure: " + BFExposure +\
			"\n Imaging Modes saved: " + ImagingModes.TagGroupCountTags() +\
			"\n Diffraction Modes saved: " + DiffractionModes.TagGroupCountTags();
		result(textstring);
		result("\n-------End----------------");
	}
	
	/* Function to locate and store the VIEW window and its various components.
			It will return 1 if the window is found and 0 if it is not present
	*/
	
	number findLiveView (object self){
		number i = 0;
		DocumentWindow thisViewWindow;
		DocumentWindow window = GetDocumentWindow( i );
		while( window.WindowIsValid( ) ) {
			string titleString = window.WindowGetTitle();
			number index = titleString.find(":"); // Looks for : to ID windows
			if(index != -1){ //No ':' means no letter-ID at the title start, and it isn't the View window
				string cutTitle = titleString.right(titleString.len() - index - 2); // Gets rid of : and a space
				if(cutTitle=="View"){ // If it is this window...
					thisViewWindow = GetDocumentWindowByTitle( titleString );
					break;
				}
			}
			i++;
			window = GetDocumentWindow( i );
		}
		if(!thisViewWindow.WindowIsValid()){
			result("\nView window not present.")
			return 0;
		} else {
			viewWindow = thisViewWindow;
			viewImageDocument = viewWindow.ImageWindowGetImageDocument();
			viewImage := viewImageDocument.ImageDocumentGetImage(0);
			viewImageDisplay = viewImage.ImageGetImageDisplay(0);
			return 1;
		}
	}
	
	// Check if the microscope is online and if there is a Live View Image captured
	void updateEMstatus(object self)
	{
		EMOnline = EMIsReady();
		if(EMOnline == false){
			AllowControl = 0;
		} else {
			image viewImage
			if(viewImage.ImageIsValid() == false){
				AllowControl = 0; //No View image, so no live camera control yet.
			} else {
				AllowControl = 1; // View window and microscope detected.
			}
		}
	}
	
	
	// Returns 1 if the microscope is in imaging mode. 0 could mean anything.
	number isImagingMode(object self)
	{
		string opticsMode = EMGetImagingOpticsMode();
		number totalModes = ImagingModes.TagGroupCountTags();
		number i;
		for(i=0; i < totalModes; i++){
			string possibleMode;
			ImagingModes.TagGroupGetIndexedTagAsString(i, possibleMode);
			if( opticsMode == possibleMode ){
				return 1;
			}
		}
		return 0;
	}
	
	// Returns 1 if the microscope is in diffraction mode. 0 could mean anything.
	number isDiffractionMode(object self)
	{
		string opticsMode = EMGetImagingOpticsMode();
		number totalModes = DiffractionModes.TagGroupCountTags();
		number i;
		for(i=0; i < totalModes; i++){
			string possibleMode;
			DiffractionModes.TagGroupGetIndexedTagAsString(i, possibleMode);
			if( opticsMode == possibleMode ){
				return 1;
			}
		}
		return 0;
	}
	
	/* Function to centre beam */
	void beamCentre(object self){
		if(AllowControl == true){
			number centreXTilt = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
			number centreYTilt = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
			moveBeamTilt ( centreXTilt, centreYTilt );
		}
	}	

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Camera Control Object");}
	}
	
	// External functions can call this to see if they can use the microscope.
	number getAllowControl(object self)
	{
		return AllowControl;
	}

	// Finds the camera width, height and binning multiplier. Should only run if camera is confirmed to exist.
	// Returns 1/0 on success/failure
	number storeCameraDetails(object self)
	{
		self.updateEMstatus();
		if(AllowControl == 0){
			result("\nLive Image not found. Camera details not stored.")
			return 0;
		}
		
		sscgetsize(cameraWidth, cameraHeight); // Get camera resolution
		if(debugMode==1){result("\nCamera Resolution set to " + cameraWidth + " x " + cameraHeight);}
		image ReferenceDP := sscUnprocessedAcquire(0.1,0,0,cameraWidth,cameraHeight);
		if(debugMode){result("\n\tReference exposure created");}
		GetScriptObjectFromID(dataObjectID).setReferenceDP(ReferenceDP);
		if(debugMode){result("\n\tReference exposure added to toolkit data store.");}
		
		// Find binning by comparing raw camera width with view window width
		image viewImage;
		if(viewImage.ImageIsValid() == false){
			result("\nView Image is invalid.")
			return 0;
		}
		number viewWidth, viewHeight;
		ViewImage.getSize(viewWidth, viewHeight);
		binningMultiplier = cameraWidth / viewWidth;
		if(binningMultiplier < 1){
			result("\nBinning Multiplier found to be out of range (<1). Setting multiplier to 1.")
			binningMultiplier = 1;
		}
		if(debugMode==true){result("\n\tThe binning multiplier has been set to " + binningMultiplier);}
		
		return 1;
	}
	
	number getCameraWidth(object self) {
		return cameraWidth;
	}
	
	number getCameraHeight(object self) {
		return cameraHeight;
	}

	number getDFExposure(object self) {
		return DFExposure;
	}
	void setDFExposure(object self, number newValue) {
		DFExposure = newValue;
		GetScriptObjectFromID(dataObjectID).setDFExposure(newValue);
	}

	number getBFExposure(object self) {
		return BFExposure;
	}
	void setBFExposure(object self, number newValue) {
		BFExposure = newValue;
		GetScriptObjectFromID(dataObjectID).setBFExposure(newValue);
	}

	number getDPExposure(object self) {
		return DPExposure;
	}
	void setDPExposure(object self, number newValue) {
		DPExposure = newValue;
		GetScriptObjectFromID(dataObjectID).setDPExposure(newValue);
	}

	number getBinningMultiplier(object self){
		return binningMultiplier;
	}

	// ************************************
	//  IMAGE / WINDOW ID AND POSITIONING
	// ************************************
	
	/* Function to return the VIEW window to a variable.
		It will return 1 if the window is real and 0 if it has not been set. */
	
	number returnViewWindow(object self, DocumentWindow &theViewWindow)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewWindow = viewWindow;
			return 1;
		}
	}
	
	/* Function to pass the VIEW window's image document to other functions.
			It will return 1 if the window is real and 0 if it has not been set. */
	
	number returnViewImageDocument(object self, ImageDocument &theViewImageDocument)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImageDocument = ViewImageDocument;
			return 1;
		}
	}

	/* Function to pass the VIEW window's image to other functions.
		It will return 1 if the window is real and 0 if it has not been set. */
		
	number returnViewImage(object self, image &theViewImage)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImage := ViewImage;
			return 1;
		}
	}

	/* Function to pass the VIEW window's imageDisplay to other functions.
		It will return 1 if the window is real and 0 if it has not been set. */
		
	number  returnViewImageDisplay(object self, imageDisplay &theViewImageDisplay)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImageDisplay = ViewImageDisplay;
			return 1;
		}
	}

	/* Function to reposition the window */
	
	void positionViewWindow(object self)
	{
		//void WindowSetFramePosition( DocumentWindow window, Number x, Number y ) 
		//Sets the position of the top-left corner of the frame area of the 'window'.
		//void WindowGetFramePosition( DocumentWindow window, NumberVariable x, NumberVariable y ) 
		//Gets the position of the top-left corner of the frame area of the 'window'.
		//void WindowSelect( DocumentWindow window )
		//Brings 'window' to the front. 
		if(!ViewWindow.WindowIsValid()){
			return;
		} else {
			WindowSelect( ViewWindow );
			UpdateImage(ViewImage);
		}
	}
	
	/* Function to get VIEW image xscale despite the mis-calibration of our 2100 and the use of a binning multiplier */
	number getViewScale(object self){
		number xscale=1;
		xscale = binningMultiplier * GetScriptObjectFromID(dataObjectID).getRefScale();
		return xscale;
	}
	
	
	// ************************************
	//  Component Drawing (no dependancies)
	// ************************************
	
	/* Function to draw the lines on an image used to centre the beam and pick spots (not the central ring marker)
		canEdit = 0 sets the lines to be non-selectable.
	*/
	
	void drawReticle(object self, image targetImage, number canEdit)
	{
		number centrex, centreY, radius, width, height;
		getSize(targetImage, width, height );
		
		centreX = (width) / 2;
		centreY = (height) / 2;
		
		//Component NewLineAnnotation( Number top, Number left, Number bottom, Number right )
		Component line1 = NewLineAnnotation( 0, 0, height, width );
		Component line2 = NewLineAnnotation( height, 0, 0, width );
		
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		radius = 10; // Radius of the circle in pixels.
		number cTop = centreY - radius;
		number cBottom = centreY + radius;
		number cLeft = centreX - radius;
		number cRight = centreX + radius;
		Component circle1 = NewOvalAnnotation( cTop , cLeft, cBottom, cRight );

		// Set colour and stuff
		line1.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
		line2.componentsetfillmode(2);
		circle1.componentsetfillmode(2);
		line1.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
		line2.componentsetdrawingmode(2);
		circle1.componentsetdrawingmode(2);
		line1.componentsetforegroundcolor(1,0,0); // Colour that the shape is drawn in
		line2.componentsetforegroundcolor(1,0,0);
		circle1.componentsetforegroundcolor(1,0,0);
		line1.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.
		line2.componentsetbackgroundcolor(0,0,0);
		circle1.componentsetbackgroundcolor(0,0,0);
		// Add the components to the image display
		ImageDisplay targetDisplay = targetImage.ImageGetImageDisplay(0);
		Component comp = targetDisplay;
		comp.ComponentAddChildAtEnd( line1 );
		comp.ComponentAddChildAtEnd( line2 );
		comp.ComponentAddChildAtEnd( circle1 );

		if(canEdit == false)
		{
			// Make the lines not selectable.
			line1.ComponentSetSelectable(0);
			line2.ComponentSetSelectable(0);
			circle1.ComponentSetSelectable(0);
		}
	}
	
	/* Function to make the reticle, lines, etc. of any image deletable and selectable */
	void cleanReticle(object self, image targetImage)
	{
		ImageDisplay imageDisp = targetImage.ImageGetImageDisplay( 0 );
		Number compCount =  ComponentCountChildren( imageDisp );
		for(number i=0;i < compCount;i++){
			component annotid=imageDisp.ComponentGetChild(i);	
			annotid.ComponentSetSelectable(1);
			annotid.ComponentSetDeletable(1);
		}	
	}
	
	/* Function to draw the lines on the View Window used to centre the beam and pick spots.
		If updateToolkit = 1, Adds the ring marker and stores it in the toolkit.
		Also creates a text component to update with ring diameter.
	*/
	
	void drawReticleOnLiveView(object self)
	{		
		self.drawReticle(ViewImage, 0); // draw the aiming lines.
		
		Component comp = ViewImageDisplay;
		
		number width, height;
		getSize(ViewImage, width, height );
		
		number centreX = (width) / 2;
		number centreY = (height) / 2;
		
		/* This is the ring used to mark out a target for the ring collection method. */
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		number radius = 100; // Radius of the circle in pixels.
		number cTop, cBottom, cLeft, cRight;
		cTop = centreY - radius;
		cBottom = centreY + radius;
		cLeft = centreX - radius;
		cRight = centreX + radius;
		component newMarkerRing
		newMarkerRing = NewOvalAnnotation( cTop , cLeft, cBottom, cRight ); // This loads the component into the toolkit as well.

		// Set colour and stuff
		newMarkerRing.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
		newMarkerRing.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
		newMarkerRing.componentsetforegroundcolor(1,0,0);// Colour that the shape is drawn in
		newMarkerRing.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.

		// Add the component to the image document
		comp.ComponentAddChildAtEnd( newMarkerRing );
		ComponentSetVisible( newMarkerRing, 1 ); // Make it visible on start up
		ComponentSetDeletable (newMarkerRing, 0); // Cannot be deleted until 'cleaned up'
		
		markerRing = newMarkerRing; // stores the marker ring object in the toolkit for future reference.

		/* This is the text component to display the ring radius. */
		string textString = "D-Spacing: ";
		// Add text annotations and set their colour, display mode and font
		component newRingRadiusText;
		newRingRadiusText=newtextannotation(10,height - 32, textString, 16);
		newRingRadiusText.componentsetfillmode(2);
		newRingRadiusText.componentsetdrawingmode(2);
		newRingRadiusText.componentsetforegroundcolor(1,0,0);
		newRingRadiusText.componentsetbackgroundcolor(0,0,0);
		newRingRadiusText.componentsetfontfacename("Microsoft Sans Serif");
	
		// Add the component to the image document
		comp.ComponentAddChildAtEnd( newRingRadiusText );
		ComponentSetVisible( newRingRadiusText, 1 ); // Show it initially
		newRingRadiusText.ComponentSetSelectable(0);
		ringRadiusText = newRingRadiusText;
	}
	
	/* Code run to link an active View image / window to the Toolkit and set up short cut keys and things.
		Requires DataObject	
	*/
	
	void captureViewScreen (object self)
	{
		self.findLiveView();
		self.updateEMstatus();
		
		if(AllowControl == false){
			result("\n\nNo Control Permitted. Ensure a live view window is active and the microscope is online.");
			return;
		}
		GetScriptObjectFromID(dataObjectID).setCentreTiltHere(); // set this here to avoid false tilt values.
		if(debugMode == true){result("\nCapturing View Window...");}
		if(self.storeCameraDetails() == 0){  // Stores camera width, height and binning multiplier.
			result("\nError finding camera information.");
			throw("Error finding Camera Information");
		}
		
		self.drawReticleOnLiveView();
		if(debugMode==1){result("\n\tReticle added to View window.");}

		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScaleString(scaleString);
		if(debugMode==1){
			result("\n\tThe View window scale was initially set to " + GetScriptObjectFromID(dataObjectID).getOriginalScale() + " " + GetScriptObjectFromID(dataObjectID).getOriginalScaleString());
		}
		return;
	}
	
	//********************************
	// RING CONTROL FUNCTIONS
	//********************************
	
	/* Function to make a marker circle component that can be assigned to any image.
		This is intended as a marker ring that is not linked to the ring-capture controls, just to show things. 
		Will return the Circle component if you want to use it.
	*/
	
	component makeNewCircle(object self, image targetImage, number radiusPX, string radiusTextString, rgbnumber componentColour)
	{
		component greenCircle;
		number centreX, centreY;
		getSize(targetImage, centreX, centreY);
		centreX = centreX / 2;
		centreY = centreY / 2;
		number cTop = centreY - radiusPX;
		number cBottom = centreY + radiusPX;
		number cLeft = centreX - radiusPX;
		number cRight = centreX + radiusPX;
		greenCircle = NewOvalAnnotation( cTop , cLeft, cBottom, cRight );
		
		// Set colour and stuff
		number redNumber, blueNumber, greenNumber;
		redNumber = red(componentColour) / 255;
		blueNumber = blue(componentColour) / 255;
		greenNumber = green(componentColour) / 255;
		greenCircle.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
		greenCircle.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour, mode 2 does foreground (?)
		greenCircle.componentsetforegroundcolor(redNumber, greenNumber, blueNumber);// Colour that the shape is drawn in
		greenCircle.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.

		// Add the component to the image document
		ImageDisplay targetDisplay = targetImage.ImageGetImageDisplay(0);
		Component comp = targetDisplay;
		comp.ComponentAddChildAtEnd( greenCircle );
		
		// Text Stuff
		component radiusText;
		radiusText=newtextannotation(10, 10, radiusTextString, 16); // Put this one near the top
		radiusText.componentsetfillmode(2);
		radiusText.componentsetdrawingmode(2)			;
		radiusText.componentsetforegroundcolor(redNumber, greenNumber, blueNumber);
		radiusText.componentsetbackgroundcolor(0,0,0);
		radiusText.componentsetfontfacename("Microsoft Sans Serif");

		// Add the component to the image document
		comp.ComponentAddChildAtEnd( radiusText );
		return greenCircle;
	}
	
	/* Function to change the visibility of the marker ring and any attached text.
		Select the component to make it easy to see and work with. */
	
	void toggleMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		if(debugMode==true){result("\nmarkerRing object is valid");}
		if(debugMode==true){result("\n\tmarkerRing Get Visible: " + ComponentGetVisible( markerRing ) );}
		if( ComponentGetVisible( markerRing ) == 1 ){
			ComponentSetVisible( markerRing, 0 );
			ComponentSetVisible( ringRadiusText, 0 );
			ComponentSetSelected( markerRing, 0 );
		} else {
			ComponentSetVisible( markerRing, 1 );
			ComponentSetVisible( ringRadiusText, 1 );
			ComponentSetSelected( markerRing, 1 );
		}
		return;
	}
	
	/* Function to update a text component with the radius of a diffraction ring. */
	void updateRadius (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		if(debugMode==true){result("\n\tUpdating Radius...");}
		// void ComponentGetBoundingRect( Component comp, NumberVariable t, NumberVariable l, NumberVariable b, NumberVariable r )
		number measuredRadiusPX, measuredRadiusNM, top, bottom, left, right, scaleX, scaleY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		if(debugMode==true){result("\nmeasuredRadiusPX = " + measuredRadiusPX);}
		scaleX = self.getViewScale();
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		measuredRadiusNM = measuredRadiusPX * scaleX;
		number measureRadiusAngstrom = 10 / measuredRadiusNM;
		ringRadiusText.TextAnnotationSetText("D-Spacing: " + measuredRadiusNM + " (1/nm)   /   " + measureRadiusAngstrom + " A");
		return;
	}
	
	/* Function to set the markerRing to a desired radius (in 1/nm) */
	
	void setRingRadius (object self, number desiredRadiusNM)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		number measuredRadiusPX, desiredRadiusPX, top, bottom, left, right, scaleX, scaleY, centreX, centreY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		centreX = right - measuredRadiusPX;
		centreY = bottom - measuredRadiusPX;
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = self.getViewScale();
		desiredRadiusPX = desiredRadiusNM / scaleX;
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		if(debugMode==true){result("\ndesiredRadiusNM: " + desiredRadiusNM + " (1/nm)");}
		
		top = centreY + desiredRadiusPX;
		bottom = centreY - desiredRadiusPX;
		right = centreX + desiredRadiusPX;
		left = centreX - desiredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
		return;
	}

	/* Function to put the marker ring back on the central spot and make it circular. */
	void recenterMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		number top, bottom, left, right, centreX, centreY;
		// Check if calibrated yet. Stop if not.
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		
		centreX = cameraWidth / (2 * binningMultiplier);
		centreY = cameraHeight / (2 * binningMultiplier);
		if(debugMode==true){result("\nCenter of View window = (" + centreX + ", " + centreY + ")");}
			
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		number measuredRadiusPXVertical = (bottom - top) / 2;
		number measuredRadiusPXHorizontal = (right - left) / 2;
		// Pick the largest one.
		number measuredRadiusPX = (measuredRadiusPXVertical > measuredRadiusPXHorizontal) ? measuredRadiusPXVertical : measuredRadiusPXHorizontal;
		if(debugMode==true){result("\nRing radius measured as " + measuredRadiusPX + "px");}
		
		top = centreY + measuredRadiusPX;
		bottom = centreY - measuredRadiusPX;
		right = centreX + measuredRadiusPX;
		left = centreX - measuredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
		if(debugMode==true){result("\nRectangle set to [" + top + ", " + left + ", " + bottom + ", " + right + " ]");}
		return;
	}

	/* Function to return the radius of the marker ring in pixels for unbinned images */
	
	 number markerRingRadius(object self)
	 {
		number beamPixelCentreX, beamPixelCentreY, tiltVectorX, tiltVectorY, targetRadiusPX, scaleX, scaleY;
		scaleX = GetScriptObjectFromID(dataObjectID).getRefScale(); // Scales for an unbinned image
		scaleY = GetScriptObjectFromID(dataObjectID).getRefScale(); 
		beamPixelCentreX = cameraWidth / 2;
		beamPixelCentreY = cameraHeight / 2;
		
		number top, bottom, left, right;
		markerRing.ComponentGetRect(top, left, bottom, right );
		if(debugMode==true){result("\nRing rectangle: " + top + ", " + left + ", " + bottom + ", " + right);}
		
		targetRadiusPX = ( right - left )/2;
		if(debugMode==true){result("\nRing radius measured as: " + targetRadiusPX + "px");}
		targetRadiusPX = targetRadiusPX * binningMultiplier;
		if(debugMode==true){result("\nAt full scale this is: " + targetRadiusPX + "px");}
		return targetRadiusPX;
	 }
	
	void initialise(object self, number theToolkitID, number theDataObjectID){
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		
		self.findLiveView(); // Look for a Live View window and store it.
		self.updateEMstatus(); // set the AllowControl variable. Uses results of findLiveView and checks if microscope is turned on.
		
		DFExposure = GetScriptObjectFromID(dataObjectID).getDFExposure(); // # of seconds to expose the camera for taking DarkField images.
		DPExposure = GetScriptObjectFromID(dataObjectID).getDPExposure(); // # of seconds to expose the camera for taking Diffraction Pattern images.
		BFExposure = GetScriptObjectFromID(dataObjectID).getBFExposure(); // # of seconds to expose the camera for taking BrightField images.

		// Default starting values for the different imaging modes. A way to edit these can be added later.
		DiffractionModes = GetScriptObjectFromID(dataObjectID).getDiffractionModes();
		ImagingModes = GetScriptObjectFromID(dataObjectID).getImagingModes();
		
		// The CameraControlObject can try to capture the view screen here since this initialisation is done on start up only.
		if(ViewImage.ImageIsValid()){
			self.captureViewScreen();
		}
	}
	
	// constructor
	CameraControl(object self){
		CameraControlID = self.ScriptObjectGetID();
	}
	
	// destructor
	~CameraControl(object self){
		if(debugMode == 1){result("\nCameraControl object " + self.ScriptObjectGetID() + " deleted.");}
	}
}

