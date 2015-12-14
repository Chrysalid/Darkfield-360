//****************************************************
// TOOLKIT FUNCTIONS & CLASS
//****************************************************

// Contains the dialog that acts as the main control interface for the toolkit.
// This is the highest level object, with the other objects contained inside it. When this one closes, they all go out of scope.
// Currently has a lot of functions that make use of the child objects, rather than putting them in their own classes.
// The Image-taking functions in particular need to be seperated out for ease of management.

class CreateDF360DialogClass : uiframe
{
	number ToolkitID; // the ID of this object
	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image.
	number isCalibrated; // flag to test if the scope is calibrated or not.
	object dataObject;
	number dataObjectID;
	object imageSetTools;
	number imageSetToolsID;
	number debugMode;
	object KeyListener;
	number KeyListenerID;
	object imageAlignmentDialog;
	number imageAlignmentDialogID;
	object scaleCalibrationDialog;
	number scaleCalibrationDialogID;
	object tiltCalibrationDialog;
	number tiltCalibrationDialogID;
	object CameraControlObject;
	number CameraControlObjectID;
	object ImageProcessingObject;
	number ImageProcessingObjectID;
	object ImageConfigDialog;
	number ImageConfigDialogID;
	component markerRing;
	component ringRadiusText;
	
	// Function to print out the various saved variables for debugging
	void printAllValues(object self)
	{
		result("\n\nToolkit Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ToolkitID +\
			"\nDebugMode: " + debugMode +\
			"\nEMonline: " + EMOnline +\
			"\nAllowControl: " + AllowControl +\
			"\nDataObjectID: " + DataObjectID + " and " + (dataObject.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\nKeyListenerID: " + KeyListenerID + " and " + (KeyListener.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\nimageAlignmentDialogID: " + imageAlignmentDialogID + " and " + (imageAlignmentDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid";
		result(textstring);
		result("\n-------End----------------")
	}
	
	/* Stores the dataObject */
	number storeDataObject(object self, object &theDataObject)
	{
		dataObject = theDataObject;
		dataObject.initialise(ToolkitID);
		dataObjectID = dataObject.ScriptObjectGetID();
		dataObject.setDebugMode(debugMode);
		return 1;
	}
	number getDataObjectID(object self)
	{
		return dataObjectID;
	}
	
	/* The Toolkit will store the ImageSetTools object for future use. */
	number storeImageSetTools(object self, object &theImageSetTools)
	{
		imageSetTools = theImageSetTools;
		imageSetToolsID = imageSetTools.ScriptObjectGetID();
		imageSetTools.initialise(ToolkitID, dataObjectID);
		imageSetTools.setDebugMode(debugMode);
		return imageSetToolsID;
	}
	number getImageSetToolsID(object self){
		return imageSetToolsID;
	}
	
	/* The Toolkit will store the KeyListener for future use. */
	number storeKeyListener(object self, object &theKeyListener)
	{
		KeyListener = theKeyListener;
		KeyListenerID = KeyListener.ScriptObjectGetID();
		KeyListener.initialise(ToolkitID, dataObjectID, imageSetToolsID);
		KeyListener.setDebugMode(debugMode);
		return KeyListenerID;
	}
	/* Attach the KeyListener to a display so it can function */
	void attachKeyListener(object self, imageDisplay theDisplay)
	{
		number keyToken = theDisplay.ImageDisplayAddKeyHandler(KeyListener, "HandleKey");
		if(debugmode==1){result("\nToolkit function: Attached key handler object to display. KeyToken = " + keyToken);}
		if(debugmode==1){result("\nToolkit function: Attempting to set the Keyhandler to Listen to the view display....");}
		KeyListener.startListening(keyToken);
		if(debugmode==1){result("\nToolkit function: Keyhandler is now listening.");}
	}
	number getKeyListenerID(object self)
	{
		return KeyListenerID;
	}
	/* Store the alignment dialog for future use. */
	number storeAlignmentDialog(object self, object theAlignmentDialog)
	{
		imageAlignmentDialog = theAlignmentDialog;
		imageAlignmentDialogID = imageAlignmentDialog.ScriptObjectGetID();
		imageAlignmentDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		imageAlignmentDialog.setDebugMode(debugMode);
		return imageAlignmentDialogID;
	}
	number getAlignmentDialogID(object self)
	{
		return imageAlignmentDialogID;
	}
	
	/* Store the scale calibration dialog for future use. */
	number storeCalibrationDialog(object self, object theCalibrationDialog)
	{
		scaleCalibrationDialog = theCalibrationDialog;
		scaleCalibrationDialogID = scaleCalibrationDialog.ScriptObjectGetID();
		scaleCalibrationDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		scaleCalibrationDialog.setDebugMode(debugMode);
		return scaleCalibrationDialogID;
	}
	number getscaleCalibrationDialogID(object self)
	{
		return scaleCalibrationDialogID;
	}
	
	/* Store the tilt calibration dialog for future use. */
	number storeTiltDialog(object self, object theDialog)
	{
		tiltCalibrationDialog = theDialog;
		tiltCalibrationDialogID = tiltCalibrationDialog.ScriptObjectGetID();
		tiltCalibrationDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		tiltCalibrationDialog.setDebugMode(debugMode);
		return tiltCalibrationDialogID;
	}
	number getTiltCalibrationDialogID(object self)
	{
		return tiltCalibrationDialogID;
	}
	
	/* Store the Camera Control object */
	void storeCameraControlObject(object self, object theCameraControlObject)
	{
		CameraControlObject = theCameraControlObject;
		CameraControlObjectID = CameraControlObject.ScriptObjectGetID();
		CameraControlObject.initialise(ToolkitID, dataObjectID, imageSetToolsID); // Tell the object who it belongs to
		CameraControlObject.setDebugMode(debugMode);
	}
	number getCameraControlObjectID(object self)
	{
		return CameraControlObjectID;
	}
	
	/* Store the Image Processing object */
	void storeImageProcessingObject(object self, object theImageProcessingObject)
	{
		ImageProcessingObject = theImageProcessingObject;
		ImageProcessingObjectID = ImageProcessingObject.ScriptObjectGetID();
		ImageProcessingObject.initialise(ToolkitID, dataObjectID, imageSetToolsID, imageAlignmentDialogID); // Tell the object who it belongs to
		ImageProcessingObject.setDebugMode(debugMode);
	}
	number getImageProcessingObjectID(object self)
	{
		return ImageProcessingObjectID;
	}
	
	/* Store the Image Configuration dialog object */
	void storeImageConfigDialog(object self, object theImageConfigDialog)
	{
		imageConfigDialog = theImageConfigDialog;
		imageConfigDialogID = imageConfigDialog.ScriptObjectGetID();
		imageConfigDialog.initialise(ToolkitID, dataObjectID, imageSetToolsID); // Tell the object who it belongs to
		imageConfigDialog.setDebugMode(debugMode);
	}
	number getImageConfigDialog(object self)
	{
		return imageConfigDialogID;
	}
	
	/*
	Function to save an image using image set data and to feed those values into the image tags and imageset tags
		returns 0 on a failure/cancellation, 1 on success.
		Will save all images for an image set in a subfolder with the imageset ID
	*/
	number saveImageInImageSet(object self, image &theImage){
		if(debugmode==true){result("\nSaving Image " + theImage.ImageGetID());}
		TagGroup PersistentTags = theImage.ImageGetTagGroup();
		string imageSetID
		PersistentTags.TagGroupGetTagAsString("Darkfield360:ImageSetID", imageSetID);
		if(debugMode==true){result("\n\t ImageSetID: " + imageSetID);}
		TagGroup ImageSet
		number imageSetFound = ImageSetTools.getImageSetByID(ImageSetID, ImageSet);
		if(imageSetFound == false){
			result("\n\nImage Set with ID " + ImageSetID + " not found when saving an image!")
			return 0;
		}
		string saveDir = GetApplicationDirectory( 1100, 1 );
		// index 1100 = autosave
		string imageSetDir = PathConcatenate(saveDir, ImageSetID);
		number imageSetDirExists = DoesDirectoryExist( imageSetDir );
		if(imageSetDirExists == false){
			CreateDirectory( imageSetDir );
			imageSetDirExists = DoesDirectoryExist( imageSetDir );
			if(imageSetDirExists == false){
				result("\n\nCould not find or create a save directory when saving an image!")
				return 0;
			}
		}
		number ImageSpotNumber, shadowValue;
		string ImageType, fileName, shadowName;
		PersistentTags.TagGroupGetTagAsString("Darkfield360:ImageType", ImageType);
		PersistentTags.TagGroupGetTagAsNumber("Darkfield360:ImageSpotNumber", ImageSpotNumber);
		PersistentTags.TagGroupGetTagAsNumber("Darkfield360:ShadowValue", shadowValue);
		
		fileName = (ImageType == "BF") ? ("Brightfield_" + constructTimeStamp()) : fileName;
		fileName = (ImageType == "DF") ? ("Darkfield_" + constructTimeStamp() + "_spot_" + ImageSpotNumber) : fileName;
		fileName = (ImageType == "DP") ? ("Diffraction_" + constructTimeStamp() + "_spot_" + ImageSpotNumber) : fileName;
		fileName = (ImageType == "Bin") ? ("Binary_" + constructTimeStamp()) : fileName;
		
		shadowName = (shadowValue == 0) ? ("_middle") : shadowName;
		shadowName = (shadowValue == 1) ? ("_middle") : shadowName;
		shadowName = (shadowValue == 2) ? ("_higher") : shadowName;
		shadowName = (shadowValue == 3) ? ("_lower") : shadowName;
		
		fileName = fileName + shadowName;
		
		string filePath = PathConcatenate(imageSetDir, fileName);
		SaveAsGatan(theImage, filePath);
		
		if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
			result("\n" + filePath + " saved.")
			return 1;
		} else {
			result("\n\nFinal save check indicates the file " + filePath + " did not save. You'd better check!")
			return 0;
		}
	}
	
	
	/* Function to draw the lines on the View Window used to centre the beam and pick spots.
		If updateToolkit = 1, Adds the ring marker and stores it in the toolkit.
		Also creates a text component to update with ring diameter.
	*/
	
	void drawReticle(object self, image targetImage, number updateToolkit)
	{
		number centrex, centreY, radius, width, height;
		getSize(targetImage, width, height );
		component circle2;
		
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

		// Make the lines not selectable.
		line1.ComponentSetSelectable(0);
		line2.ComponentSetSelectable(0);
		circle1.ComponentSetSelectable(0);
		
		/* This is the ring used to mark out a target for the ring collection method. */
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		radius = 100; // Radius of the circle in pixels.
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
		
		if(updateToolkit == 1){
			markerRing = newMarkerRing;
		}

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
		if(updateToolkit == 1){
			ringRadiusText = newRingRadiusText;
		}		
	}
	
	/* Function to make the reticle, lines, etc. of any image deletable and selectable */
	void cleanReticle(object self, image myImage)
	{
		ImageDisplay imageDisp = myImage.ImageGetImageDisplay( 0 );
		Number compCount =  ComponentCountChildren( imageDisp );
		for(number i=0;i < compCount;i++){
			component annotid=imageDisp.ComponentGetChild(i);	
			annotid.ComponentSetSelectable(1);
			annotid.ComponentSetDeletable(1);
		}	
	}
	
	/* Code run to link an active View image / window to the Toolkit and set up short cut keys and things. */
	void captureViewScreen (object self)
	{
		CameraControlObject.updateEMstatus();
		if(CameraControlObject.getAllowControl() == 0){
			result("\nNo Control Permitted. Ensure a live view window is active.")
			exit(0);
		}
		dataObject.setCentreTiltHere(); // set this here to avoid false tilt values.
		if(debugMode){result("\nCapturing View Window...");}
		if(CameraControlObject.storeCameraDetails() == 0){  // Stores camera width, height and binning multiplier.
			result("\nError finding camera information.");
			throw("Error finding Camera Information");
		}
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo View Image detected when capturing Live View Window.");
			return;
		}
		self.drawReticle(viewImage, 1);
		if(debugMode==1){result("\n\tReticle added to View window.");}
		
		imageDisplay frontdisp;
		if(returnViewImageDisplay(debugMode, frontdisp) != true){
			result("\nNo View Display found.");
			exit(0);	
		}
		
		if(debugMode==1){result("\n\tKeyListener will be attached to a display. Validity: " + ImageDisplayIsValid(frontdisp));}
		self.attachKeyListener(frontdisp) // attach the keylistener to the live-view display and start it up.
		if(debugMode==1){result("\n\tKeyListener created and attached. Shortcut keys available.");}
		
		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		dataObject.setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 );
		dataObject.setOriginalScaleString(scaleString);
		if(debugMode==1){result("\n\tThe View window scale was initially set to " + dataObject.getOriginalScale() + " " + dataObject.getOriginalScaleString());}
		
