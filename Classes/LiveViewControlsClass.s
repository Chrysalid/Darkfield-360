// ********************************************************************************
//  Live View Controls
// ********************************************************************************

// Requires functions/data from:
//		DataObject
// 		Camera Control Object

// functions relating to the Live view window.
//		Markers and components
//		Identifying the view window

class LiveViewControlsClass
{
	number LiveViewControlsID;
	number dataObjectID;
	number ToolkitID;
	number CameraControlObjectID;
	number debugMode;
	
	/* These are components displayed on the Live View Window which the user interacts with */
	component markerRing;
	component ringRadiusText;
	
	/* The various aspects of the View Window the toolkit needs to know about */
	DocumentWindow ViewWindow;
	Image ViewImage;
	ImageDocument ViewImageDocument;
	ImageDisplay ViewImageDisplay;
	
	
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in LiveViewControls");}
	}
	
	// ************************************
	//  IMAGE / WINDOW ID AND POSITIONING
	// ************************************

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
	
	/* Function to return the VIEW window to a variable. It will return 1 if the window is real and 0 if it has not been set. */
	
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

	/* Function to reposition the window positions when debug mod */
	
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
	
	/* Code run to link an active View image / window to the Toolkit and set up short cut keys and things. */
	void captureViewScreen (object self)
	{
		GetScriptObjectFromID(CameraControlObjectID).updateEMstatus();
		if(GetScriptObjectFromID(CameraControlObjectID).getAllowControl() == 0){
			result("\nNo Control Permitted. Ensure a live view window is active.")
			return;
		}
		GetScriptObjectFromID(dataObjectID).setCentreTiltHere(); // set this here to avoid false tilt values.
		if(debugMode){result("\nCapturing View Window...");}
		if(GetScriptObjectFromID(CameraControlObjectID).storeCameraDetails() == 0){  // Stores camera width, height and binning multiplier.
			result("\nError finding camera information.");
			throw("Error finding Camera Information");
		}
		
		if( self.findLiveView() == 0){
			result("\nNo View Display found.");
			return;
		}
		
		self.drawReticleOnLiveView();
		if(debugMode==1){result("\n\tReticle added to View window.");}

		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScaleString(scaleString);
		if(debugMode==1){result("\n\tThe View window scale was initially set to " + GetScriptObjectFromID(dataObjectID).getOriginalScale() + " " + GetScriptObjectFromID(dataObjectID).getOriginalScaleString());}
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
		scaleX = GetScriptObjectFromID(CameraControlObjectID).getViewScale();
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
		number binningMultiplier = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = GetScriptObjectFromID(CameraControlObjectID).getViewScale();
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
		number binningMultiplier = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
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
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number binning = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
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
		targetRadiusPX = targetRadiusPX * binning;
		if(debugMode==true){result("\nAt full scale this is: " + targetRadiusPX + "px");}
		return targetRadiusPX;
	 }
	 
	 

	// Constructor
	LiveViewControlsClass(object self)
	{
		LiveViewControlsID = self.ScriptObjectGetID(); // Tell the object its own ID number
	}
	
	// Destructor
	~LiveViewControlsClass(object self)
	{
		result("\nLiveViewControl object with ID " + self.ScriptObjectGetID() + " deleted.");
	}
	
	// loads important variables into the object
	void initialise(object self, number theToolkitID, number theDataObjectID, number theCameraControlObjectID)
	{
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		CameraControlObjectID = theCameraControlObjectID;
		self.findLiveView();
		if(debugMode==1){result("\n LiveViewControls initialised.");}
	}
	
	void printAllValues(object self)
	{
		result("\n\n Live View Window Controls Debug Values");
		result("\n------------------------")
		string textstring;
		textstring = "\n LiveViewControlsIDObjectID: " + LiveViewControlsID +\
			"\n CameraControlObjectID: " + CameraControlObjectID +\
			"\n DebugMode: " + debugMode +\
			"\n dataObjectID: " + dataObjectID;			
		result(textstring);
		result("\n-------End----------------");
	}
	 
}