		if(debugMode==true){result("\nView Window Capture complete");}
		return;
	}
		
	void ToggleDebugMode(object self){
		debugMode = (debugMode == 0) ? 1 : 0 ;
		if(debugMode == 1){
			result("\nDebug Mode Activated");
		}
		if(debugMode == 0){
			result("\nDebug Mode Deactivated");
		}
		if(dataObject.ScriptObjectIsValid()){
			dataObject.setDebugMode(debugMode);
		}
		if(KeyListener.ScriptObjectIsValid()){
			keylistener.setDebugMode(debugMode);
		}
		if(imageAlignmentDialog.ScriptObjectIsValid()){
			imageAlignmentDialog.setDebugMode(debugMode);
		}
		if(scaleCalibrationDialog.ScriptObjectIsValid()){
			scaleCalibrationDialog.setDebugMode(debugMode);
		}
		if(tiltCalibrationDialog.ScriptObjectIsValid()){
			tiltCalibrationDialog.setDebugMode(debugMode);
		}
		if(ImageSetTools.ScriptObjectIsValid()){
			ImageSetTools.setDebugMode(debugMode);
		}
	}
	
	/* Function to centre beam */
	void beamCentre(object self){
		if(CameraControlObject.getAllowControl() == true){
			number centreXTilt = dataObject.getCentreXTilt();
			number centreYTilt = dataObject.getCentreYTilt();
			moveBeamTilt ( centreXTilt, centreYTilt );
		}
	}	
	
	/* Function to change the Tilt to centre on a marked ROI point */
	// Number ImageDisplayCountROIs( ImageDisplay imgDisp )
	// ROI ImageDisplayGetROI( ImageDisplay imgDisp, Number index )
	void moveToCurrentROI (object self){
		if(debugMode==1){result("\nStart moveToCurrentROI function.");}
		number ROITracker = dataObject.getROITracker(); // This value determines which ROI to go to.
		if(debugMode==1){result("\n\tROITracker = " + ROITracker);}
		ImageDisplay viewDisplay;
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			result("\nNo active View Window detected. This should never happen.");
			exit(0);
		}
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==1){result("\n\tTotal ROIs = " + totalROI);}
		if( totalROI==0 ){
			result("\nNo ROI to go to.");
			exit(0);
		}
		if ( (ROITracker-1) >= totalROI){ // The tracker is 1 higher than the highest ROI .
			//Resets the count to 0 to avoid out-of-bounds errors and goes to Beam Centre instead.
			ROITracker = 0;
			dataObject.setROITracker(0);
			if(debugMode==1){result("\nSet ROITracker to 0. Returning to Beam Centre");}
			self.beamCentre();
			exit(0);
		}
		ROI ROItoMoveTo = viewDisplay.ImageDisplayGetROI( ROITracker );
		number xPixel, yPixel, xTiltTarget, yTiltTarget;
		if(ROItoMoveTo.ROIIsPoint() != 1){
			result("\n\tROI #" + ROITracker + " is not a point. Skipping over it.");
		}
		else
		{
			ROItoMoveTo.ROIGetPoint(xPixel, yPixel);
			if(debugMode==1){result("\n\txPixel = " + xPixel + " yPixel = " + yPixel);}
			// void pixelToTilt(object dataObject, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,
			//			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly)
			number binningMultiplier = CameraControlObject.getBinningMultiplier();
			dataObject.pixelToTilt(xPixel, yPixel, xTiltTarget, yTiltTarget, 1, 0, 0, binningMultiplier);
			if(debugMode==1){result("\n\txTiltTarget = " + xTiltTarget + " yTiltTarget = " + yTiltTarget);}
			moveBeamTilt(xTiltTarget, yTiltTarget);
		}
		if(debugMode==1){result("\nEnd moveToCurrentROI function.");}
	}
	
	//****************************************************
	// Create the top level components of the Toolkit dialog
	//****************************************************

	TagGroup makeDF360Buttons(object self)
	{
		// Creates the buttons
		TagGroup dsCalibrate = DLGCreateBevelButton(calibrateButton, calibrateButton, "calibrateButtonPress");
		TagGroup dsControls = DLGCreateBevelButton(microscopeButton, microscopeButton, "controlsButtonPress");
		TagGroup dsRing = DLGCreateBevelButton(ringButton, ringButton, "ringButtonPress");
		TagGroup dsTarget = DLGCreateBevelButton(targetButton, targetButton, "targetButtonPress");
		TagGroup dsCamera = DLGCreateBevelButton(cameraButton, cameraButton, "cameraButtonPress");
		TagGroup dsOption = DLGCreateBevelButton(optionButton, optionButton, "optionButtonPress");

		// Now add the buttons created above to the container

		taggroup container=dlgcreategroup()
		
		container.dlgaddelement(dsCalibrate)
		container.dlgaddelement(dsControls)
		container.dlgaddelement(dsRing)
		container.dlgaddelement(dsTarget)
		container.dlgaddelement(dsCamera)
		container.dlgaddelement(dsOption)
		
		container.dlgtablelayout(10,1,0)
		
		return container;
	}

	//****************************************************
	// PANEL CREATION
	//****************************************************
	// this function creates a panel for each set of controls. The buttons and fields are defined, but their functions are not.

	TagGroup makeCameraDropDownMenu(object self) // creates the pulldown menu to select camera length
	{
		if(debugMode==1){result("\nConstructing the camera length drop down menu");}
		TagGroup pulldown_items;
		TagGroup pulldown = DLGCreatePopup(pulldown_items, 1, "trackCameraLengthChange")
		pulldown_items.DLGAddPopupItemEntry("Set Camera Length");
		TagGroup CameraLengths
		if(ScriptObjectIsValid(dataObject)==1){
			if(debugMode==1){result(" from stored table...");}
			CameraLengths = dataObject.getAvailableCameraLengths();
		} else {
		if(debugMode==1){result(" from scratch...");}
			CameraLengths = NewTagList();
			CameraLengths.TagGroupInsertTagAsString(infinity(), "None");
		}		
		number availableCameraLengths = CameraLengths.TagGroupCountTags();
		number i;
		for(i=0; i < availableCameraLengths; i++){
			string value;
			TagGroupGetIndexedTagAsString(CameraLengths, i, value)
			pulldown_items.DLGAddPopupItemEntry(value);
		}
		pulldown.DLGIdentifier("CameraDropDown"); // Used to ID the menu in other functions.
		if(debugMode==1){result("  Done.");}
		//TagGroupOpenBrowserWindow(pulldown, 0);
		return pulldown;
	}
		
	taggroup makeDF360panels(object self)
	{
		taggroup panellist = dlgcreatepanellist().dlgidentifier("panellist").dlgexternalpadding(10,10)

		// BUTTON METHODS are to be defined in the class definition;

		// The first panel is for calibration
		taggroup panel1=dlgcreatepanel()
		panel1.dlgaddelement(dlgcreatelabel("Calibration")) // Label
		panel1.dlgaddelement(dlgcreatelabel("")) // Blank
		panel1.DLGAddElement(self.makeCameraDropDownMenu() )
		TagGroup tiltCalibrationAutoButton = DLGCreatePushButton("CALIBRATE TILT", "startCalibrationButtonPress")
		panel1.dlgaddelement(tiltCalibrationAutoButton)
		panel1.dlgaddelement(dlgcreatelabel("Darkfield Exposure:"))
		TagGroup DarkfieldImagingExposure = DLGCreateRealField( 30, 10, 3, "onDFChange").dlgidentifier("DarkfieldExposureFieldInput")
		panel1.dlgaddelement(DarkfieldImagingExposure)
		panel1.dlgaddelement(dlgcreatelabel("Brightfield Exposure:")) // Label
		TagGroup BrightfieldImagingExposure = DLGCreateRealField( 0.5, 10, 3, "onBFChange").dlgidentifier("BrightfieldExposureFieldInput")
		panel1.dlgaddelement(BrightfieldImagingExposure)
		panel1.dlgaddelement(dlgcreatelabel("Diffraction Pattern Exposure:")) // Label
		TagGroup DiffractionImagingExposure = DLGCreateRealField( 1, 10, 3, "onDPChange").dlgidentifier("DiffractionExposureFieldInput")
		panel1.dlgaddelement(DiffractionImagingExposure)
		
			// Arrange the buttons and things
		panel1.dlgtablelayout(2,6,0);
		
		// The second panel is for Image Sets. They can be created and configured here, and can have points added to them.
		taggroup panel2=dlgcreatepanel()
		panel2.dlgaddelement(dlgcreatelabel("Define Image Sets")) // Label
		TagGroup editImageSetButton = DLGCreatePushButton("Create/Configure Image Set", "EditImageSetButtonPress")
		panel2.dlgaddelement(editImageSetButton)
		TagGroup storePointButton = DLGCreatePushButton("Add Single Spot", "StoreDPButtonPress")
		panel2.dlgaddelement(storePointButton)
		TagGroup DarkFieldROIButton = DLGCreatePushButton("Add All ROI", "storeROIButtonPress")
		panel2.dlgaddelement(DarkFieldROIButton)
		TagGroup TakeDPImagesButton = DLGCreatePushButton("Finalise Image Set", "FinalizeImageSetButtonPress")
		panel2.dlgaddelement(TakeDPImagesButton)
		
		// Panel 3 is for controlling the Marker Ring
		taggroup panel3=dlgcreatepanel()
		panel3.dlgaddelement(dlgcreatelabel("Ring Mode:")) // Label
		TagGroup markerRingToggleButton = DLGCreatePushButton("On / Off", "RingToggleButtonPress")
		panel3.dlgaddelement(markerRingToggleButton)
		taggroup ringMarkerField=DLGCreateRealField(0, 10, 0).dlgidentifier("ringMarkerFieldInput")
		panel3.dlgaddelement(ringMarkerField)
		/*	Refer to this value by defining like so:
			taggroup intfield=self.lookupelement("ringMarkerFieldInput")
			number fieldval=dlggetvalue(intfield)
		*/
		TagGroup setRadiusButton = DLGCreatePushButton("Set Radius (1/nm)", "SetRingRadiusButtonPress")
		panel3.dlgaddelement(setRadiusButton)
		TagGroup updateRadiusButton = DLGCreatePushButton("Update Radius Text", "updateRingRadiusButtonPress")
		panel3.dlgaddelement(updateRadiusButton)
		TagGroup recenterRingButton = DLGCreatePushButton("Reset Ring", "recenterRingButtonPress")
		panel3.dlgaddelement(recenterRingButton)
		TagGroup addRingButton = DLGCreatePushButton("Add Marker Ring", "addRingButtonPress")
		panel3.dlgaddelement(addRingButton)
		
		panel3.dlgtablelayout(2,6,0); // Arrange the buttons

		// Panel 4 is a blank panel
		taggroup panel4=dlgcreatepanel()
		
		// Panel 5 is microscope controls
		taggroup panel5=dlgcreatepanel()
		panel5.dlgaddelement(dlgcreatelabel("Microscope Controls")) // Label
		TagGroup recentreBeamButton = DLGCreatePushButton("Center Beam", "beamCentreButtonPress")
		panel5.dlgaddelement(recentreBeamButton)
		
		// Panel 6 is for options
		taggroup panel6=dlgcreatepanel();
		panel6.dlgaddelement(dlgcreatelabel("Options")); // Label
		panel6.dlgaddelement(dlgcreatelabel("")); // Blank
		TagGroup dsDebug = DLGCreatePushButton("Debug Mode", "debugToggleButtonPress");
		panel6.dlgaddelement(dsDebug);
		TagGroup changeSaveDir = DLGCreatePushButton("Save Directory", "saveDirButtonPress");
		panel6.dlgaddelement(changeSaveDir);
		TagGroup enterScaleButton = DLGCreatePushButton("Set Scale", "enterScaleButtonPress");
		panel6.dlgaddelement(enterScaleButton);
		TagGroup manualTiltEntryButton = DLGCreatePushButton("Tilt Calibration", "manualTiltCalibrationButtonPress");
		panel6.dlgaddelement(manualTiltEntryButton);
		TagGroup captureViewButton = DLGCreatePushButton("Capture View", "captureViewButtonPress");
		panel6.dlgaddelement(captureViewButton);
		TagGroup saveSettingsToFile = DLGCreatePushButton("Save Settings File", "saveToolKitVariablesToFilePress");
		panel6.dlgaddelement(saveSettingsToFile);
		TagGroup loadSettingsFromFile = DLGCreatePushButton("Load Settings File", "loadToolkitVariablesFromFilePress");
		panel6.dlgaddelement(loadSettingsFromFile);
		TagGroup saveSettingsToDM = DLGCreatePushButton("Set as Default", "saveVariablesToMemoryPress");
		panel6.dlgaddelement(saveSettingsToDM);
		panel6.dlgtablelayout(2,12,0); // Arrange the buttons
		
		// Panel 7 is for final Imaging steps
		taggroup panel7=dlgcreatepanel()
		panel7.dlgaddelement(dlgcreatelabel("Dark Field Imaging")) // Label
		TagGroup DarkFieldStoredButton = DLGCreatePushButton("Start Imaging", "DarkFieldImageButtonPress")
		panel7.dlgaddelement(DarkFieldStoredButton)
		panel7.dlgaddelement(dlgcreatelabel("Image Processing")) // Label
		panel7.dlgaddelement(dlgcreatelabel("")) // Blank		
		TagGroup ProcessSingleFileButton = DLGCreatePushButton("Binary Image", "ProcessSingleFileButtonPress")
		panel7.dlgaddelement(ProcessSingleFileButton)
		TagGroup BinaryDirectoryButton = DLGCreatePushButton("Binary Directory", "ProcessDirectoryButtonPress")
		panel7.dlgaddelement(BinaryDirectoryButton)
		TagGroup AlignImagesButton = DLGCreatePushButton("Align 2 Images", "alignImagesButtonPress")
		panel7.dlgaddelement(AlignImagesButton)
		TagGroup AlignDirectoryButton = DLGCreatePushButton("Align Directory", "alignDirectoryButtonPress")
		panel7.dlgaddelement(AlignDirectoryButton)
		TagGroup CompositeMapButton = DLGCreatePushButton("Create Map", "mapDirectoryButtonPress")
		panel7.dlgaddelement(CompositeMapButton)
		
		panel7.dlgtablelayout(2,10,0); // Arrange the buttons
		
		panellist.dlgaddpanel(panel1)
		panellist.dlgaddpanel(panel2)
		panellist.dlgaddpanel(panel3)
		panellist.dlgaddpanel(panel4)
		panellist.dlgaddpanel(panel5)
		panellist.dlgaddpanel(panel7)
		panellist.dlgaddpanel(panel6)

		panellist.dlgvalue(3) // Set the panel to be displayed

		return panellist
	}
	
	
	//*********************
	// SELF STARTING
	//*********************
	// When the class is constructed it sets up a lot of stuff, but is finalised with the updateDialog() function.
	
	// Constructor
	CreateDF360DialogClass(object self)
	{
		ToolkitID = self.ScriptObjectGetID();
		debugMode = 1;
		isCalibrated = 0;		
	}
		
	// Function called on any destruction event.
	~CreateDF360DialogClass(object self)
	{
		imageDisplay imgdisp;
		if(returnViewImageDisplay(debugMode,imgdisp)){
			component annotid=imgdisp.ComponentGetChild(0)
			while (annotid.ComponentIsValid()){
				annotid.componentremovefromparent();
				annotid=imgdisp.ComponentGetChild(0);
			}
			self.beamCentre();
			// Stop the keyhandler
			if(debugMode==1){result("\nRemoving KeyHandler from View display");}
			KeyListener.stopListening(imgdisp);
		}
	result("\nToolkit has been closed.");
	}
	
	// Function to put the final dialog together and show it. Have the various objects stored inside it before hand.
	void updateDialog(object self){
		result("\nInitializing Toolkit...");
		// Configure the positioning in the top right of the application window
		TagGroup position;
		position = DLGBuildPositionFromApplication()
		position.TagGroupSetTagAsTagGroup( "Width", DLGBuildAutoSize() )
		position.TagGroupSetTagAsTagGroup( "Height", DLGBuildAutoSize() )
		position.TagGroupSetTagAsTagGroup( "X", DLGBuildRelativePosition( "Inside", 1 ) )
		position.TagGroupSetTagAsTagGroup( "Y", DLGBuildRelativePosition( "Inside", 1 ) )

		TagGroup dialog_items;	
		TagGroup dialog = DLGCreateDialog("Darkfield 360 Control Dialog", dialog_items).dlgposition(position);

		// Top level buttons made here
		dialog_items.dlgaddelement( self.makeDF360Buttons() );
		// Panels and lower level buttons built here
		dialog_items.dlgaddelement(  self.makeDF360panels() );
		// Initialises the above class object with the dialog that was made
		self.init(dialog)
		// Show the dialog as a Modeless Dialog
		self.display("Darkfield 360 Controls");
		
		// Make the dialog into a floating palette. Needs a lot of work to make it usable.
		// self.RegisterScriptPalette("Darkfield 360", "Darkfield 360");
		
		CameraControlObject.updateEMstatus();
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
		component greenCircle
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
		Select the component to make it easy to see and work with.
	*/
	
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
		scaleX = CameraControlObject.getViewScale();
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		measuredRadiusNM = measuredRadiusPX * scaleX;
		number measureRadiusAngstrom = 10 / measuredRadiusNM;
		ringRadiusText.TextAnnotationSetText("D-Spacing: " + measuredRadiusNM + " (1/nm)   /   " + measureRadiusAngstrom + " A");
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
		number binningMultiplier = CameraControlObject.getBinningMultiplier();
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = CameraControlObject.getViewScale();
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
		number binningMultiplier = CameraControlObject.getBinningMultiplier();
		number cameraHeight = CameraControlObject.getCameraHeight();
		number cameraWidth = CameraControlObject.getCameraWidth();
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
	

	//****************************************************
	// IMAGING PROCESSES
	//****************************************************
	 /*	Function to calculate tilt values used to shadow a spot	
			Returns a tag group with the information formatted for storage in Spot/Image groups in imageSets.
	*/
	
	TagGroup calculateShadowTilt (object self, number xTiltStart, number yTiltStart, number shadowDistanceNM, string higherOrLower)
	{
		if(debugMode==true){result("\nFinding Shadowing Coordinates.");}
		if(higherOrLower != "Higher" && higherOrLower != "Lower"){
			throw("higherOrLower set incorrectly as " + higherOrLower);
		}
		
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();

		// First of all we get some values for the base coordinates.
		number xTiltRelativeStart, yTiltRelativeStart; // tilt values relative to centre tilt
		xTiltRelativeStart = xTiltStart - xTiltCenter;
		yTiltRelativeStart = yTiltStart - yTiltCenter;
		//void void tiltToPixel(object self, number xTilt, number yTilt, number &xPixelShift, number &yPixelShift, number isViewWindow, number binningMultiplier)
		number xPixelShiftStart, yPixelShiftStart
		dataObject.tiltToPixel(xTiltRelativeStart, yTiltRelativeStart, xPixelShiftStart, yPixelShiftStart, 0, 1);
		// NMDistance is the D-spacing of the spot in units of 1/NM
		number NMDistanceStart = distance(yPixelShiftStart, xPixelShiftStart) * dataObject.getRefScale();
		number shadowMultiplier = shadowDistanceNM / NMDistanceStart;
		number DSpacingAng = convertInverseNMToAngstrom(NMDistanceStart); // for tag writing later
		if(shadowMultiplier.isNaN()){ // checks to see if the shadow multiplier is a real number
			throw("Shadow Multiplier is not a number");
		}		
		// Need centre -> Tilt, not just tilt value.
		number direction = (higherOrLower == "Higher") ? 1 : -1 ;
		number shadowXshift = xTiltRelativeStart * shadowMultiplier * direction;
		number shadowYshift = yTiltRelativeStart * shadowMultiplier * direction;
		if(debugMode==true){result("\n\tShadowXShift (tilt) = " + shadowXshift);}
		if(debugMode==true){result("\n\tShadowYShift (tilt) = " + shadowYshift);}
		
		number xTilt = xTiltStart + shadowXshift;
		number yTilt = yTiltStart + shadowYshift;
		
		if(debugMode==1){result("\n\tBeam tilt caclulated for 1st shadow point.");}
		// Store new beam tilt.
		number xTiltRelative = xTilt - xTiltCenter;
		number yTiltRelative = yTilt - yTiltCenter;
		
		number shadowValue = (higherOrLower == "Higher") ? 2 : 3 ;
		
		number xPixelShift, yPixelShift
		dataObject.tiltToPixel(xTiltRelative, yTiltRelative, xPixelShift, yPixelShift, 0, 1);
		
		TagGroup shadowData = imageSetTools.createNewImageForImageSet();
		shadowData.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
		shadowData.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);
		shadowData.TagGroupSetTagAsNumber("XTiltValue", xTilt);
		shadowData.TagGroupSetTagAsNumber("YTiltValue", yTilt);
		shadowData.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
		shadowData.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		shadowData.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		shadowData.TagGroupSetTagAsNumber("XShift", xPixelShift);
		shadowData.TagGroupSetTagAsNumber("YShift", yPixelShift);
		return shadowData;
	}
	
	/* Function to create tilt values & their shadow coordinates
		Returns 3 coordinate sets as Taggroups. They are formatted as generic ImageSet Image entries
		Does not add the data to anything and contains many blank values.
		xTilt, yTilt = the tilt coordinates (not relative values) of the intended spot.
		shadowDistance = distance from the central point (in 1/nm) to perform shadowing. 0 = no shadowing.
	*/
	
	void createTiltCoord (object self, number xTilt, number yTilt, number shadowDistance, TagGroup &MiddleCoordinates, TagGroup &HigherCoordinates, TagGroup &LowerCoordinates)
	{
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();
		
		if(debugMode==true)
		{
			result("\nCreating the tilt coordinate. Shadowing distance is set to " + shadowDistance + "(1/nm)");
			positionDebugWindow(debugMode);
		}
		
		number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
		xTiltRelative = xTilt - xTiltCenter;
		yTiltRelative = yTilt - yTiltCenter;
		
		MiddleCoordinates = imageSetTools.createNewImageForImageSet();
		MiddleCoordinates.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
		MiddleCoordinates.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);
		MiddleCoordinates.TagGroupSetTagAsNumber("XTiltValue", xTilt);
		MiddleCoordinates.TagGroupSetTagAsNumber("YTiltValue", yTilt);
		MiddleCoordinates.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		MiddleCoordinates.TagGroupSetTagAsNumber("ShadowValue", 1);
		number xPixelShift, yPixelShift, NMDistance;
		dataObject.tiltToPixel(xTiltRelative, yTiltRelative, xPixelShift, yPixelShift, 0, 1);
		// NMDistance is the D-spacing of the spot in units of 1/NM
		NMDistance = distance(yPixelShift, xPixelShift) * dataObject.getRefScale();
		number DSpacingAng = convertInverseNMToAngstrom(NMDistance);
		MiddleCoordinates.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		MiddleCoordinates.TagGroupSetTagAsNumber("XShift", xPixelShift);
		MiddleCoordinates.TagGroupSetTagAsNumber("YShift", yPixelShift);
		
		// For images with Shadowing activated...
		if(shadowDistance!=0)
		{
			if(debugMode==true){result("\nFinding Shadowing Coordinates.");}
			HigherCoordinates = self.calculateShadowTilt (xTilt, yTilt, shadowDistance, "Higher");
						
			// Second shadowing point
			LowerCoordinates = self.calculateShadowTilt (xTilt, yTilt, shadowDistance, "Lower");
		}
	}
	
	/* Function to store the tilt values for DP imaging in the current Image Set
		xTilt, yTilt = the tilt coordinates (not relative values) of the intended spot.
		shadowDistance = distance from the central point (in 1/nm) to perform shadowing. 0 = no shadowing.
		
		Does not store images or move anything.
	*/
	void storeTiltCoord(object self, number xTilt, number yTilt, number shadowDistance)
	{
		number DPExposure = CameraControlObject.getDPExposure();
		number tracker = dataObject.getTracker();
		number spotTracker = dataObject.getSpotTracker();
		// Generate the coordinate tags for this tilt value
		TagGroup MiddleCoordinates, HigherCoordinates, LowerCoordinates;
		self.createTiltCoord (xTilt, yTilt, shadowDistance, MiddleCoordinates, HigherCoordinates, LowerCoordinates);
		
		TagGroup spot = ImageSetTools.addSpotToCurrentImageSet(); // The 1-3 images here will be placed inside the spot group
		spotTracker = spotTracker + 1;
		tracker = tracker + 1;
		imageSetTools.addImageDataToCurrentSpot(MiddleCoordinates, "Middle"); // this is the middle image and is added to that tag in the spot taggroup

		// For images with Shadowing activated...
		if(shadowDistance!=0)
		{
			tracker = tracker + 1;
			HigherCoordinates.TagGroupSetTagAsString("ImageType", "DP");
			HigherCoordinates.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
			imageSetTools.addImageDataToCurrentSpot(HigherCoordinates, "Higher");
			
			tracker = tracker + 1;
			LowerCoordinates.TagGroupSetTagAsString("ImageType", "DP");
			LowerCoordinates.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
			imageSetTools.addImageDataToCurrentSpot(LowerCoordinates, "Lower");
		}
		dataObject.setTracker(tracker);
		dataObject.setSpotTracker(spotTracker);
	}
	

	/* Function to take a DF image by reading from the ImageSet Tag group
		imageSet - the image set Tag group to take data from
		spotID - the spot number of the desired image
		imageLabel - the label of the image to be taken. Usually "Higher/Lower/Middle"
		ImageTags - persistent Tag group that will also be attached to the image.
	*/
	
	image takeDFImage (object self, TagGroup imageSet, number spotID, string imageLabel, TagGroup &persistentImageTags ){
		if(debugMode==true){result("\n Taking a Darkfield Image...");}
		
		if( imageSet.TagGroupIsValid() == false ){
			throw("Error when loading Image Set in DFImage function.");
		}
		TagGroup DFImageList, DFImageGroupTags, DFImageTags;
		if(debugMode==true){result("\n\t Loading DF image data... ");}
		imageSet.TagGroupGetTagAsTagGroup("Images", DFImageList);
		DFImageList.TagGroupGetIndexedTagAsTagGroup(spotID, DFImageGroupTags);
		DFImageGroupTags.TagGroupGetTagAsTagGroup(imageLabel, DFImageTags);
		// DFImageTags should now contain all of the required data for the DF image to be made.
		if( DFImageTags.TagGroupIsValid() == false ){
			throw("Error when loading DF Data in DFImage function.");
		}
		if(debugMode==true){result("\t Loading Complete.");}
		
		number xTiltTarget, yTiltTarget, relativeXTilt, relativeYTilt;
		// Read relative xTilt and yTilt from array
		DFImageTags.TagGroupGetTagAsNumber("XTiltRelative", relativeXTilt);
		DFImageTags.TagGroupGetTagAsNumber("YTiltRelative", relativeYTilt);
		
		xTiltTarget = dataObject.getCentreXTilt() + relativeXTilt;
		yTiltTarget = dataObject.getCentreYTilt() + relativeYTilt;
		
		// Move the beam tilt to this value.
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to imaging manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". Add your own modes in or replace these ones if your scope is different.
		if ( CameraControlObject.isImagingMode() == false ) {
			if(debugMode==true){
				result("\nTakeDFImage() called when EM not in imaging mode. Is in mode: " + opticsMode);
			}
			result("\nIf this mode is an imaging mode of your microscope then it needs to be added to the DF360 toolkit list of imaging mode names.");
			if (!ContinueCancelDialog( "Switch to an imaging mode before continuing." )){
				Throw( "User aborted process." );
			}
		}
		opticsMode = EMGetImagingOpticsMode();
		
		
		// Take the  Image
		if(debugMode==true){result("\n\t Taking Exposure...");}
		number Exposure = CameraControlObject.getDFExposure();
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		image DFImage;
		DFImage := sscUnprocessedAcquire(Exposure,0,0,cameraWidth,cameraHeight);
		if(debugMode==true){result("\t done.");}
		
		// Retrive values for image tags...
		number shadowValue
		number shadowDistance
		number DSpacingAng
		string ImageSetID;
		imageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID);
		DFImageTags.TagGroupGetTagAsNumber("ShadowValue", shadowValue);
		DFImageTags.TagGroupGetTagAsNumber("shadowDistance", shadowDistance);
		DFImageTags.TagGroupGetTagAsNumber("DSpacingAng", DSpacingAng);

		// Create Image Tags...
		TagGroup ImageTags = ImageSetTools.createNewImageForImageSet();
		// ImageTags.TagGroupSetTagAsNumber("ImageID"); // Unique imageID number
		ImageTags.TagGroupSetTagAsString("ImageSetID", ImageSetID);
		ImageTags.TagGroupSetTagAsString("ImageType", "DF");
		ImageTags.TagGroupSetTagAsNumber("ExposureTime", Exposure);
		ImageTags.TagGroupSetTagAsNumber("XTiltRelative", relativeXTilt);
		ImageTags.TagGroupSetTagAsNumber("YTiltRelative", relativeYTilt);		
		ImageTags.TagGroupSetTagAsNumber("XTiltValue", xTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("YTiltValue", yTiltTarget);		
		ImageTags.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		ImageTags.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		ImageTags.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);

		if(debugMode==true){result("\n\t attaching Darkfield360 tags to image's persistent tags");}
		// attach these tags to the image's Persistent Tag group
		TagGroup persistentTG = DFImage.ImageGetTagGroup();
		persistentTG.TagGroupAddLabeledTagGroup("Darkfield360", ImageTags)
		// Return a copy of the tags for outside functions. Making a copy makes sure they will not be accidentally changed later.
		if(debugMode == true){result("\n\t making copy of image tags.");}
		persistentImageTags = ImageTags.TagGroupClone();
		
		return DFImage;
	}

	/* Function to take a DP image by reading from the ImageSet Tag group
			imageSet - the image set Tag group to take data from
			spotID - the spot number of the desired image
			imageLabel - the label of the image to be taken. Usually "Higher/Lower/Middle"
			persistentImageTags - variable to return the persistent image tags after they are generated for ease of reference.
		It will add persistent image tags to the image under the Darkfield360 tag
	*/
	
	image takeDPImage(object self, TagGroup imageSet, number spotID, string imageLabel, TagGroup &persistentImageTags)
	{
		if(debugMode==true){result("\n takeDPImage function started...");}
		TagGroup DPImageTags, SpotData, targetSpotData;
		string ImageSetID;
		{result("\n\t recalling ImageSetID");}
		imageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID);
		// arguments: (TagGroup tagGroup, String tagPath, TagGroup subGroup )
		{result("\n\t generating spot tag group address");}
		string tagPath = "Spots";
		{result("\n\t Loading all spot information into tag group");}
		imageSet.TagGroupGetTagAsTagGroup(tagPath, SpotData);
		{result("\n\t Loading Spot " + SpotID);}
		SpotData.TagGroupGetIndexedTagAsTagGroup(SpotID, targetSpotData);
		{result("\n\t Loading Middle/Higher/Lower DP setting");}
		targetSpotData.TagGroupGetTagAsTagGroup(imageLabel, DPImageTags); // Loads the DP image information into this variable for reference.
	
		number xTiltTarget, yTiltTarget, relativeXTilt, relativeYTilt;
		
		// Read relative xTilt and yTilt from Tag group
		DPImageTags.TagGroupGetTagAsNumber("XTiltRelative", relativeXTilt);
		DPImageTags.TagGroupGetTagAsNumber("YTiltRelative", relativeYTilt);
		
		xTiltTarget = dataObject.getCentreXTilt() + relativeXTilt;
		yTiltTarget = dataObject.getCentreYTilt() + relativeYTilt;
		
		// Move the beam tilt to this value.
		{result("\n\t moving beam tilt to spot");}
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to Diffraction mode manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". 
		if ( CameraControlObject.isImagingMode() == true ) {
			if(debugMode==true){
				result("\nTakeDPImage() called when EM in an imaging mode. Is in mode: " + opticsMode);
			}
			if (!ContinueCancelDialog( "Switch to diffraction mode before continuing." )){
				Throw( "User aborted process." );
			}
		}
		opticsMode = EMGetImagingOpticsMode();
		if ( CameraControlObject.isDiffractionMode() == false ) {
			if(debugMode==true){
				result("\nTakeDPImage() called when EM is not in a diffraction mode. It is in mode: " + opticsMode);
				result("\nIf this mode is a diffraction imaging mode of your microscope then it needs to be added to the DF360 toolkit list of diffraction mode names.");
			}
			if (!ContinueCancelDialog( "Switch to diffraction mode before continuing." )){
				Throw( "User aborted process." );
			}
		}
		opticsMode = EMGetImagingOpticsMode();
		
		// Take the  Image
		number Exposure = CameraControlObject.getDPExposure();
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		{result("\n\t taking image of DP.");}
		image DPImage;
		DPImage := sscUnprocessedAcquire(Exposure,0,0,cameraWidth,cameraHeight);
		
		// Create Image Tags to be attached to the image itself (not the image set)
		TagGroup ImageTags = ImageSetTools.createImageTags();

		// Retrive image values
		number shadowValue, shadowDistance, DSpacingAng;
		DPImageTags.TagGroupGetTagAsNumber("ShadowValue", ShadowValue);
		DPImageTags.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		DPImageTags.TagGroupGetTagAsNumber("DSpacingAng", DSpacingAng);
		// retrive calibration values
		number xTiltx, xTilty, yTiltx, yTilty;
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:xTiltx", xTiltx);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:xTilty", xTilty);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:yTiltx", yTiltx);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:yTilty", yTilty);
		// retrieve settings not used in the DP mode
		number RingMode, IntegratedImage, NumberOfIntegrations, DegreeStep
		imageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		imageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		imageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		imageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// Write values to tag group.
		ImageTags.TagGroupSetTagAsString("ImageType", "DP");
		ImageTags.TagGroupSetTagAsString("ImageSetID", ImageSetID);
		ImageTags.TagGroupSetTagAsNumber("ImageSpotNumber", spotID);
		ImageTags.TagGroupSetTagAsString("ImageMode", opticsMode);
		ImageTags.TagGroupSetTagAsString("CameraLength", dataObject.getCameraLength());
		ImageTags.TagGroupSetTagAsNumber("ExposureTime", Exposure);
		ImageTags.TagGroupSetTagAsNumber("XTiltRelative", relativeXTilt);
		ImageTags.TagGroupSetTagAsNumber("YTiltRelative", relativeYTilt);		
		ImageTags.TagGroupSetTagAsNumber("XTiltValue", xTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("YTiltValue", yTiltTarget);		
		ImageTags.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		ImageTags.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		ImageTags.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:xTiltx", xTiltx);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:xTilty", xTilty);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:yTiltx", yTiltx);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:yTilty", yTilty);
		ImageTags.TagGroupSetTagAsNumber("RingMode", RingMode);
		ImageTags.TagGroupSetTagAsNumber("IntegratedImage", IntegratedImage);
		ImageTags.TagGroupSetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		ImageTags.TagGroupSetTagAsNumber("DegreeStep", DegreeStep);
		
		if(debugMode==true){result("\n\t attaching Darkfield360 tags to image's persistent tags");}
		// attach these tags to the image's Persistent Tag group
		TagGroup persistentTG = DPImage.ImageGetTagGroup();
		persistentTG.TagGroupAddLabeledTagGroup("Darkfield360", ImageTags)
		// Return a copy of the tags for outside functions. Making a copy makes sure they will not be accidentally changed later.
		if(debugMode == true){result("\n\t making copy of image tags.");}
		persistentImageTags = ImageTags.TagGroupClone();
		if(debugMode == true){result("\n returning DPImage. End of function.");}
		return DPImage;
	}

	/* Function to take a Brightfield Image for an ImageSet
		Mostly the same as the TakeDF function with a few tweaks and no shadowing.
	*/
	image takeBFImage (object self, TagGroup imageSet, TagGroup &persistentImageTags ){
		if(debugMode == true){result("\n Taking BF Image...");}
		TagGroup ImageSetTags, BFImageTags, SpotTags;
		imageSet.TagGroupGetTagAsTagGroup("Images", ImageSetTags);
		ImageSetTags.TagGroupGetIndexedTagAsTagGroup(0, SpotTags);
		SpotTags.TagGroupGetTagAsTagGroup("Middle", BFImageTags); // Loads the BF image information into this variable for reference.
	
		string ImageSetID;
		imageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID);
		number xTiltTarget, yTiltTarget, relativeXTilt, relativeYTilt;
		
		// Read relative xTilt and yTilt from array. Should be 0 for both
		BFImageTags.TagGroupGetTagAsNumber("XTiltRelative", relativeXTilt);
		BFImageTags.TagGroupGetTagAsNumber("YTiltRelative", relativeYTilt);
		
		if(relativeXTilt != 0 || relativeYTilt !=0 ){
			Throw("Relative X/Y Tilts are not 0. ImageSet misconfigured.")
		}
		
		xTiltTarget = dataObject.getCentreXTilt() + relativeXTilt;
		yTiltTarget = dataObject.getCentreYTilt() + relativeYTilt;
		
		// Move the beam tilt to this value.
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to imaging manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". Add your own modes in or replace these ones if your scope is different.
		if ( CameraControlObject.isImagingMode() == false ) {
			if(debugMode==true){
				result("\nTakeBFImage() called when EM not in imaging mode. Is in mode: " + opticsMode);
			}
			result("\nIf this mode is an imaging mode of your microscope then it needs to be added to the DF360 toolkit list of imaging mode names.");
			if (!ContinueCancelDialog( "Switch to an imaging mode before continuing." )){
				Throw( "User aborted process." );
			}
		}
		opticsMode = EMGetImagingOpticsMode();
		
		
		// Take the  Image
		number Exposure = CameraControlObject.getBFExposure();
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		image BFImage;
		BFImage := sscUnprocessedAcquire(Exposure,0,0,cameraWidth,cameraHeight);
		
		// Create Image Tags...
		TagGroup ImageTags = ImageSetTools.createNewImageForImageSet();
		// ImageTags.TagGroupSetTagAsNumber("ImageID"); // Unique imageID number
		ImageTags.TagGroupSetTagAsString("ImageSetID", ImageSetID);
		ImageTags.TagGroupSetTagAsString("ImageType", "BF");
		ImageTags.TagGroupSetTagAsNumber("ExposureTime", Exposure);
		ImageTags.TagGroupSetTagAsNumber("XTiltRelative", relativeXTilt);
		ImageTags.TagGroupSetTagAsNumber("YTiltRelative", relativeYTilt);		
		ImageTags.TagGroupSetTagAsNumber("XTiltValue", xTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("YTiltValue", yTiltTarget);		
		ImageTags.TagGroupSetTagAsNumber("ShadowValue", 0);
		ImageTags.TagGroupSetTagAsNumber("ShadowDistance", 0);
		ImageTags.TagGroupSetTagAsNumber("DSpacingAng", 0);
		ImageTags.TagGroupSetTagAsString("ImageMode", opticsMode);

		TagGroup persistentTG = BFImage.ImageGetTagGroup();
		persistentTG.TagGroupAddLabeledTagGroup("Darkfield360", ImageTags)
		// Return a copy of the tags for outside functions. Making a copy makes sure they will not be accidentally changed later.
		if(debugMode == true){result("\n\t making copy of image tags.");}
		persistentImageTags = ImageTags.TagGroupClone();
		return BFImage;
	}
	
	
	/* This function will use the spot data stored in the current image set to create DP images.
			It will then update the image set with information about the images being taken.
			This step is the final phase before DF imaging begins.
			Uses function: image takeDPImage(object self, TagGroup imageSet, number spotID, string imageLabel)
	*/
	
	void finalizeImageSet(object self){
		if(debugMode==true){result("\nFinalizing Image Set...");}
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(isCalibrated == 0){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		ImageDisplay viewDisplay
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			throw("No Live View window found");
		}
		// Is there an open imageSet?
		TagGroup targetImageSet
		number isCurrent = imageSetTools.getCurrentImageSet(targetImageSet)
		if(isCurrent == 0){
			Throw("There is no Image Set to finalize. Please create one.");
		}
		if(debugMode==true){result("\n\tImage Set found and loaded.");}
		// Has the imageSet been finalized, and so does not accept new points?
		// Boolean TagGroupGetTagAsNumber( TagGroup tagGroup, String tagPath, NumberVariable number )
		number DPsTaken
		if(targetImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken) == 0){
			result("\n\tImage Set does not have the DPSTaken tag. This is an error.");
			Throw("Image Set Error: No DPsTaken flag.");
		} 
		if(DPsTaken == 1){
			result("\n\tImage Set has been finalized all ready.");
			result("\n\tPlease create a new image set.");
			throw("Image Set has all ready been finalized.");
		}
		// ImageSetID check
		string ImageSetID
		if(targetImageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID) == 0){
			result("\n\tImage Set does not have the ImageSetID tag. This is an error.");
			Throw("Image Set Error: No ImageSetID flag.");
		} 
		
		
		// Shadow mode settings check
		number shadowDistanceNM, shadowMode;
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode) == 0){
			result("\n\tImage Set does not have the ShadowMode tag. This is an error.");
			Throw("Image Set Error: No ShadowMode flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowDistance", shadowDistanceNM) == 0){
			result("\n\tImage Set does not have the ShadpwDistance tag. This is an error.");
			Throw("Image Set Error: No ShadowDistance flag.");
		}
		if(ShadowMode == 0){ // the shadow distance can be a non-0 value, yet not be used.
			shadowDistanceNM = 0;
		}
		if(ShadowMode==1 && shadowDistanceNM==0){
			result("\n\tImage Set shadowing distance is set to 0, but the shadow mode option is On.");
			Throw("Shadow distance not set");
		}
		// Image save & display settings
		number AutoSaveImages, AutoDisplayImages;
		if(targetImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages) == 0){
			result("\n\tImage Set does not have the AutoSaveImages tag. This is an error.");
			Throw("Image Set Error: No AutoSaveImages flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages) == 0){
			result("\n\tImage Set does not have the AutoDisplayImages tag. This is an error.");
			Throw("Image Set Error: No AutoDisplayImages flag.");
		}
		// Ring Mode checks
		number RingMode, NumberOfRingPoints, RingDSpacing;
		if(targetImageSet.TagGroupGetTagAsNumber("RingMode", RingMode) == 0){
			result("\n\tImage Set does not have the RingMode tag. This is an error.");
			Throw("Image Set Error: No RingMode flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("NumberOfRingPoints", NumberOfRingPoints) == 0){
			result("\n\tImage Set does not have the NumberOfRingPoints tag. This is an error.");
			Throw("Image Set Error: No NumberOfRingPoints flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("RingDSpacing", RingDSpacing) == 0){
			result("\n\tImage Set does not have the RingDSpacing tag. This is an error.");
			Throw("Image Set Error: No RingDSpacing flag.");
		}
		if(RingDSpacing <= 0){
			result("\n\tImage Set RingDSpacing tag is < 0");
			Throw("Image Set Error: RingDSpacing is " + RingDSpacing);
		}
		// Integrated Image Checks
		number IntegratedImage, NumberOfIntegrations, AutoSaveNonInt, AutoDisplayNonInt
		if(targetImageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage) == 0){
			result("\n\tImage Set does not have the IntegratedImage tag. This is an error.");
			Throw("Image Set Error: No IntegratedImage flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations) == 0){
			result("\n\tImage Set does not have the NumberOfIntegrations tag. This is an error.");
			Throw("Image Set Error: No NumberOfIntegrations flag.");
		}
		if(NumberOfIntegrations <= 0){
			result("\n\tNumberOfIntegrations is <= 0.");
			throw("Image Set Error: Number of Integrations per image is too small");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", AutoSaveNonInt) == 0){
			result("\n\tImage Set does not have the AutoSaveNonInt tag. This is an error.");
			Throw("Image Set Error: No AutoSaveNonInt flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", AutoDisplayNonInt) == 0){
			result("\n\tImage Set does not have the AutoDisplayNonInt tag. This is an error.");
			Throw("Image Set Error: No AutoDisplayNonInt flag.");
		}
		
		// Generate Ring Mode Coordinates
		if(RingMode == true){
			if(debugMode==true){result("\nStarting to create Ring Data Points.");}
			number DPExposure = CameraControlObject.getDPExposure();
			number DFExposure = CameraControlObject.getDFExposure();
			number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
			dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
			number cameraWidth = CameraControlObject.getCameraWidth();
			number cameraHeight = CameraControlObject.getCameraHeight();
			number binning = CameraControlObject.getBinningMultiplier();
			number beamCentreX = dataObject.getCentreXTilt();
			number beamCentreY = dataObject.getCentreYTilt();
			number RefScale = dataObject.getRefScale();
			
			// Ask the user how many DPs will be taken when the image set is finalized (not how many darkfield images will be tkaen)
			number NumberOfPoints;
			if (getnumber( "How many diffraction patterns should be recorded?", 16, NumberOfPoints) == false ){
				throw("Cancelled by User");
			}
			
			if(debugMode==true){result("\n\tNumber of points to DP is " + numberOfPoints);}
			if(numberOfPoints<=0){
				throw("Wrong number of points.");
			}
			number angleStep = 360 / numberOfPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
			
			// alpha is angle between X axis and TiltX axis in radians.
			number Px, Py, alpha;
			alpha = atan2(xTiltVectorY, xTiltVectorX);
			// tiltVectorX is the tilt needed to reach the target radius using only xTilt
			number tiltVectorX
			// RingDSpacing is the d-spacing in Angstroms. convert to (1/NM).
			number radiusNM = convertAngstromToInverseNM(RingDSpacing);
			// convert to pixels
			number radiusPX = radiusNM / RefScale;
						
			tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
			if(debugMode==true){
				result("\n\tAlpha for tiltVectorX: " + alpha );
				result("\n\ttan (alpha): " + tan(alpha) );
				result("\n\tRingRadius (1/NM): " + radiusNM );
				result("\n\tRingRadius (px): " + radiusPX );
				result("\n\ttiltVectorX = " + tiltVectorX);
			}
			number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.
			
			number estimatedTime = numberOfPoints * DFExposure / 60;
			if (!ContinueCancelDialog( "Complete darkfield imaging of this ring will take approximately " + estimatedTime + " minutes. Would you like to continue to target these points?" )){
				throw("Cancelled by User");
			}
			result("\nGenerating Tilt coordinates for DP imaging.");

			number i, angleToMove, tiltX, tiltY;
			number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
			for(i=0; i < numberOfPoints; i++){
				angleToMove = i * angleStep; // This is in Degrees.
				angleToMove = angleToMove * pi() / 180; // converted to radians
				
				// work out change in tilt to get there.
				tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
				tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
				
				number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
				xTiltRelative = tiltX - beamCentreX
				yTiltRelative = tiltY - beamCentreY;				
				
				self.storeTiltCoord (tiltX, tiltY, shadowDistanceNM);
				
				if(remainder(i,60)==0){ //This part just puts a '.' every 60 calculations as a crude progress bar, and a line break every 60.
					result("\n");
				} else {
					result(".");
				}
			}
			result("\nTilt coordinates have been generated for RingMode imaging");
		}
		
		
		// Load the spot coordinate tag group and check there are some spots there.
		if(debugMode==true){result("\n\tRetrieving spot data... ");}
		TagGroup spots;
		targetImageSet.TagGroupGetTagAsTagGroup("Spots", spots);
		number NumberOfSpots = spots.TagGroupCountTags();
		if(NumberOfSpots == 0){
			result("\n\tImage Set does not have any spots in it.");
			Throw("Image Set Error: No spots found.");
		}
		if(debugMode==true){result(NumberOfSpots + " spots found.");}
		
		// spots are now stored and ready to be imaged. The process for the loop is:
			// Acquire image/s
				// Uses function: image takeDPImage(object self, TagGroup imageSet, number spotID, string imageLabel)
			// Update the DF Images group.
				// Add DF image information to image set for it to be taken later
			// Save +/ show images
			// update image set with image ID or file name for DP image
			
		number i;
		for(i=0; i < NumberOfSpots; i++){
			if(debugMode==true){result("\n\t Recording spot " + i + " (Middle)...");}
			TagGroup newDFImageData
			image DPImage := self.takeDPImage( targetImageSet, i, "Middle", newDFImageData)
			if(debugMode==true){result("\n\t Exposure done.");}
			image DPImageLower, DPImageHigher;
			TagGroup NewSpotSet, NewMiddleDF, higherImageData, NewHigherDF, lowerImageData, NewLowerDF;
			// Update the DF Images group, unless ringMode is active.
			if(RingMode == false){
				if(debugMode==true){result("\n\t Creating Spot in ImageSet:Images ...");}
				NewSpotSet = ImageSetTools.addImageToCurrentImageSet(); // creates a new set of 'spots' in the imageset:Images indexed taggroup
				if(debugMode==true){result(" done.");}
				
				if(debugMode==true){result("\n\t Creating image settings for ImageSet:Images[spot index]:Middle ...");}
				NewMiddleDF = ImageSetTools.createNewImageForImageSet(newDFImageData); // Uses loaded version of createNewImageForImageSet function to fill in a lot of the values before hand.
				NewMiddleDF.TagGroupSetTagAsString("ImageType", "DF");
				NewMiddleDF.TagGroupSetTagAsNumber("ExposureTime", CameraControlObject.getDFExposure());
				if(debugMode==true){result(" done.");}
				
				if(debugMode==true){result("\n\t Adding image settings to ImageSet:Images[spot index]:Middle ...");}
				// add the tag group to the new 'image' spot set
				NewSpotSet.TagGroupSetTagAsTagGroup("Middle", NewMiddleDF);
				if(debugMode==true){result(" done.");}
			}
			
			if(ShadowMode == true && (i > 0)){
				if(debugMode==true){result("\n\t Shadowing spot " + i + " (Higher)...");}
				DPImageHigher := self.takeDPImage( targetImageSet, i, "Higher", higherImageData);
				if(RingMode == false){
					NewHigherDF = ImageSetTools.createNewImageForImageSet(higherImageData);
					NewHigherDF.TagGroupSetTagAsString("ImageType", "DF");
					NewHigherDF.TagGroupSetTagAsNumber("ExposureTime", CameraControlObject.getDFExposure());
					// add the tag group to the new 'image' spot set
					NewSpotSet.TagGroupSetTagAsTagGroup("Higher", NewHigherDF);
				}
				
				if(debugMode==true){result("\n\t Shadowing spot " + i + " (Lower)...");}
				DPImageLower := self.takeDPImage( targetImageSet, i, "Lower", lowerImageData);
				if(RingMode == false){
					NewLowerDF = ImageSetTools.createNewImageForImageSet(lowerImageData);
					NewLowerDF.TagGroupSetTagAsString("ImageType", "DF");
					NewLowerDF.TagGroupSetTagAsNumber("ExposureTime", CameraControlObject.getDFExposure());
					// add the tag group to the new 'image' spot set
					NewSpotSet.TagGroupSetTagAsTagGroup("Lower", NewLowerDF);
				}
			}
			
			if(debugMode==true){result("\n\t Images taken.");}
			if(AutoDisplayImages == true){
				if(debugMode==true){result("\n\t Displaying images.");}
				showImage(DPImage);
				if(ShadowMode == true && (i > 0)){
					showImage(DPImageHigher);
					showImage(DPImageLower);
				}
			}
			
			if(AutoSaveImages == true ){
				if(debugMode==true){result("\n\t Saving images.");}
				self.saveImageInImageSet(DPImage);
				if(ShadowMode == true && (i > 0)){
					self.saveImageInImageSet(DPImageHigher);
					self.saveImageInImageSet(DPImageLower);
				}
			}
			
		} // End of loop
		// If the RingMode is being used then we must generate the actual set of DF coordinates
		 // NumberOfRingPoints variable is the number of points.
		 
		// Generate Ring Mode Coordinates
		if(RingMode == true){
			// Delete the DF image tag group created by DP imaging previously.
			TagGroup DFToDelete;
			targetImageSet.TagGroupGetTagAsTagGroup("Images", DFToDelete);
			if(debugMode==true){result("\n\tDeleting " + DFToDelete.TagGroupCountTags() + " existing DF image groups");}
			while (DFToDelete.TagGroupCountTags() > 0){
				DFToDelete.TagGroupDeleteTagWithIndex(0);
				if(debugMode==true){result("\n\t\tTag removed.");}
			}
			if(debugMode==true){result("\n\tDeleted existing DF image groups.");}
			
			if(debugMode==true){result("\n\tStarting to create Ring coordinates for DF Imaging.");}
			number DPExposure = CameraControlObject.getDPExposure();
			number DFExposure = CameraControlObject.getDFExposure();
			number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
			dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
			number cameraWidth = CameraControlObject.getCameraWidth();
			number cameraHeight = CameraControlObject.getCameraHeight();
			number binning = CameraControlObject.getBinningMultiplier();
			number beamCentreX = dataObject.getCentreXTilt();
			number beamCentreY = dataObject.getCentreYTilt();
			number RefScale = dataObject.getRefScale();
			
	
			if(debugMode==true){result("\n\tNumber of points to DF is " + NumberOfRingPoints);}
			if(NumberOfRingPoints<=0){
				throw("Wrong number of points.");
			}
			number angleStep = 360 / NumberOfRingPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
			targetImageSet.TagGroupSetTagAsNumber("DegreeStep", angleStep); // record this to the image Set data
			// alpha is angle between X axis and TiltX axis in radians.
			number Px, Py, alpha;
			alpha = atan2(xTiltVectorY, xTiltVectorX);
			// tiltVectorX is the tilt needed to reach the target radius using only xTilt
			number tiltVectorX
			// RingDSpacing is the d-spacing in Angstroms. convert to (1/NM).
			number radiusNM = convertAngstromToInverseNM(RingDSpacing);
			// convert to pixels
			number radiusPX = radiusNM / RefScale;
						
			tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
			if(debugMode==true){
				result("\n\tAlpha for tiltVectorX: " + alpha );
				result("\n\ttan (alpha): " + tan(alpha) );
				result("\n\ttiltVectorX = " + tiltVectorX);
			}
			number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.

			number i, angleToMove, tiltX, tiltY;
			number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
			for(i=0; i < NumberOfRingPoints; i++){
				angleToMove = i * angleStep; // This is in Degrees.
				angleToMove = angleToMove * pi() / 180; // converted to radians
				
				// work out change in tilt to get there.
				tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
				tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
				
				/* debug code to check maths in detail
				if(debugMode==true){result("\n\ti: " + i);}
				if(debugMode==true){result("\n\tAngleToMove: " + angleToMove);}
				if(debugMode==true){result("\n\tsin(angle): " + sin(angleToMove));}
				if(debugMode==true){result("\n\tcos(angle): " + cos(angleToMove));}
				if(debugMode==true){result("\n\tAdditional TiltX: " + (averageTiltVector * sin(angleToMove)));}
				if(debugMode==true){result("\n\tAdditional TiltY: " + (averageTiltVector * sin(angleToMove)));}
				if(debugMode==true){result("\n\t---------");}
				*/
				TagGroup imageGroup = ImageSetTools.addImageToCurrentImageSet(); // Create the spot group for this set of images.
				
				TagGroup MiddleCoordinates, HigherCoordinates, LowerCoordinates;
				self.createTiltCoord (tiltX, tiltY, shadowDistanceNM, MiddleCoordinates, HigherCoordinates, LowerCoordinates); 
				
				MiddleCoordinates.TagGroupSetTagAsString("ImageType", "DF");
				MiddleCoordinates.TagGroupSetTagAsNumber("ExposureTime", DFExposure);
				
				ImageSetTools.addImageDataToCurrentImageSet(MiddleCoordinates, "Middle"); // add the image data to the Images list
				
				if(ShadowMode == true){
					HigherCoordinates.TagGroupSetTagAsString("ImageType", "DF");
					HigherCoordinates.TagGroupSetTagAsNumber("ExposureTime", DFExposure);
					ImageSetTools.addImageDataToCurrentImageSet(HigherCoordinates, "Higher"); // add the image data to the Images list
					
					LowerCoordinates.TagGroupSetTagAsString("ImageType", "DF");
					LowerCoordinates.TagGroupSetTagAsNumber("ExposureTime", DFExposure);
					ImageSetTools.addImageDataToCurrentImageSet(LowerCoordinates, "Lower"); // add the image data to the Images list
				}				
				
				if(remainder(i,60)==0){ //This part just puts a '.' every 60 calculations as a crude progress bar, and a line break every 60.
					result("\n");
				} else {
					result(".");
				}
			}
			result("\nTilt coordinates have been generated for RingMode DF imaging");
		}
		
		if(debugMode==true){result("\n\t All spots imaged. Setting DPsTaken flag. to 1");}
		// update the image set to show that DP were taken.
		targetImageSet.TagGroupSetTagAsNumber("DPsTaken", 1);
	}
	
	/* Function will use the stored Tilt values to take darkfield images. 1st Image will be Bright Field of site.
		ImageSet = the image set tag group. Only use the current image set for now.
	*/
	number darkFieldImage (object self, TagGroup ImageSet){
		
		if(ImageSet.TagGroupIsValid() == false){
			throw("ImageSet Taggroup is Invalid or does not exist.")
		}
		
		number DPExposure = CameraControlObject.getDPExposure();
		number DFExposure = CameraControlObject.getDFExposure();
		number BFExposure = CameraControlObject.getBFExposure();
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();
		
		image ReferenceDP = dataObject.getReferenceDP();
		
		if(debugMode==true){result("\nLoading the variables for this image set for DF imaging...");}
		string DFImageSetID;
		ImageSet.TagGroupGetTagAsString("ImageSetID", DFImageSetID);
		if(debugMode==true){result("\n\t ImageSetID is " + DFImageSetID);}
		number saveNonIntegrated, saveImages, displaynonintegrated, displayImages;
		ImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", saveNonIntegrated);
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", saveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", displaynonintegrated);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", displayImages);

		if(saveImages == 0 && displayImages == 0){
			throw("Images must be shown, saved or both.");
		}
		
		number integration
		ImageSet.TagGroupGetTagAsNumber("IntegratedImage", integration);
		if(debugMode==true){result("\n\t integration is " + integration);}
		
		number ringMode
		ImageSet.TagGroupGetTagAsNumber("RingMode", ringMode);
		if(debugMode==true){result("\n\t RingMode is " + RingMode);}
		
		number shadowMode
		ImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode);
		if(debugMode==true){result("\n\t ShadowMode is " + shadowMode);}
		
		number numberOfIntegrations
		ImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		if(debugMode==true){result("\n\t NumberOfIntegrations is " + NumberOfIntegrations);}
		
		number degreeStep
		ImageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		if(debugMode==true){result("\n\t DegreeStep is " + DegreeStep);}
		
		number shadowDistance
		ImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		if(debugMode==true){result("\n\t shadowDistance is " + shadowDistance);}
		
		image startBFImage;
		image middleIntegratedImage, higherIntegratedImage, lowerIntegratedImage;
		image middleSumImage, higherSumImage, lowerSumImage;
		
		if(integration == 1){
			if(debugMode==true){result("\nCreating Integrated Images to populate...");}
			middleIntegratedImage = RealImage( "Integrated Image Middle", 4, cameraWidth, cameraHeight );
			middleIntegratedImage = middleIntegratedImage * 0;
			higherIntegratedImage = RealImage( "Integrated Image Higher", 4, cameraWidth, cameraHeight );
			higherIntegratedImage = higherIntegratedImage * 0;
			lowerIntegratedImage = RealImage( "Integrated Image Lower", 4, cameraWidth, cameraHeight );
			lowerIntegratedImage = lowerIntegratedImage * 0;
			
			middleSumImage = RealImage( "Sum of all middle", 4, cameraWidth, cameraHeight );
			middleSumImage = middleSumImage * 0;
			higherSumImage = RealImage( "Sum of all top", 4, cameraWidth, cameraHeight );
			higherSumImage = higherSumImage * 0;
			lowerSumImage = RealImage( "Sum of all lower", 4, cameraWidth, cameraHeight );
			lowerSumImage = lowerSumImage * 0;
		}
		
		TagGroup DFImages;
		if (ImageSet.TagGroupGetTagAsTagGroup("Images", DFImages) == false){
			throw("An Error was encountered when loading the dark field image tag group data.")
		}
		
		number TotalExposures = DFImages.TagGroupCountTags() + (DFImages.TagGroupCountTags() * 2 * shadowMode);
		number TotalSpots = DFImages.TagGroupCountTags();
		
		Result("\n------------- Starting Dark Field Imaging Process ---------------\n");
		result("\n" + TotalExposures + " exposures to take, taking " + (DFExposure * TotalExposures / 60) + " minutes.");
		
		if (!ContinueCancelDialog( "Insert the Objective Aperture and center it. Switch to Imaging Mode and check the Brightfield image before continuing." )){
			throw("Aborted by User. No data changed.")
		}
		
		// Create the first image, which will always be a bright field image of the region
		moveBeamTilt(xTiltCenter, yTiltCenter); // Move to the tilt coords
		TagGroup BFImageTags;
		startBFImage := self.takeBFImage(ImageSet, BFImageTags);
		
		if(saveImages == 1){
			self.saveImageInImageSet(startBFImage);
		}
		
		if(displayImages == true) // If displaying the image...
		{
			showImage(startBFImage);
		}
		
		if(debugMode==true){result("\n Bright Field Image taken and saved/displayed.");}
		
		// Code used to save integrated files, which are not yet part of the saveImageInImageSet() function.
		string fileDirectory, fileName;
		string saveDir = GetApplicationDirectory( 1100, 1 );
			// index 1100 = autosave
		string imageSetDir = PathConcatenate(saveDir, DFImageSetID);
		number imageSetDirExists = DoesDirectoryExist( imageSetDir );
		if(imageSetDirExists == false){
			fileDirectory = saveDir;
		} else {
			fileDirectory = imageSetDir;
		}
		
		if(debugMode==true){result("\n Starting to record Darkfield Images.");}
		number im
		for(im=1; im < TotalSpots ; im++){
			TagGroup ThisSpotGroup, MiddleImage, HigherImage, LowerImage;
			TagGroup MiddleImageTags, HigherImageTags, LowerImageTags;			
			image MiddleDFImage, HigherDFImage, LowerDFImage;
			
			if(debugMode==true){result("\n\t Loading data for spot " + im + "... ");}
			DFImages.TagGroupGetIndexedTagAsTagGroup(im, ThisSpotGroup); // The image group
			ThisSpotGroup.TagGroupGetTagAsTagGroup("Middle", MiddleImage);
			ThisSpotGroup.TagGroupGetTagAsTagGroup("Higher", HigherImage);
			ThisSpotGroup.TagGroupGetTagAsTagGroup("Lower", LowerImage);
			if(debugMode==true){result("\t Loading Complete.");}
			
			if(debugMode==true){result("\n\t Taking Middle Image for spot " + im);}
			MiddleDFImage := self.takeDFImage (ImageSet, im, "Middle", MiddleImageTags);
			
			// If there are no Lower or Higher tag groups then the Higher/Lower tags in the Images:[im]: group will be empty BUT STILL EXIST
			// The loaded groups (LowerImage/HigherImage) will report as invalid if this is the case.
			// Previous version code used the DoesTagExist() function instead, but this was not correct.
			if(HigherImage.TagGroupIsValid() == true){
				HigherDFImage := self.takeDFImage (ImageSet, im, "Higher", HigherImageTags);
			}
			if(LowerImage.TagGroupIsValid() == true){
				LowerDFImage := self.takeDFImage (ImageSet, im, "Lower", LowerImageTags);
			}
			
			if(debugMode==true){result("\n\t Saving images for spot " + im);}
			if(saveImages == true){
				if((integration == 0) || (saveNonIntegrated == 1)){ // Saves each image. Integrations must be done seperately.
					self.saveImageInImageSet(MiddleDFImage);
					if(HigherImage.TagGroupIsValid() == true){
						self.saveImageInImageSet(HigherDFImage);
					}
					if(LowerImage.TagGroupIsValid() == true){
						self.saveImageInImageSet(LowerDFImage);
					}
				}
			} else { // If not saving the image...
				MiddleImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
				if(HigherImage.TagGroupIsValid() == true){
					HigherImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
				if(LowerImage.TagGroupIsValid() == true){
					LowerImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
			}
			
			if(debugMode==true){result("\n\t Displaying images for spot " + im);}
			if(displayImages == true) // If displaying the images...
			{
				if((integration == 0) || (displayNonIntegrated == 1)){ // Does not show the integrated images. These must be done seperately.
					showImage(MiddleDFImage);
					if(HigherImage.TagGroupIsValid() == true){
						showImage(HigherDFImage);
					}
					if(LowerImage.TagGroupIsValid() == true){
						showImage(LowerDFImage);
					}
				}
			}
			
			if(debugMode==true){result("\n\t Integrating images for spot " + im);}
			// If in Integrated image mode add it to the current integration image and display any completed integrated images.
			if(integration==true){
				middleIntegratedImage = middleIntegratedImage + MiddleDFImage;
				higherIntegratedImage = higherIntegratedImage + HigherDFImage;
				lowerIntegratedImage = lowerIntegratedImage + LowerDFImage;
				result("\nIntegrating Exposures for spot " + im +" of " + TotalSpots);
				if(remainder(im, NumberOfIntegrations) == 0){ // save this integrated image and start a new one.
					middleSumImage = middleSumImage + middleIntegratedImage;
					middleIntegratedImage.ImageSetName( "Integrated Image " + im + " Middle" );
					if(displayImages == true){
						showImage( middleIntegratedImage.ImageClone() );
					}
					if(saveImages == true){
						fileName = "Integrated_Image_" + im + "_Middle";
						string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
						SaveAsGatan(middleIntegratedImage, filePath);
					}
					result("\nIntegrated " + NumberOfIntegrations + " exposures into Integrated Image " + im);
					middleIntegratedImage = middleIntegratedImage * 0; // Set old image to 0 for next integration sequence.
										
					if(HigherImage.TagGroupIsValid() == true){
						higherSumImage = higherSumImage + higherIntegratedImage;
						higherIntegratedImage.ImageSetName( "Integrated Image " + im + " Higher" );
						if(displayImages == true){
							showImage( higherIntegratedImage.ImageClone() );
						}
						if(saveImages == true){
							fileName = "Integrated_Image_" + im + "_Higher";
							string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
							SaveAsGatan(higherIntegratedImage, filePath);
						}
						higherIntegratedImage = higherIntegratedImage * 0; // Set old image to 0 for next integration sequence.
					}
					if(LowerImage.TagGroupIsValid() == true){
						lowerSumImage = lowerSumImage + lowerIntegratedImage;
						lowerIntegratedImage.ImageSetName( "Integrated Image " + im + " Lower" );
						if(displayImages == true){
							showImage( lowerIntegratedImage.ImageClone() );
						}
						if(saveImages == true){
							fileName = "Integrated_Image_" + im + "_Lower";
							string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
							SaveAsGatan(lowerIntegratedImage, filePath);
						}
						lowerIntegratedImage = lowerIntegratedImage * 0; // Set old image to 0 for next integration sequence.
					}
				}
			} // end of integration section
			if(debugMode==true){result("\n\t Completed operations for spot " + im);}
		} // end of for loop
		
		// Create the final BF image to compare to the start. This can track drift.
		if(debugMode==true){result("\n Taking Final BF Image...");}
		image endBFImage;
		TagGroup EndBFImageTags;
		self.beamCentre();
		endBFImage := self.takeBFImage(ImageSet, EndBFImageTags);
		
		if(saveImages == 1){
			self.saveImageInImageSet(endBFImage);
		} else { // If not saving the image...
			EndBFImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
		}
		
		if(displayImages == true) // If displaying the image...
		{
			showImage(endBFImage);
		}
		if(debugMode==true){result("\n BF Image operations complete.");}
		
		// Find the image drift.
		if(debugMode==true){result("\n Calculating image drift during exposures...");}
		number xShiftBF, yShiftBF;
		findImageShift(startBFImage, endBFImage, xShiftBF, yShiftBF, debugMode);
		result("\nDuring the exposures the image drifted by (" + xShiftBF + ", " + yShiftBF + ") pixels")
		
		if(integration==true){ //show or save the sum images
			if(saveImages){
				fileName = "Sum_Of_Integrated_Images_Middle"
				string fileDirectory = GetApplicationDirectory("auto_save", 0);
				string filePath = PathConcatenate(fileDirectory, fileName);
				SaveAsGatan( middleSumImage, filePath );
				result("\nSaved sum of integration images as " + filePath);
				if(shadowMode == true){
					fileName = "Sum_Of_Integrated_Images_Higher"
					filePath = PathConcatenate(fileDirectory, fileName);
					SaveAsGatan( higherSumImage, filePath );

					fileName = "Sum_Of_Integrated_Images_Lower"
					filePath = PathConcatenate(fileDirectory, fileName);
					SaveAsGatan( lowerSumImage, filePath );
				}
			}
			if(displayImages == true){
				showImage(middleSumImage);
				if(shadowMode == true){
					showImage(higherSumImage);
					showImage(lowerSumImage);
				}
			}
		}

		positionDebugWindow(debugMode); //Return View Window to the front if it is not all ready
		Result("\n------------- Ending Dark Field Imaging Process ---------------\n");
	}

	/* 	Function that performs the Calibration process
			Take image of the DP for reference when storing.
			// Store the central beam as the first data point. Do we still do this with the new tags?
			Calibrate the Tilt Vectors (pixels per tilt unit)
	 */
	 
	 void startDPStoring(object self){
		// Load data from dataObject
		// Not Reference DP. That is set later.
		number tracker = dataObject.getTracker();
		number DPExposure = CameraControlObject.getDPExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		if(debugMode==true){result("\nstartDPStoring()");}
		
		number refScaleX, refScaleY;
		refScaleX = dataObject.getRefScale();
		if(debugMode==true){result("\nrefScaleX: " + refScaleX);}
		if(refScaleX == 0){
			throw("Please set Camera Length");
		}		
		
		// Update the camera values: binningMultiplier, and Reference DP image.
		CameraControlObject.storeCameraDetails();
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo view Image detected. This error should not be possible, but here we are.");
		}	
		if(tracker!=0){ //("There is image/calibration data all ready stored.")
			if(!ContinueCancelDialog( "There is all ready calibration data stores. Would you like to overwrite it?" )){
				isCalibrated = 1;
				return;
			}
		}
		// Set central Tilt values
		dataObject.setCentreTiltHere();
		
		number oldTracker = dataObject.getTracker();
		dataObject.setTracker(0);
		
		number xTilt, yTilt;
		EMGetBeamTilt(xTilt, yTilt);
		number xTiltRelative = 0;
		number yTiltRelative = 0;

		dataObject.setTracker( 1 );
		
		if(oldTracker != 0){ // reset tracker so stored spots are still recorded in the totals
			dataObject.setTracker( oldTracker ); 
		}
		
		if(xTiltVectorX != 0){
			result("\nCurrent Tilt Vector settings are:");
			result("\n\txTilt(X): " + xTiltVectorX);
			result("\n\txTilt(Y): " + xTiltVectorY);
			result("\n\tyTilt(X): " + yTiltVectorX);
			result("\n\tyTilt(Y): " + yTiltVectorY);
			/*Boolean TwoButtonDialog( String prompt, String acceptLabel, String rejectLabel )*/
			if(TwoButtonDialog("Use existing tilt values?", "Yes", "No")){
				printCommands();
				isCalibrated = 1;
				return;
			}
		}
		
		number centreXTilt = dataObject.getCentreXTilt();
		number centreYTilt = dataObject.getCentreYTilt();
		/* This part gets the tilt vectors. */
		// X TILT
		result("\n\n\tPlease move the pattern to the approximate d-spacing you will be imaging using the X-TILT control.");
		if (!ContinueCancelDialog( "Please move the pattern to the approximate d-spacing you will be imaging using the X-TILT control." )){
			Throw( "User abort." );
		}
		result("\nStoring X-Tilt pattern...");
		image xTiltDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
		number xTiltPixelShiftX, xTiltPixelShiftY, xTiltShiftX, xTiltShiftY;
		EMGetBeamTilt(xTiltShiftX,xTiltShiftY);
		xTiltShiftX = xTiltShiftX - centreXTilt;
		findImageShift(dataObject.getReferenceDP(), xTiltDP, xTiltPixelShiftX, xTiltPixelShiftY, debugMode);
		xTiltVectorX = xTiltPixelShiftX / xTiltShiftX;
		if(isNaN(xTiltVectorX)||isInfinite(xTiltVectorX)){
			xTiltVectorX = 0;
		}
		xTiltVectorY = xTiltPixelShiftY / xTiltShiftX;
		if(isNaN(xTiltVectorY)||isInfinite(xTiltVectorY)){
			xTiltVectorY = 0;
		}
		if(debugMode==true){
			result("\nxTiltShiftX was " + xTiltShiftX);
			result("\nxTiltPixelShiftX was " + xTiltPixelShiftX + " and xTiltPixelShiftY was " + xTiltPixelShiftY);
			result("\nxTiltVectorX was " + xTiltVectorX + " and xTiltVectorY was " + xTiltVectorY);
		}
		closeImage(xTiltDP);
		
		self.beamCentre();
		
		// Y TILT
		Result("\n\n\tPlease move the pattern to the approximate d-spacing you will be imaging using the Y-TILT control.")
		if (!ContinueCancelDialog( "Please move the pattern to the approximate d-spacing you will be imaging using the Y-TILT control." )){
			Throw( "User abort." );
		}
		result("\nStoring Y-Tilt pattern...");
		image yTiltDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
		number yTiltPixelShiftX, yTiltPixelShiftY, yTiltShiftX, yTiltShiftY;
		EMGetBeamTilt(yTiltShiftX,yTiltShiftY);
		yTiltShiftY = yTiltShiftY - centreYTilt;
		findImageShift(dataObject.getReferenceDP(), yTiltDP, yTiltPixelShiftX, yTiltPixelShiftY, debugMode);
		yTiltVectorX = yTiltPixelShiftX / yTiltShiftY;
		yTiltVectorY = yTiltPixelShiftY / yTiltShiftY;
		if(isNaN(yTiltVectorX)||isInfinite(yTiltVectorX)){
			yTiltVectorX = 0;
		}
		yTiltVectorY = yTiltPixelShiftY / yTiltShiftY;
		if(isNaN(yTiltVectorY)||isInfinite(yTiltVectorY)){
			yTiltVectorY = 0;
		}
		if(debugMode==true){
			result("\nyTiltShiftY was " + yTiltShiftY);
			result("\nyTiltPixelShiftX was " + yTiltPixelShiftX + " and yTiltPixelShiftY was " + yTiltPixelShiftY);
			result("\nyTiltVectorX was " + yTiltVectorX + " and yTiltVectorY was " + yTiltVectorY);
		}
		closeImage(yTiltDP);
		self.beamCentre();
		TagGroup vectors = NewTagGroup();
		vectors.TagGroupCreateNewLabeledTag("xTiltx");
		vectors.TagGroupCreateNewLabeledTag("xTilty");
		vectors.TagGroupCreateNewLabeledTag("yTiltx");
		vectors.TagGroupCreateNewLabeledTag("yTilty");
		vectors.TagGroupSetTagAsNumber("xTiltx", xTiltVectorX);
		vectors.TagGroupSetTagAsNumber("xTilty", xTiltVectorY);
		vectors.TagGroupSetTagAsNumber("yTiltx", yTiltVectorX);
		vectors.TagGroupSetTagAsNumber("yTilty", yTiltVectorY);
		dataObject.setTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		dataObject.setTiltVectorCalibrations(dataObject.getCameraLength(), vectors);
		
		// What do we do about generating / updating ImageSets?
		isCalibrated = 1;
		result("\nCalibration Complete.");
		printCommands();
		return;
	}

	//****************************************************
	// ENTIRE RING IMAGING FUNCTIONS
	//****************************************************

	 /* Function to return the radius of the marker ring in pixels for unbinned images */
	 number markerRingRadius(object self)
	 {
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		number binning = CameraControlObject.getBinningMultiplier();
		number beamPixelCentreX, beamPixelCentreY, tiltVectorX, tiltVectorY, targetRadiusPX, scaleX, scaleY;
		scaleX = dataObject.getRefScale(); // Scales for an unbinned image
		scaleY = dataObject.getRefScale(); 
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
	 
	/* Function to take a pixel radius and load the calculated tilt coordinates into the data array
		
	*/
	void loadRingPoints (object self, number radiusPX, number shadowDistanceNM, number numberOfPoints )
	{
		// Load data from dataObject
		if(debugMode==true){result("\nStarting to create Ring Data Points.");}
		number DPExposure = CameraControlObject.getDPExposure();
		number DFExposure = CameraControlObject.getDFExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		number binning = CameraControlObject.getBinningMultiplier();
		number beamCentreX = dataObject.getCentreXTilt();
		number beamCentreY = dataObject.getCentreYTilt();
		
		TagGroup newImageSet = imageSetTools.createNewImageSet();
		newImageSet.TagGroupSetTagAsNumber("RingMode", 1);
		newImageSet.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
		newImageSet.TagGroupSetTagAsNumber("DSpacingAng", dataObject.convertPixelDistanceToNM(radiusPX, 0, binning));
		
		if(debugMode==true){result("\n\tData Object loaded into variables.");}

		// If not calibrated stop here!
		if((xTiltVectorX==0) && (xTiltVectorY==0) && (yTiltVectorX==0) && (yTiltVectorY==0)){
			throw("Please perform the tilt calibration first.")
		}
		
		if(debugMode==true){result("\n\tNumber of points is " + numberOfPoints);}
		if(numberOfPoints<=0){
			throw("Wrong number of points.");
		}
		number angleStep = 360 / numberOfPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
		newImageSet.TagGroupSetTagAsNumber("DegreeStep", angleStep); // record this to the image Set data
		// alpha is angle between X axis and TiltX axis in radians.
		number Px, Py, alpha;
		alpha = atan2(xTiltVectorY, xTiltVectorX);
		// tiltVectorX is the tilt needed to reach the target radius using only xTilt
		number tiltVectorX
		
		/* debug code for checking maths
		if(debugMode==true){result("\nTiltVectorX Calculation values:");}
		if(debugMode==true){result("\n\tRadiusPX: " + radiusPX);}
		if(debugMode==true){result("\n\tRadiusPX ^ 2: " + radiusPX**2);}
		if(debugMode==true){result("\n\txTiltVectorX: " + xTiltVectorX);}
		if(debugMode==true){result("\n\txTiltVectorX ^ 2: " + xTiltVectorX**2);}
		if(debugMode==true){result("\n\ttan(alpha): " + tan(alpha));}
		if(debugMode==true){result("\n\ttan(alpha) ^ 2: " + tan(alpha)**2);}
		if(debugMode==true){result("\n\tTiltVectorX ^ 2: " + radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ));}
		*/
		
		tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
		if(debugMode==true){
			result("\n\tAlpha for tiltVectorX: " + alpha );
			result("\n\ttan (alpha): " + tan(alpha) );
			result("\n\ttiltVectorX = " + tiltVectorX);
		}
		number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.
		
		number estimatedTime = numberOfPoints * DFExposure / 60;
		if (!ContinueCancelDialog( "Complete darkfield imaging of this ring will take approximately " + estimatedTime + " minutes. Would you like to target these points?" )){
			throw("Cancelled by User");
		}
		imageSetTools.addImageSet(newImageSet); // add image set to toolkit now that it is confirmed.
		result("\nGenerating Tilt coordinates...");

		number i, angleToMove, tiltX, tiltY;
		number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
		for(i=0; i < numberOfPoints; i++){
			angleToMove = i * angleStep; // This is in Degrees.
			angleToMove = angleToMove * pi() / 180; // converted to radians
			
			// work out change in tilt to get there.
			tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
			tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
			
			number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
			xTiltRelative = tiltX - beamCentreX
			yTiltRelative = tiltY - beamCentreY;
			
			/* debug code to check maths in detail
			if(debugMode==true){result("\n\ti: " + i);}
			if(debugMode==true){result("\n\tAngleToMove: " + angleToMove);}
			if(debugMode==true){result("\n\tsin(angle): " + sin(angleToMove));}
			if(debugMode==true){result("\n\tcos(angle): " + cos(angleToMove));}
			if(debugMode==true){result("\n\tAdditional TiltX: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\tAdditional TiltY: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\t---------");}
			*/
			
			TagGroup thisImage = ImageSetTools.createNewImageForImageSet();
			thisImage.TagGroupSetTagAsString("ImageType", "DP");
			thisImage.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
			thisImage.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
			thisImage.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);		
			thisImage.TagGroupSetTagAsNumber("XTiltValue", tiltX);
			thisImage.TagGroupSetTagAsNumber("YTiltValue", tiltY);
			thisImage.TagGroupSetTagAsNumber("ShadowValue", 1);
			thisImage.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
			thisImage.TagGroupSetTagAsNumber("DSpacingAng", dataObject.convertPixelDistanceToNM(radiusPX, 0, binning));

			if(remainder(i,60)==0){ //This part just puts a '.' every calculations as a crude progress bar, and a line break every 60.
				result("\n");
			} else {
				result(".");
			}
		}
		result("\nTilt coordinates have been generated for darkfield imaging");
	 }

	/* Function to record a selection of diffraction patterns from a ring dataset.
		ImageSet - tag group generated by loadRingPoints
		numberOfDP - number of DPs to take. They will be distributed evenly around the ring.
		Note: saveImages and displayImages can both be set to 0 to skip this process entirely.
		
		Returns 1/0 to indicate failure or success.
	*/
	number imageRingDP (object self, TagGroup ImageSet, number numberOfDP)
	{
		number saveImages, displayImages
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", saveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", displayImages);
		
		if( saveImages == 0 && displayImages == 0 ){
			result("No diffraction patterns of the ring were taken because the save images and display images inputs were both 0");
			return 1;
		}
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = CameraControlObject.getCameraWidth();
		number cameraHeight = CameraControlObject.getCameraHeight();
		number binning = CameraControlObject.getBinningMultiplier();
		number DPExposure = CameraControlObject.getDPExposure();
		number beamCentreX = dataObject.getCentreXTilt();
		number beamCentreY = dataObject.getCentreYTilt();
		
		TagGroup spots
		ImageSet.TagGroupGetTagAsTagGroup("Spots", spots);
		number TotalSpots = spots.TagGroupCountTags();
		
		number i
		for(i=0; i < numberOfDP; i++){
			number j = 1 + round(( TotalSpots / numberOfDP ) * i)
			// Load coordinates 
			TagGroup thisDP
			spots.TagGroupGetIndexedTagAsTagGroup(j, thisDP);
			number XTiltRelative, YTiltRelative;
			thisDP.TagGroupGetTagAsNumber("XTiltRelative", XTiltRelative);
			thisDP.TagGroupGetTagAsNumber("YTiltRelative", YTiltRelative);
			// Move there
			moveBeamTilt( XTiltRelative + beamCentreX, YTiltRelative + beamCentreY );
			// Take image
			image DPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
			string angleName = " ";
			angleName = angleName + round (360 / (numberOfDP * (i+1) ));
			string fileName = "Ring at " + angleName + " deg"
			DPImage.ImageSetName(fileName);
			showImage(DPImage);
			number refScaleX = dataObject.getRefScale(); // Fix the image's scale for future use.
			ImageSetDimensionScale(DPImage, 0, refScaleX)
			ImageSetDimensionUnitString(DPImage, 0, "1/nm" )
			ImageSetDimensionScale(DPImage, 1, refScaleX)
			ImageSetDimensionUnitString(DPImage, 1, "1/nm" )	
			self.drawReticle(DPImage, 0); // add the reticle so that the exact spot targetted can be seen
			self.cleanReticle(DPImage); // clean it so the reticle etc can be editted later.
			DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // Image can be closed without saving warning.
			if(saveImages == true){
				string fileDirectory = GetApplicationDirectory("auto_save", 0);
				string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
				SaveAsGatan( DPImage, filePath );
			}
			if(displayImages == false){
				DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // just added
				closeImage( DPImage );
			}
		}
		self.beamCentre();
		return 1;
	} 
	

	/* TOP LEVEL BUTTON FUNCTIONS */
	void calibrateButtonPress(object self)
		{
			//this is the response when the Calibration button is pressed
			// It should make the calibration panel appear
			taggroup panellist=self.lookupelement("panellist")
			// number panelvalue=dlggetvalue(panellist); to get the current value
			number panelvalue=0
			panellist.dlgvalue(panelvalue)
			return
		}
		
	void controlsButtonPress(object self) // Will have buttons to change the tilt
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 4
			panellist.dlgvalue(panelvalue)
			return
		}

	void targetButtonPress(object self)
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 1
			panellist.dlgvalue(panelvalue)
			return
		}

	void ringButtonPress(object self)
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 2
			panellist.dlgvalue(panelvalue)
			return
		}		
		
	void optionButtonPress(object self)
		{
			// Will display some kind of instructions
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 6
			panellist.dlgvalue(panelvalue)
			return
		}
	
	void cameraButtonPress(object self)
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 5
			panellist.dlgvalue(panelvalue)
			return
		}
		
	/* CALIBRATION PANEL BUTTON FUNCTIONS */
	
	void trackCameraLengthChange(object self, TagGroup tg)
	{
		number returnno=val(dlggetstringvalue(tg)) - 1 // the option #
		string returnname;
		dlggetnthlabel(tg, returnno, returnname) // convert option # to label
		if(debugMode==true){result("\nSelection is " + returnname);}
		dataObject.setCameraLength(returnname);
		
		// update camera
		CameraControlObject.storeCameraDetails();
		
		// Update the scales
		number newScale = dataObject.getScaleCalibration(returnname);
		if(debugMode==true){result("\nNew Scale is " + newScale);}

		dataObject.setRefScale(newScale);
		
		// update the Tilt vectors from the stored table.
		TagGroup vectors
		if (TagGroupGetTagAsTagGroup (dataObject.getTiltVectorCalibrations(), returnname, vectors) == 0){
			result("\nError changing the tilt calibration. Camera length not found in calibration tables.")
		}
		number xTVx, xTVy, yTVx, yTVy;
		vectors.TagGroupGetTagAsNumber("xTiltx", xTVx);
		vectors.TagGroupGetTagAsNumber("xTilty", xTVy);
		vectors.TagGroupGetTagAsNumber("yTiltx", yTVx);
		vectors.TagGroupGetTagAsNumber("yTilty", yTVy);
		dataObject.setTiltVectors(xTVx, xTVy, yTVx, yTVy);
		
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			if(debugMode==true){result("\nNo View Window detected.");}
			exit(0); // Stop here if no view window is there.
		}
		
		// View image scale
		number binning = CameraControlObject.getBinningMultiplier();

		ImageSetDimensionScale(viewImage, 0, (newScale * binning))
		ImageSetDimensionUnitString(viewImage, 0, "1/nm" )
		ImageSetDimensionScale(viewImage, 1, (newScale * binning))
		ImageSetDimensionUnitString(viewImage, 1, "1/nm" )

		// Reference image scale
		image refImg := dataObject.getReferenceDP();
		if(refImg.ImageIsValid()){
			ImageSetDimensionScale(refImg, 0, newScale)
			ImageSetDimensionUnitString(refImg, 0, "1/nm" )
			ImageSetDimensionScale(refImg, 1, newScale)
			ImageSetDimensionUnitString(refImg, 1, "1/nm" )	
		}
	}
	
	void startCalibrationButtonPress (object self)
	{	
		if(CameraControlObject.getAllowControl() == 0){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and it has been captured.")
			exit(0);
		}
		if (!ContinueCancelDialog( "Please Centre the beam before continuing..." )){
			Throw( "User aborted process." );
		}
		self.startDPStoring();
	}
	
	/* Functions to change the exposure times when the fields on the Calibration Panel are changed by the user. */
	
	void onDFChange (object self, TagGroup tg)
	{
		number newDFExposure = tg.dlggetvalue();
		CameraControlObject.setDFExposure(newDFExposure);
		if(debugMode==true){result("\nDarkField Exposure time set to " + newDFExposure + " seconds");}
	}
	void onBFChange (object self, TagGroup tg)
	{
		number newBFExposure = tg.dlggetvalue();
		CameraControlObject.setBFExposure(newBFExposure);
		if(debugMode==true){result("\nBrightField Exposure time set to " + newBFExposure + " seconds");}
	}
	void onDPChange (object self, TagGroup tg)
	{
		number newDPExposure = tg.dlggetvalue();
		CameraControlObject.setDPExposure(newDPExposure);
		if(debugMode==true){result("\nDiffraction Pattern Exposure time set to " + newDPExposure + " seconds");}
	}	
	
		
	/* CONTROL PANEL BUTTON FUNCTIONS*/
	void beamCentreButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active.")
			return;
		}
		if(debugMode==true){result("\nCentralizing Beam");}
		self.beamCentre();
	}

		
	/* IMAGE PANEL BUTTON FUNCTIONS */
	
	void EditImageSetButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		number useValues;
		TagGroup ImageSet
		if( ImageSetTools.getCurrentImageSet(ImageSet) == 0){
			// There is no current image set, so we must make a new one.
			useValues = ImageConfigDialog.inputNewCalibration("New");
		} else {
			// There is an existing image set, so use that one or make a new one.
			if ( TwoButtonDialog( "Do you wish to edit the existing Image Set?", "Yes", "No, make a new one" ) == 0){
				// Do not use existing one...
				useValues = ImageConfigDialog.inputNewCalibration("New");
			} else {
				// Use existing one... 
				string imageSetID;
				if(ImageSetTools.getImageSetID(ImageSet, imageSetID) == 1){
					// If the imageSet has a valid ID
					useValues = ImageConfigDialog.inputNewCalibration(imageSetID);
				} else {
					// If no valid ID is found...
					result("\nImageSetID not found inside existing ImageSet tag group. Creating New Image Set.")
					useValues = ImageConfigDialog.inputNewCalibration("New");
				}
			}
		}
		
		// We now have an image set stored in the ImageConfig dialog object, but not here. If useValues is 1, the user pressed okay. The image set needs adding to the current list of imagesets or the existing set needs updating.
		// Determining which is needed is up to the ImageSetTools function, not here, since the Toolkit should not have any of its own imageSet tools.
		
		if( useValues == 1){
			if(debugMode==true){result("\nUser made or changed an image set. Updating imageset list.");}
			ImageConfigDialog.addImageSetToImageList();
			return;
		} else {
			if(debugMode==true){result("\nUser cancelled image set creation/edit. No changes made.");}
			return;
		}
	}
	
	
	// This button saves the current tilt setting for the current ImageSet with the storeTiltCoord() function.
	// Does not create any images or move the beam.
	void StoreDPButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		// Stores a diffraction spot's tilt coordinates and takes a picture to reference the spot in future.
		if(isCalibrated == 0)
		{
			Throw("Data not stored. Please Calibrate the system first.");
		}
		// Is there an open imageSet?
		TagGroup targetImageSet
		number isCurrent = imageSetTools.getCurrentImageSet(targetImageSet)
		if(isCurrent == 0){
			Throw("There is no Image set to save this point inside. Please create one.");
		}
		// Has the imageSet been finalized, and so does not accept new points.
		// Boolean TagGroupGetTagAsNumber( TagGroup tagGroup, String tagPath, NumberVariable number )
		number DPsTaken
		if(targetImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken) == 0){
			result("\n\tImage Set does not have the DPSTaken tag. This is an error.");
			Throw("Image Set Error: No DPsTaken flag.");
		} 
		if(DPsTaken == 1){
			result("\n\tImage Set has been finalized and cannot have any more spots added.");
			throw("Image Set has been finalized.");
		}
		
		// storeTiltCoord (object self, number shadowDistance, number saveImages, number displayImages)
		number xTilt, yTilt
		EMGetBeamTilt(xTilt, yTilt);
		number shadowDistanceNM, shadowMode;
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode) == 0){
			result("\n\tImage Set does not have the ShadowMode tag. This is an error.");
			Throw("Image Set Error: No ShadowMode flag.");
			if(targetImageSet.TagGroupGetTagAsNumber("ShadowDistance", shadowDistanceNM) == 0){
				result("\n\tImage Set does not have the ShadpwDistance tag. This is an error.");
				Throw("Image Set Error: No ShadowDistance flag.");
			}
		}
		if(ShadowMode == 0){ // the shadow distance can be a non-0 value, yet not be used.
			shadowDistanceNM = 0;
		}
		// void storeTiltCoord (object self, number xTilt, number yTilt, number shadowDistance)
		self.storeTiltCoord ( xTilt, yTilt, shadowDistanceNM );
	}
		
	void storeROIButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(isCalibrated == 0){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		// Get the total number of ROI on the screen
		ImageDisplay viewDisplay
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			throw("No Live View window found");
		}
		// Is there an open imageSet?
		TagGroup targetImageSet
		number isCurrent = imageSetTools.getCurrentImageSet(targetImageSet)
		if(isCurrent == 0){
			Throw("There is no Image Set to save this point inside. Please create one.");
		}
		// Has the imageSet been finalized, and so does not accept new points?
		// Boolean TagGroupGetTagAsNumber( TagGroup tagGroup, String tagPath, NumberVariable number )
		number DPsTaken
		if(targetImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken) == 0){
			result("\n\tImage Set does not have the DPSTaken tag. This is an error.");
			Throw("Image Set Error: No DPsTaken flag.");
		} 
		if(DPsTaken == 1){
			result("\n\tImage Set has been finalized and cannot have any more spots added.");
			result("\n\tPlease create a new image set.");
			throw("Image Set has been finalized.");
		}
					
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==true){result("\nThere are " + totalROI + " ROI highlighted on the View Window before any shadowing.");}
		if(totalROI < 1)
		{ 
			Throw("No ROI are present.")
		}
		
		number shadowDistanceNM, shadowMode;
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode) == 0){
			result("\n\tImage Set does not have the ShadowMode tag. This is an error.");
			Throw("Image Set Error: No ShadowMode flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowDistance", shadowDistanceNM) == 0){
			result("\n\tImage Set does not have the ShadpwDistance tag. This is an error.");
			Throw("Image Set Error: No ShadowDistance flag.");
		}
		if(ShadowMode == 0){ // the shadow distance can be a non-0 value, yet not be used.
			shadowDistanceNM = 0;
		}
		if(ShadowMode==1 && shadowDistanceNM==0){
			result("\n\tImage Set shadowing distance is set to 0, but the shadow mode option is On.");
			Throw("Shadow distance not set");
		}
		
		// Create the information for the image of the centre of the diffraction pattern. This will be used to make the central BF image later.
		TagGroup CentralImage = imageSetTools.createNewImageForImageSet();
		CentralImage.TagGroupSetTagAsString("ImageType", "DP");
		CentralImage.TagGroupSetTagAsNumber("ExposureTime", CameraControlObject.getDPExposure());
		CentralImage.TagGroupSetTagAsNumber("XTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("YTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("XTiltValue", dataObject.getCentreXTilt());
		CentralImage.TagGroupSetTagAsNumber("YTiltValue", dataObject.getCentreYTilt());
		CentralImage.TagGroupSetTagAsNumber("ShadowValue", 0);
		CentralImage.TagGroupSetTagAsNumber("DSpacingAng", 0);
		
		imageSetTools.addSpotToCurrentImageSet();
		imageSetTools.addImageDataToCurrentSpot(CentralImage, "Middle");
		
		if(debugMode==true){result("\nCreating ROI List...");}
		if(debugMode==true){result("\n\tROIs present: " + totalROI);}
		// use an image to store ROI data, since this is an easy way to make an array of numbers.
		image ROIData := IntegerImage("ROI ID List", 4, 0, totalROI, 2);
		number i
		for(i=0;i<totalROI;i++){
			if(debugMode==true){result("\n\t\tROI " + i);}
			ROI targetROI = viewDisplay.ImageDisplayGetROI(i)
			number ROIID = targetROI.ROIGetID();
			if(debugMode==true){result(" has ID " + ROIID);}
			setPixel(ROIData, i , 0, ROIID);
			setPixel(ROIData, i , 1, i);
		}
		if(debugMode==true){result("\nROI List created.");}
		
		// Do I need to save the ROI list for future use now that I have image sets to hold data?
		dataobject.setROIList(ROIData);
		if(debugMode==true){result("\nROI List loaded to DataObject.");}

		
		if(debugMode==true){result("\nGenerating tilt coordinates for these ROIs...");}
		for(i=0; i < totalROI; i++)
		{
			result("\n\tROI " + (i+1) + " of " + totalROI);
			if(debugMode==true){result("\nROI " + (i+1) + " of " + totalROI +  " has index ");}
			number indexValue = getPixel(ROIData, i, 1);
			if(debugMode==true){result(indexValue);}
			dataObject.setROITracker(indexValue); // Set ROI tracker number
			
			ROI ROItoMoveTo = viewDisplay.ImageDisplayGetROI( indexValue );
			number xPixel, yPixel, xTiltTarget, yTiltTarget;
			if(ROItoMoveTo.ROIIsPoint() != 1){
				if(debugMode==true){result("\n\tROI #" + indexValue + " is not a point. Skipping over it.");}
				continue;
			}

			ROItoMoveTo.ROIGetPoint(xPixel, yPixel);
			if(debugMode==1){result("\n\txPixel = " + xPixel + " yPixel = " + yPixel);}
			// void pixelToTilt(object dataObject, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,
			//			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly, number binningMultiplier)
			number binningMultiplier = CameraControlObject.getBinningMultiplier();
			dataObject.pixelToTilt(xPixel, yPixel, xTiltTarget, yTiltTarget, 1, 0, 0, binningMultiplier);
			if(debugMode==1){result("\n\txTiltTarget = " + xTiltTarget + " yTiltTarget = " + yTiltTarget);}

			self.storeTiltCoord(xTiltTarget, yTiltTarget, shadowDistanceNM); // Store it in the system + Shadow.
		}
		if(debugMode==true){result("\nAll ROIs stored.");}
		OkDialog("All ROI have been stored. You may now Finalize the image set.");
		if(debugMode==true){
			imageSetTools.showImageSets();
		}
	}
	
	void FinalizeImageSetButtonPress(object self)
	{
		self.finalizeImageSet();
	}
	
	
		
	/* RING PANEL BUTTON FUNCTIONS*/
	void RingToggleButtonPress (object self)
	{
		if(debugMode==1){result("\n\tYou have pressed to toggle the marker ring");}
		// Make the Marker Ring and radius display visible/hidden;
		self.toggleMarkerRing();
	}
	void RingTextButtonPress (object self) // NOT IMPLEMENTED
	{
		// Make the radius display visible/hidden;
		// toggleMarkerRing(dataObject);
	}
	void SetRingRadiusButtonPress (object self)
	{
		// Take the value in the ringMarkerField text box and set the ring radius to it.
		taggroup intfield=self.lookupelement("ringMarkerFieldInput")
		number desiredRadiusNM = dlggetvalue(intfield)
		self.setRingRadius (desiredRadiusNM);
		self.updateRadius();
	}
		
	void updateRingRadiusButtonPress(object self)
	{
		self.updateRadius();
	}

	void recenterRingButtonPress (object self)
	{
		self.recenterMarkerRing();
	}

	void addRingButtonPress (object self)
	{
		// Pick an image
		image targetImage, dummyImage;
		if(!GetTwoImages("Please Select an image to add a ring marker to.", targetImage, dummyImage )){
			throw("Cancelled by User");
		}
		// Pick a colour
		number colourChoice = dataObject.getringMarkerColourTracker() + 1;
		rgbnumber componentColour = colourBlind(colourChoice);
		dataObject.setringMarkerColourTracker(colourChoice);
		// Pick a radius (Anstroms)
		number radiusAng, radiusPX, scaleX, radiusNM;
		if(!getNumber("Ring Radius in Angstroms", 3.2, radiusAng)){
			throw("Cancelled by User");
		}
		string radiusTextString = "D-Spacing: " + radiusAng + " A"
		// convert this to pixels. Can use image scale unless it is view image.
		image viewImage;
		radiusNM = 1 / (radiusAng / 10); // radius in units of 1/nm
		if(returnViewImage(debugMode, viewImage)){ // if View image present...
			number targetImageID = targetImage.ImageGetID();
			number viewImageID = viewImage.ImageGetID();
			if(targetImageID == viewImageID){ // AND the view image is being refered to
				//get scale from dataObject
				scaleX = dataObject.getRefScale() * CameraControlObject.getBinningMultiplier();
			}
		} else { // use image scale
			number scaleY
			targetImage.getScale(scaleX, scaleY);
		}
		radiusPX = radiusNM / scaleX;
		result("\nRadius 1/NM: " + radiusNM);
		result("\nscaleX: " + scaleX);
		result("\nradiusPX: " + radiusPX);
		// create circle
		self.makeNewCircle(targetImage, radiusPX, radiusTextString, componentColour);
	}

	/* Imaging & Processing Panel Functions */
	
	void DarkFieldImageButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		TagGroup imageSet;
		ImageSetTools.getCurrentImageSet(imageSet);
		number DPsTaken
		imageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken)
		
		if(DPsTaken == false)
		{
			Throw("Image Set has not been finalised");
		}
		self.darkFieldImage (imageSet);
	}
	
	void ProcessDirectoryButtonPress (object self) // Makes binaries for a collection of images.
	{
		// If you want to apply the binary process to an entire directory without file structure then use the binaryAllImages() function
		number ignoreStructure = 0;
		if(TwoButtonDialog("Make binaries of ALL images in directory?", "Yes", "No")){
			ignoreStructure = 1;
		}
		
		if(ignoreStructure==1){
			TagGroup fileList = makeFileListGroup()
			string directory;
			fileList.TagGroupGetTagAsString( "Directory" , directory )
			TagGroup imageList = makeImageIDList( fileList );
			number targetPercentage = 99;
			if(!getNumber("Enter % of dimmest pixels to be ignored", targetPercentage, targetPercentage)){
				throw("User Cancelled Process")
			}
			number ExportImages = 0;
			if(TwoButtonDialog("Export Binaries as Gifs?", "Yes","No")){
				ExportImages = 1;
			}
			self.binaryAllImages(imageList, targetPercentage, ExportImages, directory)
			result("Directory Processed");
			exit(0);
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
		
		image processDarkFieldImages(TagGroup DFList, number useShadowImages, number makeBinaries, number targetPercentage,\
		number DisplayImages, number SaveImages, number ExportImages, number debugMode ) */
		
		TagGroup DFList = self.makeDFFileListGroup();
		
		number saveImages = 0;
		if(TwoButtonDialog("Save useful Binaries in Gatan DM3 format?", "Yes", "No")){
			saveImages = 1;
			if(TwoButtonDialog("Save ALL thresholded binaries in Gatan DM3 format?", "Yes", "No")){
				saveImages = 2;
			}
		}
		
		number useShadowImages;
		DFList.TagGroupGetTagAsNumber("ShadowMode" , useShadowImages);
		if(useShadowImages == 1){
			if(!TwoButtonDialog( "Would you like to use Shadowing?", "Yes", "No" )){
				useShadowImages = 0;
			}
		}
		number makeBinaries = 1;
		if(TwoButtonDialog("Are the images binary Images?", "Yes", "No")){
			makeBinaries = 0;
		}
		
		number targetPercentage = 99; // default value for targetPercentage.
		if(makeBinaries){
			getNumber("What % of dim pixels do you want to ignore?", targetPercentage, targetPercentage);
		}
		
		number ExportImages = 0;
		if(TwoButtonDialog("Export Binaries as Gifs?", "Yes", "No")){
			ExportImages = 1;
			if(TwoButtonDialog("Save ALL thresholded binaries as Gifs?", "Yes", "No")){
				ExportImages = 2;
			}
		}
		
		number DisplayImages = 0;
		if(TwoButtonDialog("Open images for viewing?", "Yes", "No")){
			displayImages = 1;
		}
		
		image binarySum = self.processDarkFieldImages(DFList, useShadowImages, makeBinaries, targetPercentage,\
		DisplayImages, SaveImages, ExportImages)
		result("\nDirectory Processing Complete")
	}
	
	// Select an open image and make a binary out of it.
	void ProcessSingleFileButtonPress (object self)	
	{
		// Pick a single image and apply the despeckle + level function to it.
		image im1, im2;
		if(!GetTwoImages( "Select an Image.", im1, im2 )){
			throw("Cancelled by user")
		}
		number targetPercentage = 99;
		getNumber("Enter % of dimmest pixels to be ignored", targetPercentage, targetPercentage);
		image filteredImage := self.levelAndDespeckleImage(im1, targetPercentage);
		showImage(filteredImage);
	}

	// Ask for 2 images and align them with the manual alignment dialog.
	void alignImagesButtonPress (object self)
	{
		image imagea, imageb;
		if(!gettwoimages("Select two images",imagea, imageb)){
			exit(0);
		} else {
			number offsetX, offsetY, useValues;
			useValues = imageAlignmentDialog.alignTwoImages(imagea,imageb,offsetX, offsetY);
			number imageaWidth, imageaHeight, imagebWidth, imagebHeight;
			imagea.GetSize(imageaWidth, imageaHeight);
			imageb.GetSize(imagebWidth, imagebHeight);
			if(useValues == 1){
				result("\nThe offsets recorded were " + offsetX + ", " + offsetY);
				number minXShift = (offsetX > 0 ? 0 : offsetX)
				number maxXShift = (offsetX <= 0 ? 0 : offsetX)
				number minYShift = (offsetY > 0 ? 0 : offsetY)
				number maxYShift = (offsetY <= 0 ? 0 : offsetY)
				
				number widthDifference = imageaWidth - imagebWidth;
				number heightDifference = imageaHeight - imagebHeight;
				showImage(imageAlignmentDialog.createAlignedImage(imagea, minXShift, minYShift, maxXShift, maxYShift, offsetX, offsetY));
				
				showImage(imageAlignmentDialog.createAlignedImage(imageb, minXShift, minYShift, maxXShift + widthDifference, maxYShift + heightDifference, -offsetX, -offsetY));
			} else {
				result("\nOffsets were not recorded. Cancelled by User");
			}
		}
	}
	
	// Select a directory and align all the images inside it with the generic alignment functions
	void alignDirectoryButtonPress(object self)
	{
		TagGroup imageList = makeImageIDList( makeFileListGroup() );
		self.alignAllImages(imageList);
	}
	
	void mapDirectoryButtonPress(object self){
		TagGroup fileList = makeFileListGroup()
		string directory;
		fileList.TagGroupGetTagAsString( "Directory" , directory )
		TagGroup imageList = makeImageIDList( fileList );
		self.createMap(imageList);	
	}
	/* OPTION PANEL BUTTON FUNCTIONS */
	
	void debugToggleButtonPress(object self)
	{
		string state = (debugMode==0) ? "Deactivated" : "Activated" ;
		result("\nDebugMode Button pressed to make debug mode " + state);
		self.ToggleDebugMode();
	}
		
	void saveDirButtonPress(object self)
	{
		result("\nThe auto-save directory has been set to " + setAutoSaveDir())
	}

	void enterScaleButtonPress (object self) // Set the scale to something more awesome. Adjust for Binning.
	{
		result("\n\nThe scale factor is the number of (1/nm) per pixel on an UNBINNED image at these microscope settings." + \
				"\nEach camera length will have a different scale.");
		number useValues = scaleCalibrationDialog.inputNewCalibration();
		if(useValues){result("\n\nNew values loaded into memory. Please restart the Toolkit.");}
		else {result("\nCalibration input cancelled by user. No data has been changed.");}
	}
		
	void manualTiltCalibrationButtonPress (object self)
	{
		result("\n\nThis allows the entry of tilt calibration data without going through the full calibration process." + \
			"\nThe numbers required are the number of pixels that the diffraction pattern moves as the beam tilt is changed." + \
			"\nGenerally it should be easier to use the full calibration method.");
		number useValues = tiltCalibrationDialog.inputNewCalibration();
		if(useValues){result("\n\nNew values loaded into memory. Please restart the Toolkit.");}
		else {result("\nTilt Calibration input cancelled by user. No data has been changed.");}
	}
	
	void captureViewButtonPress (object self)
	{
		self.captureViewScreen();
	}
	
	// Saves the DataObject variables into a settings file. Any gaps will be filled from permanent memory.
	void saveToolKitVariablesToFilePress (object self)
	{
		string path;
		if(SaveAsDialog( "Save Settings As...", "Darkfield_Settings", path )){
			TagGroupSaveToFile( dataObject.createPersistent(1), path );
		}
	}
	
	// Loads variables from a settings file and into the dataObject (not to permanent memory)
	void loadToolkitVariablesFromFilePress (object self)
	{
		string path;
		if(OpenDialog( path )){
			TagGroup ToLoad = NewTagGroup();
			if(TagGroupLoadFromFile( ToLoad, path )){
				dataObject.loadPersistent(ToLoad); // Loads into the dataObject
			}		
		}	
	}
	
	// Stores the current dataObject variables in the permanent memory
	void saveVariablesToMemoryPress(object self){
		dataObject.updatePersistent(dataObject.createPersistent(1));
	}
	
}
