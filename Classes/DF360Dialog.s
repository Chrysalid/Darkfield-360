//****************************************************
// TOOLKIT FUNCTIONS & CLASS
//****************************************************

class CreateDF360DialogClass : uiframe
{
	number ToolkitID; // the ID of this object
	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image.
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
	
	// Check if the microscope is online or not. Do not allow control of the microscope if not.
	void updateEMstatus(object self)
	{
		EMOnline = EMIsReady();
		if(!EMOnline){
			AllowControl = 0;
		}
	}
	
	// External functions can call this to see if they can use the microscope.
	number getAllowControl(object self)
	{
		return AllowControl;
	}
	
	number getToolkitID(object self)
	{
		return ToolkitID;
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
		number keyToken = theDisplay.ImageDisplayAddKeyHandler(KeyListener, "HandleKey")
		if(debugmode==1){result("\nToolkit function: Attaching key handler object to display. KeyToken = " + keyToken);}
		KeyListener.startListening(keyToken);
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
		newRingRadiusText.componentsetdrawingmode(2)			;
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
		self.updateEMstatus();
		if(!EMOnline){
			result("\n-------------No Microscope Detected.-----------------")
			exit(0);
		}
		dataObject.setCentreTiltHere();
		if(debugMode){result("\nCapturing View Window...");}
		number cameraWidth, cameraHeight;
		sscgetsize(cameraWidth, cameraHeight); // Get camera resolution
		dataObject.setCameraHeight(cameraHeight);
		dataObject.setCameraWidth(cameraWidth);
		if(debugMode==1){result("\nCamera Resolution set to " + dataObject.getCameraWidth() + " x " + dataObject.getCameraHeight());}
		image ReferenceDP := sscUnprocessedAcquire(0.1,0,0,cameraWidth,cameraHeight);
		if(debugMode){result("\n\tReference exposure created");}
		dataObject.setReferenceDP(ReferenceDP);
		if(debugMode){result("\n\tReference exposure added to toolkit data store.");}
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo View Image detected in capture code.")
			exit(0);
		}
		AllowControl = 1;
		self.drawReticle(viewImage, 1);
		if(debugMode==1){result("\n\tReticle added to View window.");}
		
		imageDisplay frontdisp
		if(!returnViewImageDisplay(debugMode, frontdisp)){
			result("\nNo View Display found.")
			exit(0);	
		}
		
		self.attachKeyListener(frontdisp) // attach the keylistener to the live-view display and start it up.
		if(debugMode==1){result("\n\tKeyListener created and attached. Shortcut keys available.");}
		
		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		dataObject.setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 )
		dataObject.setOriginalScaleString(scaleString);
		if(debugMode==1){result("\n\tThe View window scale was initially set to " + dataObject.getOriginalScale() + " " + dataObject.getOriginalScaleString());}
		number viewWidth, viewHeight;
		getSize(viewImage, viewWidth, viewHeight);
		number binning = cameraWidth / viewWidth;
		dataObject.setBinningMultiplier(binning);
		if(debugMode==1){result("\n\tThe binning multiplier has been set to " + dataObject.getBinningMultiplier());}
		if(debugMode){result("\nView Window Capture complete");}
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
	}
	
	/* Function to centre beam */
	void beamCentre(object self){
		if(dataObject.ScriptObjectIsValid()){ // If dataobject is not there, do not let it set the beam tilt to 0,0!
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
			dataObject.pixelToTilt(xPixel, yPixel, xTiltTarget, yTiltTarget, 1, 0, 0);
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

		// BUTTON METHODS are to be defined in the class definition (work needed);

		// The first panel is for calibration
		taggroup panel1=dlgcreatepanel()
		panel1.dlgaddelement(dlgcreatelabel("Calibration")) // Label
		panel1.dlgaddelement(dlgcreatelabel("")) // Blank
		panel1.DLGAddElement(self.makeCameraDropDownMenu() )
		TagGroup tiltCalibrationAutoButton = DLGCreatePushButton("CALIBRATE TILT", "startCalibrationButtonPress")
		panel1.dlgaddelement(tiltCalibrationAutoButton)
		TagGroup DarkfieldImagingExposure = DLGCreateRealField( 30, 10, 3).dlgidentifier("DarkfieldExposureFieldInput")
		panel1.dlgaddelement(DarkfieldImagingExposure)
		TagGroup SetDFExposureButton = DLGCreatePushButton("Set DF Exposure", "onDFChange");
		panel1.dlgaddelement(SetDFExposureButton)
		TagGroup BrightfieldImagingExposure = DLGCreateRealField( 0.5, 10, 3).dlgidentifier("BrightfieldExposureFieldInput")
		panel1.dlgaddelement(BrightfieldImagingExposure)
		TagGroup SetBFExposureButton = DLGCreatePushButton("Set BF Exposure", "onBFChange");
		panel1.dlgaddelement(SetBFExposureButton)
		TagGroup DiffractionImagingExposure = DLGCreateRealField( 1, 10, 3).dlgidentifier("DiffractionExposureFieldInput")
		panel1.dlgaddelement(DiffractionImagingExposure)
		TagGroup SetDPExposureButton = DLGCreatePushButton("Set DP Exposure", "onDPChange");
		panel1.dlgaddelement(SetDPExposureButton)
		
			// Arrange the buttons and things
		panel1.dlgtablelayout(2,6,0);
		
		// The second panel is for Spot Storage.
		taggroup panel2=dlgcreatepanel()
		panel2.dlgaddelement(dlgcreatelabel("Target Diffraction Spots")) // Label
		/*TagGroup storeDPSelect = DLGCreateCheckBox( "Record DP Images", 1 );
		panel2.dlgaddelement(storeDPSelect) */
		TagGroup storePointButton = DLGCreatePushButton("Single Diffraction Spot", "StoreDPButtonPress")
		panel2.dlgaddelement(storePointButton)
		TagGroup DarkFieldROIButton = DLGCreatePushButton("Target All ROI", "storeROIButtonPress")
		panel2.dlgaddelement(DarkFieldROIButton)
		TagGroup storeRingButton = DLGCreatePushButton("Target Ring", "storeRingButtonPress")
		panel2.dlgaddelement(storeRingButton)
		TagGroup resetTiltStoreButton = DLGCreatePushButton("Delete Stored Targets", "deleteStoredTiltsButtonPress")
		panel2.dlgaddelement(resetTiltStoreButton)
		
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
		
		self.updateEMstatus();
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
			exit(0);
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
	}
	
	/* Function to update a text component with the radius of a diffraction ring. */
	void updateRadius (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			exit(0);
		}
		if(debugMode==true){result("\n\tUpdating Radius...");}
		// void ComponentGetBoundingRect( Component comp, NumberVariable t, NumberVariable l, NumberVariable b, NumberVariable r )
		number measuredRadiusPX, measuredRadiusNM, top, bottom, left, right, scaleX, scaleY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		if(debugMode==true){result("\nmeasuredRadiusPX = " + measuredRadiusPX);}
		scaleX = dataObject.returnViewScale();
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
			exit(0);
		}
		number measuredRadiusPX, desiredRadiusPX, top, bottom, left, right, scaleX, scaleY, centreX, centreY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		centreX = right - measuredRadiusPX;
		centreY = bottom - measuredRadiusPX;
		number binningMultiplier = dataObject.getBinningMultiplier();
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = dataObject.returnViewScale();
		desiredRadiusPX = desiredRadiusNM / scaleX;
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		if(debugMode==true){result("\ndesiredRadiusNM: " + desiredRadiusNM + " (1/nm)");}
		
		top = centreY + desiredRadiusPX;
		bottom = centreY - desiredRadiusPX;
		right = centreX + desiredRadiusPX;
		left = centreX - desiredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
	}

	/* Function to put the marker ring back on the central spot and make it circular. */
	void recenterMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			exit(0);
		}
		number top, bottom, left, right, centreX, centreY;
		number binningMultiplier = dataObject.getBinningMultiplier();
		number cameraHeight = dataObject.getCameraHeight();
		number cameraWidth = dataObject.getCameraWidth();
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
	}
	

	//****************************************************
	// IMAGING PROCESSES
	//****************************************************
	 
	/* Function to store tilt values and record the spot for later recall
		shadowDistance = distance from the central point (in 1/nm) to perform shadowing. 0 = no shadowing.
		storeTiltOnly (0 or 1) if 1, the function will store the tilt values and then stop without any imaging.
	*/
	void storeTiltCoord (object self, number shadowDistance, number storeTiltOnly) {
		// Check to see if the EM is in diffraction mode.
		if ( (EMGetImagingOpticsMode() == "SAMAG") || (EMGetImagingOpticsMode() == "IMAGING")  || (EMGetImagingOpticsMode() == "MAG1") || (EMGetImagingOpticsMode() == "MAG2")) {
			if (!ContinueCancelDialog( "Switch to diffraction mode before continuing." )){
				Throw( "User aborted process." );
			}
		}			
		Number xTilt, yTilt;
		EMGetBeamTilt(xTilt, yTilt); //Get the current tilt values.
		
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();
		number tracker = dataObject.getTracker();
		number DPExposure = dataObject.getDPExposure();
		image dataArray := dataObject.getDataArray();
		image ReferenceDP = dataObject.getReferenceDP();
		
		if(debugMode==true)
		{
			result("\nStoring the tilt coordinate. Shadowing distance is set to " + shadowDistance + "(1/nm)");
			result("\nstoreTiltOnly = " + storeTiltOnly);
			positionDebugWindow(debugMode);
		}
		
		setpixel(dataArray, tracker, 0, tracker); // spotID
		setpixel(dataArray, tracker, 1, xTilt); // xTilt value
		setpixel(dataArray, tracker, 2, yTilt); // yTilt value
		
		number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
		xTiltRelative = xTilt - xTiltCenter;
		yTiltRelative = yTilt - yTiltCenter;
		setpixel(dataArray, tracker, 3, xTiltRelative);
		setpixel(dataArray, tracker, 4, yTiltRelative);
		
		TagGroup spot = ImageSetTools.addSpotToCurrentImageSet(); // The 1-3 images here will be placed inside the spot group
		
		TagGroup image1Data = imageSetTools.createNewImageForImageSet();
		image1Data.TagGroupSetTagAsString("ImageType", "DP");
		image1Data.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
		image1Data.TagGroupSetTagAsNumber("xTiltRelative", xTiltRelative);
		image1Data.TagGroupSetTagAsNumber("yTiltRelative", yTiltRelative);
		image1Data.TagGroupSetTagAsNumber("xTiltValue", xTilt);
		image1Data.TagGroupSetTagAsNumber("yTiltValue", yTilt);
		image1Data.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		image1Data.TagGroupSetTagAsNumber("ShadowValue", 1);

		imageSetTools.addImageDataToCurrentSpot(image1Data, "Middle"); // this is the middle image and is added to that tag in the spot taggroup
		
		/* old file name generation system is old. adapt it to use the tag lists */
		string fileName, spotID, filePath, timeString;
		if(shadowDistance==0){ // SpotID just increases by one each time
			spotID = PadWithZeroes(tracker,4);
		} else {
			number SpotIDNumber;
			SpotIDNumber = ceil(tracker / 3)
			spotID = PadWithZeroes(SpotIDNumber,4);
		}
		timeString = constructTimeStamp();
		
		if(storeTiltOnly == false) // The image creation + storage parts can be ignored if parameter is set to true.
		{
			// Take new exposure for comparison of pixel movement.
			number cameraWidth, cameraHeight;
			cameraWidth = dataObject.getCameraWidth();
			cameraHeight = dataObject.getCameraHeight();
			
			// Wait for the image to stabilize after moving.
			number OSTickCount = GetOSTickCount();
			number OSTicksPerSecond = GetOSTicksPerSecond();
			number targetTick = OSTickCount + (OSTicksPerSecond);
			while( targetTick > GetOSTickCount()){	// Do nothing
			}
			image newDPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);

			// image1Data.TagGroupSetTagAsNumber("UniqueImageID", ); Not sure how unique image ID works.
			
			// Compare to reference image
			//findImageShift(image refIm, image newIm, number &XShift, number &YShift)
			number XShift, YShift;
			findImageShift(referenceDP, newDPImage, XShift, YShift, debugMode);
			setpixel(dataArray, tracker, 5, XShift);
			setpixel(dataArray, tracker, 6, YShift);
			// Convert the distance travelled to 1/nm
			number pixelDistance = distance(XShift, YShift);
			number scaleX = dataObject.getRefScale();
			number realDistance = pixelDistance * scaleX;
			image1Data.TagGroupSetTagAsNumber("DSpacingAng", convertInverseNMToAngstrom(realDistance));
			
			if(debugMode==true){Result( "\nPattern Distance Shift (1/nm): " + realDistance);}
			// Make a name for the file based on spotID.
			// An image is saved each time a coordinate is taken for later reference.
			// The spotID will link across scripts and references.
			// The format DP_SpotID_NNNN_timestamp is to be used to make auto-save directories read nicely and not write over previous images accidentally.

			fileName = "DP_" + spotID + "_" + timeString;
			
			// Add the real distance as text in the image
			// Add the pixel shift as text in the image
			string textString = "D-Spacing: " + realDistance + " (1/nm)" + "\nPixel Shift: (" + XShift + ", " + YShift + ")";
			// Add text annotations and set their colour, display mode and font
			component textannot=newtextannotation(10,10, textString, 64);
			textannot.componentsetfillmode(2);
			textannot.componentsetdrawingmode(2);
			textannot.componentsetforegroundcolor(1,0,0);
			textannot.componentsetbackgroundcolor(0,0,0);
			textannot.componentsetfontfacename("Microsoft Sans Serif");
			
			showImage(newDPImage) // Images needs to be shown to give it an ImageDisplay, which is needed for attaching components.
			ImageDisplay imgDisplay = newDPImage.ImageGetImageDisplay(0)
			imgDisplay.componentaddchildatend(textannot);
			ImageDocument thisImageDocument = ImageGetOrCreateImageDocument( newDPImage );
			// Save or show the copied image.
			if(debugMode==false)
				{
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileName);
					image1Data.TagGroupSetTagAsString("FileName", fileName);
					image1Data.TagGroupSetTagAsNumber("SavedAsFile", 1);
					self.drawReticle(newDPImage, 0);
					self.cleanReticle(newDPImage);
					SaveAsGatan( newDPImage, filePath );
					ImageDocumentClean(thisImageDocument); // So the window can be closed without asking to be saved
					closeImage(newDPImage);
					positionDebugWindow(debugMode);
					result("\nStored Tilt " + fileName);
				} 
				else
				{
					image1Data.TagGroupSetTagAsNumber("SavedAsFile", 0);
					ImageDocumentClean(thisImageDocument); // So the window can be closed without asking to be saved
					ImageDocumentShow(thisImageDocument); // Display the image document.
					result("\nStore Tilt Function run for " + fileName + ". Tilt value stored (" + xTilt + ", " + yTilt + ")");
					self.drawReticle(newDPImage, 0);
					self.cleanReticle(newDPImage); // Makes it editable.
					positionDebugWindow(debugMode); // Return the View window to the front
				}
		}

		if(shadowDistance!=0)
		{
			//void tiltToPixel(dataObject, number xTilt, number yTilt, number &xPixelShift, number &yPixelShift, number isViewWindow)
			number xTiltShift = xTilt - dataObject.getCentreXTilt();
			number yTiltShift = yTilt - dataObject.getCentreYTilt();
			number xPixelShift, yPixelShift, NMDistance;
			tiltToPixel(dataObject, xTiltShift, yTiltShift, xPixelShift, yPixelShift, 0);
			if(debugMode==true){result("\nBeginning Shadowing.");}
			if(debugMode==true){result("\n\tTilt -> Pixel Shift = (" + xTiltShift + ", " + yTiltShift\
					+ ") -> (" + xPixelShift + ", " + yPixelShift + ")px");}
			NMDistance = distance(yPixelShift, xPixelShift) * dataObject.getRefScale();
			number shadowMultiplier = shadowDistance / NMDistance;
			if(debugMode==true){result("\n\tNMDistance = " + NMDistance);}
			if(debugMode==true){result("\n\tShadowMultiplier = " + shadowMultiplier);}
			
			// Need centre -> Tilt, not just tilt value.
			number shadowXshift = xTiltShift * shadowMultiplier;
			number shadowYshift = yTiltShift * shadowMultiplier;
			if(debugMode==true){result("\n\tShadowXShift (tilt) = " + shadowXshift);}
			if(debugMode==true){result("\n\tShadowYShift (tilt) = " + shadowYshift);}
			
			string fileNameHigher, fileNameLower
			fileNameHigher = "DP_" + spotID + "_" + timeString + "_HIGHER";
			fileNameLower = "DP_" + spotID + "_" + timeString + "_LOWER";
			
			EMChangeTilt(shadowXshift, shadowYshift);
			if(debugMode==1){result("\n\tBeam tilt moved to 1st shadow point.");}
			// Store new beam tilt.
			EMGetBeamTilt(xTilt, yTilt)
			tracker = tracker + 1
			xTiltRelative = xTilt - xTiltCenter;
			yTiltRelative = yTilt - yTiltCenter;
			setpixel(dataArray, tracker, 0, tracker); // spotID
			setpixel(dataArray, tracker, 1, xTilt); // xTilt value
			setpixel(dataArray, tracker, 2, yTilt); // yTilt value
			setpixel(dataArray, tracker, 3, xTiltRelative); // relative xTilt value
			setpixel(dataArray, tracker, 4, yTiltRelative); // relative yTilt value
			
			TagGroup image2Data = imageSetTools.createNewImageForImageSet();
			image2Data.TagGroupSetTagAsString("ImageType", "DP");
			image2Data.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
			image2Data.TagGroupSetTagAsNumber("xTiltRelative", xTiltRelative);
			image2Data.TagGroupSetTagAsNumber("yTiltRelative", yTiltRelative);
			image2Data.TagGroupSetTagAsNumber("xTiltValue", xTilt);
			image2Data.TagGroupSetTagAsNumber("yTiltValue", yTilt);
			image2Data.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
			image2Data.TagGroupSetTagAsNumber("ShadowValue", 2);
			imageSetTools.addImageDataToCurrentSpot(image2Data, "Higher");
			
			if(debugMode==true){result("\n\tStored as Tracker value " + tracker);}
			
			number OSTickCount = GetOSTickCount();
			number OSTicksPerSecond = GetOSTicksPerSecond();
			number targetTick = OSTickCount + (OSTicksPerSecond * DPExposure);
			if(debugMode==true){result("\n\tTickCount = " + OSTickCount + "  TicksperSec = " + OSTicksPerSecond);}
			ImageDocument higherDPView, lowerDPView
			if(storeTiltOnly != true)
			{
				// Wait for one second to let the ccd be exposed
				while( targetTick > GetOSTickCount()){	// Do nothing
				}
				// Update the view image display
				image viewImage;
				if(!returnViewImage(debugMode, viewImage)){
					result("View Image not found. This error should never happen.")
					exit(0);
				}
				UpdateImage( viewImage );
				ImageDocument higherDPView, viewImageDocument;
				if(!returnViewImageDocument(debugMode, viewImageDocument)){
					result("\nImage Document not detected. This error should not be possible.");
					exit(0);
				}
				higherDPView = ImageDocumentClone( ViewImageDocument, 1 );
				ImageDocumentSetName( higherDPView, fileNameHigher ); // Label the new image with the point name.
				ImageDocumentShow(higherDPView)
				higherDPView.ImageDocumentClean(); // So it can be closed easily
				if(debugMode != true){
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileNameHigher);
					ImageDocumentSaveToFile( higherDPView, "Gatan Format", filePath);
					higherDPView.imageDocumentClose(0);
					image2Data.TagGroupSetTagAsString("FileName", fileNameHigher);
					image2Data.TagGroupSetTagAsNumber("SavedAsFile", 1);
				} else {
					image2Data.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
			}
			
			EMChangeTilt((-2 * shadowXshift), (-2 * shadowYshift));
			if(debugMode==1){result("\n\tBeam tilt moved to 2nd shadow point.");}
			// Store new beam tilt
			EMGetBeamTilt(xTilt, yTilt)
			tracker = tracker + 1
			xTiltRelative = xTilt - xTiltCenter;
			yTiltRelative = yTilt - yTiltCenter;
			setpixel(dataArray, tracker, 0, tracker); // spotID
			setpixel(dataArray, tracker, 1, xTilt); // xTilt value
			setpixel(dataArray, tracker, 2, yTilt); // yTilt value
			setpixel(dataArray, tracker, 3, xTiltRelative); // relative xTilt value
			setpixel(dataArray, tracker, 4, yTiltRelative); // relative yTilt value
			
			TagGroup image3Data = imageSetTools.createNewImageForImageSet();
			image3Data.TagGroupSetTagAsString("ImageType", "DP");
			image3Data.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
			image3Data.TagGroupSetTagAsNumber("xTiltRelative", xTiltRelative);
			image3Data.TagGroupSetTagAsNumber("yTiltRelative", yTiltRelative);
			image3Data.TagGroupSetTagAsNumber("xTiltValue", xTilt);
			image3Data.TagGroupSetTagAsNumber("yTiltValue", yTilt);
			image3Data.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
			image3Data.TagGroupSetTagAsNumber("ShadowValue", 3);
			imageSetTools.addImageDataToCurrentSpot(image3Data, "Lower");
			
			if(debugMode==1){result("\n\tStored as Tracker value " + tracker);}
			if(storeTiltOnly != 1)
			{
				OSTickCount = GetOSTickCount();
				number targetTick = OSTickCount + (OSTicksPerSecond * DPExposure);
				while( targetTick > GetOSTickCount())	{ // Do nothing
				}
				image viewImage;
				if(!returnViewImage(debugMode, viewImage)){
					result("View Image not found. This error should never happen.")
					exit(0);
				}
				UpdateImage( ViewImage );
				ImageDocument lowerDPView, viewImageDocument;
				if(!returnViewImageDocument(debugMode, viewImageDocument)){
					result("\nImage Document not detected. This error should not be possible.");
					exit(0);
				}
				lowerDPView = ImageDocumentClone( ViewImageDocument, 1 );
				ImageDocumentSetName( lowerDPView, fileNameLower ); // Label the new image with the point name.
				ImageDocumentShow(lowerDPView)
				lowerDPView.ImageDocumentClean(); // So it can be closed easily
				if(debugMode==0)
				{
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileNameLower);
					ImageDocumentSaveToFile( lowerDPView, "Gatan Format", filePath );
					lowerDPView.imageDocumentClose(0);
					image3Data.TagGroupSetTagAsString("FileName", fileNameLower);
					image3Data.TagGroupSetTagAsNumber("SavedAsFile", 1);
				} else {
					image3Data.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
			}
			dataObject.setTracker(tracker + 1);
		} else {
			dataObject.setTracker(tracker + 1);
		}
	}

	/* Will take a number of images of the DP moved to values in the list of stored points.
		This is to test the tilt calibration and alignment.
	 */
	void takeTestDPImages (object self, number tracker, image dataArray, number DPExposure, number cameraWidth, number cameraHeight, number xTiltCenter, number yTiltCenter){
		number alignmentDPToTake = 6;
		getnumber("How many points should be checked?", alignmentDPToTake, alignmentDPToTake);
		if(alignmentDPToTake > tracker){
			alignmentDPToTake = tracker;
		}
		number i;
		for(i=0; i < alignmentDPToTake; i++){
			number j = i * round(tracker / alignmentDPToTake);
			j = (j==0 ? 1 : j);
			// load the tilt.
			number xTiltTarget = xTiltCenter + getpixel(dataArray, j, 3);
			number yTiltTarget = yTiltCenter + getpixel(dataArray, j, 4);
			moveBeamTilt(xTiltTarget,yTiltTarget);
			
			if ( (EMGetImagingOpticsMode() == "SAMAG") || (EMGetImagingOpticsMode() == "IMAGING") || (EMGetImagingOpticsMode() == "MAG1") || (EMGetImagingOpticsMode() == "MAG2")) {
				if (!ContinueCancelDialog( "Switch to diffraction mode before continuing." )){
					Throw( "User aborted process." );
				}
			}	
			image DPImage;
			DPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
			DPImage.ImageSetName("Alignment Test " + i);
			showImage(DPImage);
		}
		return;
	}

	/* Function to take a DF image by reading from the Data Array */
	image takeDFImage (object self, number tracker, image dataArray, number xTiltCenter, number yTiltCenter,\
			number DFExposure, number cameraWidth, number cameraHeight, number im ){

		number xTiltTarget, yTiltTarget;
		
		// Read xTilt and yTilt from array
		xTiltTarget = xTiltCenter + getpixel(dataArray, im, 3);
		yTiltTarget = yTiltCenter + getpixel(dataArray, im, 4);
		
		// Move the beam tilt to this value.
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to imaging manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". Add your own modes in or replace these ones if your scope is different.
		if (! ( (opticsMode == "SAMAG") || (opticsMode == "IMAGING")  || (EMGetImagingOpticsMode() == "MAG1") || (EMGetImagingOpticsMode() == "MAG2")) ) {
			if(debugMode==true){
				result("\nTakeDFImage() called when EM not in imaging mode. Is in mode: " + EMGetImagingOpticsMode());
			}
			if (!ContinueCancelDialog( "Switch to imaging mode before continuing." )){
				Throw( "User aborted process." );
			}
		}
		
		// Take the Dark field Image
		image DFImage;
		DFImage := sscUnprocessedAcquire(DFExposure,0,0,cameraWidth,cameraHeight);
		return DFImage;
	}


	/* Function to generate the file name for a darkfield image and update the DFList taggroup*/
	string generateDFFileName (object self, number im, number imageID, image dataArray, TagGroup DFList, number shadowing, number debugMode) {
		number spotID = getpixel(dataArray, im, 0);
		if(debugMode){result("\nGenerating File name " + im);}
		string longSpotID;
		string filename;
		if(im == 0){ // The first 0000 image is always the bright field image
			fileName = "BrightField_" + constructTimeStamp();
			DFList.TagGroupSetTagAsNumber( "BaseImage" , imageID );
			return filename;
		}
		if(shadowing == 0){ // Normal way of naming files. Sequential.
			if(debugMode){result("\n\tShadowing is OFF");}
			longSpotID = PadWithZeroes(SpotID, 4);
			fileName = "DarkField_" + longSpotID + "_" + constructTimeStamp();
			// Update the DFList
			string tagPath = "Spot" + longSpotID
			DFList.TagGroupSetTagAsNumber( (tagPath + ":MIDDLE") , imageID )
			return filename;
		}
		else
		{
			 // Shadowing has been selected, so the files will be named after their 'group' and if they are higher or lower.
			if(debugMode==1){result("\nShadowing is ON");}
			number pointNumber, rem;
			pointNumber = floor((im-1) / 3) + 1;
			if(debugMode==1){result("\nPoint Number is " + pointNumber);}
			longSpotID = PadWithZeroes(pointNumber, 4);
			if(debugMode==1){result("\nlongSpotID with 0s: " + longSpotID);}
			
			string tagPath = "Spot" + longSpotID;
			if(!TagGroupDoesTagExist( DFList, tagPath )){
				TagGroup SpotGroup = NewTagGroup(); // the tagGroup that will hold this data and then be attached to the DFList.
				TagGroupCreateNewLabeledTag( SpotGroup, "LOWER" ); // Creates the tag for LOWER data
				TagGroupCreateNewLabeledTag( SpotGroup, "HIGHER" ); // Creates the tag for HIGHER data
				TagGroupCreateNewLabeledTag( SpotGroup, "MIDDLE" ); // Creates the tag for MIDDLE data
				TagGroupAddLabeledTagGroup( DFList, tagPath, SpotGroup );
			}
			
			rem = remainder(im, 3); // 1 for central peak, -1 for higher, 0 for low
			if(debugMode==1){result("\nim is " + im);result("\nRemainder is " + rem);}
			if(rem==(-1)){
				longSpotID = longSpotID + "_HIGHER";
				DFList.TagGroupSetTagAsNumber( (tagPath + ":HIGHER") , imageID ); // sets the ImageID within the HIGHER/LOWER tag
			}
			else if(rem==0)
			{
				longSpotID = longSpotID + "_LOWER";
				DFList.TagGroupSetTagAsNumber( (tagPath + ":LOWER") , imageID ); // sets the ImageID within the HIGHER/LOWER tag
			} else 
			{
				DFList.TagGroupSetTagAsNumber( (tagPath + ":MIDDLE") , imageID ); // sets the ImageID within the MIDDLE tag
			}
			fileName = "DarkField_" + longSpotID + "_" + constructTimeStamp();
			return filename;
		}
		result("\n\ngenerateDFFileName has developed a fault")
		filename = "file " + im;
		return filename;	
	}

	/* Function will use the stored Tilt values to take darkfield images. 1st Image (0000) will be Bright Field of site.
		shadowing = 0 / 1 for the shadowing mode.
		integration = 0 / 1 for if the images should be integrated together
		integrationDistance = number of DP to be integrated together before image is produced
	*/
	void darkFieldImage (object self, number shadowing, number integration, number integrationDistance){
		number tracker = dataObject.getTracker();
		number DPExposure = dataObject.getDPExposure();
		number DFExposure = dataObject.getDFExposure();
		number BFExposure = dataObject.getBFExposure();
		image dataArray = dataObject.getDataArray();
		image ReferenceDP = dataObject.getReferenceDP();
		image ROIList = dataObject.getROIList();
		image startBFImage;
		image integratedImage;
		image sumImage;

		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();
		
		if(integration){
			if(debugMode==true){result("\nCreating Integrated Images to populate...");}
			integratedImage = RealImage( "Integrated Image 01", 4, cameraWidth, cameraHeight );
			integratedImage = integratedImage * 0;
			sumImage = RealImage( "Sum of all Integrals", 4, cameraWidth, cameraHeight );
			sumImage = sumImage * 0;
		}
		
		if(debugMode==true){result("\nWorking on TagGroup...");}
		TagGroup DFList = createDFList(tracker, shadowing, integration, integrationDistance);
		/* Tag group format:
		DFList	:	UseImageID
					BaseImage
					Directory
					Spot#### : 	HIGHER
								MIDDLE
								LOWER
		*/
		
		// Set the tag values
		string Directory = GetApplicationDirectory("auto_save", 0);
		DFList.TagGroupSetTagAsString( "Directory" , Directory ); // sets the directory	
		if(debugMode==1){result("\n\tSave directory set.");}
		DFList.TagGroupSetTagAsNumber( "UseImageID" , 1 ); // Is 1 since the images are being created now.
		if(debugMode==1){result("\n\tUseImageID set to 1.");}
		
		Result("\n------------- Starting Dark Field Imaging Process ---------------\n");
		result("\n" + tracker + " images to create, taking " + (DFExposure * tracker / 60) + " minutes.");
		if(debugMode==1){dataObject.printSpotIDArray();}
		
		if (!ContinueCancelDialog( "Insert the Objective Aperture and center it. Switch to Imaging Mode and check the Brightfield image before continuing." )){
			throw("Aborted by User. No data changed.")
		}
		
		// For each targetArrayImage point move the beam there and take an image.
		number im, spotID, imageID;
		for(im=0; im<tracker ;im++){
			// Take the image
			image DFImage := self.takeDFImage ( tracker, dataArray, xTiltCenter, yTiltCenter, DFExposure, cameraWidth, cameraHeight, im );
			if(im==0){
				startBFImage = DFImage;
			}
			// Get image data
			imageID = DFImage.ImageGetID();
			spotID = getpixel(dataArray, im, 0);
			
			// Generate the filename to save the image with.
			string fileName, filePath, longSpotID;
			fileName = self.generateDFFileName(im, imageID, dataArray, DFList, shadowing, debugMode );
			
			// If in Integrated image mode add it to the current integration image and display any completed integrated images.
			if(integration==true){
				integratedImage = integratedImage + DFImage;
				result("\nIntegrating Exposure " + (im + 1) +" of " + tracker);
				if((remainder(im, integrationDistance)==0) || (im == 0)){ // save this integrated image and start a new one.
					sumImage = sumImage + integratedImage;
					image newImage = integratedImage.ImageClone();
					integratedImage.ImageSetName( "Integrated Image " + im );
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					fileName = "Integrated Image " + im;
					filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
					SaveAsGatan(integratedImage, filePath);
					result("\nIntegrated " + integrationDistance + " exposures into Integrated Image " + im);
					integratedImage = integratedImage * 0; // Set old image to 0 for next integration sequence.
					if(debugMode==true){OpenImage(filePath + ".dm3");} // Display the image as well if in debug mode.
				}
			}
			else { // Save the image as a Gatan file or display it if in debug mode.
				if(debugMode==true){
					ImageSetName(DFImage, fileName);
					ShowImage(DFImage);
					ImageDocumentClean(ImageGetOrCreateImageDocument( DFImage )); // So it can be closed easily
					result("\nSingle Exposure " + (im + 1) +" of " + tracker + " completed and displayed as image " + fileName);
				} else {
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
					SaveAsGatan( DFImage, filePath );
					closeImage( DFImage );
					result("\nSingle Exposure " + (im + 1) +" of " + tracker + " saved as: " + filePath);
				}
			}
			updateAllImages();
		}
		self.beamCentre();
		
		// A bright field image is taken at the end to compare to the start. This can track drift.
		image endBFImage;
		endBFImage := sscUnprocessedAcquire(BFExposure,0,0,cameraWidth,cameraHeight);
		string fileName, filePath, longSpotID;
		longSpotID = "";
		fileName = "End_BrightField_" + constructTimeStamp();
		if(debugMode==true)
		{
			ImageSetName(endBFImage, fileName);
			ShowImage(endBFImage);
			ImageDocumentClean(ImageGetOrCreateImageDocument( endBFImage )); // So it can be closed easily
			result("\nEnding Bright Field exposure displayed as " + filename);
		}
		else
		{
			string fileDirectory = GetApplicationDirectory("auto_save", 0);
			filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
			SaveAsGatan( endBFImage, filePath );
			closeImage( endBFImage );
			result("\nEnding Bright Field exposure saved as: " + filePath);
		}
		// Find the image drift.
		number xShiftBF, yShiftBF;
		findImageShift(startBFImage, endBFImage, xShiftBF, yShiftBF, debugMode);
		result("\nDuring the exposures the image drifted by (" + xShiftBF + ", " + yShiftBF + ") pixels")
		if(integration==true){ //show Sum.
			showImage(sumImage);
			copyTags(sumImage, endBFImage);
			copyScale(sumImage, endBFImage);
		}
		positionDebugWindow(debugMode); //Return View Window to the front if it is not all ready
		Result("\n------------- Ending Dark Field Imaging Process ---------------\n");
		dataObject.setDFList(DFList);
		if(debugMode==true){dataObject.showDFList();} // Used to check on the Tag group when debugging
	}

	/* 	Function that performs the Calibration process
			Take image of the DP for reference when storing.
			Store the central beam as the first data point.
			Calibrate the Tilt Vectors (pixels per tilt unit)
	 */
	 void startDPStoring(object self){
		// Load data from dataObject
		// Not Reference DP. That is set later.
		number tracker = dataObject.getTracker();
		number DPExposure = dataObject.getDPExposure();
		image dataArray := dataObject.getDataArray();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		if(debugMode==true){result("\nstartDPStoring()");}
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo view Image detected. This error should not be possible.");
		}	
		if(tracker!=0){ //("There is Calibration data all ready stored.")
			if(!ContinueCancelDialog( "There is all ready calibration data stores. Would you like to overwrite it?" )){
				return;
			}
		}
		// Set central Tilt values
		dataObject.setCentreTiltHere();
		
		// Take the reference Diffraction Pattern for future use in calculations.
		image ReferenceDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);

		number refScaleX, refScaleY;
		refScaleX = dataObject.getRefScale();
		if(debugMode==true){result("\nrefScaleX: " + refScaleX);}
		if(refScaleX == 0){
			throw("Please set Camera Length");
		}
		ImageSetDimensionScale(ReferenceDP, 0, refScaleX)
		ImageSetDimensionUnitString(ReferenceDP, 0, "1/nm" )
		ImageSetDimensionScale(ReferenceDP, 1, refScaleX)
		ImageSetDimensionUnitString(ReferenceDP, 1, "1/nm" )	
		
		// Calculate the binning of the view screen
		number viewSizeX, viewSizeY, refSizeX, refSizeY;
		getSize(viewImage, viewSizeX, viewSizeY )
		getsize(ReferenceDP, refSizeX, refSizeY )

		number binning = refSizeX / viewSizeX;
		dataObject.setBinningMultiplier(binning);
		if(debugMode==true){result("\n\tBinning set to " + binning);}
		referenceDP.SetName("Reference Diffraction Pattern");
		
		// Load the reference image into the dataObject
		if(debugMode==true){result("\nNow Setting ReferenceDP in the DataObject...");}
		dataObject.setReferenceDP(ReferenceDP);
		
		number oldTracker = dataObject.getTracker();
		dataObject.setTracker(0);
		
		// Store the tilt etc. as the 0 value in the array image.
		if(debugMode==1){result("\nNow Storing Centre Tilt Coords... ");}
		// self.storeTiltCoord(0, 0); // This is the old code, but for calibration we need to do things differently and fill out the correct tag groups.
		number xTilt, yTilt;
		EMGetBeamTilt(xTilt, yTilt);
		number xTiltRelative = 0;
		number yTiltRelative = 0;
		setpixel(dataArray, 0, 0, 0);
		setpixel(dataArray, 0, 1, xTilt); // xTilt value
		setpixel(dataArray, 0, 2, yTilt); // yTilt value
		setpixel(dataArray, 0, 3, xTiltRelative); // relative xTilt value
		setpixel(dataArray, 0, 4, yTiltRelative); // relative yTilt value
		dataObject.setTracker( 1 );
		if(debugMode==1){result(" Done");}
		
		if(oldTracker != 0){ // reset tracker so stored spots are accessible
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
		findImageShift(ReferenceDP, xTiltDP, xTiltPixelShiftX, xTiltPixelShiftY, debugMode);
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
		findImageShift(ReferenceDP, yTiltDP, yTiltPixelShiftX, yTiltPixelShiftY, debugMode);
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
		result("\nCalibration Complete.");
		printCommands();
	}

	//****************************************************
	// ENTIRE RING IMAGING FUNCTIONS
	//****************************************************

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

	 /* Function to return the radius of the marker ring in pixels for unbinned images */
	 number markerRingRadius(object self)
	 {
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number binning = dataObject.getBinningMultiplier();
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
		returns the number of points used, since this is useful to other functions.
	*/
	void loadRingPoints (object self, number radiusPX, number shadowDistanceNM, number &numberOfPoints )
	{
		// Load data from dataObject
		if(debugMode==true){result("\nStarting to load Ring Data Points.");}
		number DPExposure = dataObject.getDPExposure();
		number DFExposure = dataObject.getDFExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number binning = dataObject.getBinningMultiplier();
		number beamCentreX = dataObject.getCentreXTilt();
		number beamCentreY = dataObject.getCentreYTilt();
		image dataArray := dataObject.getDataArray();
		
		TagGroup newImageSet = imageSetTools.createNewImageSet();
		newImageSet.TagGroupSetTagAsNumber("RingMode", 1);
		newImageSet.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
		newImageSet.TagGroupSetTagAsNumber("DSpacingAng", dataObject.convertPixelDistanceToNM(radiusPX));
		imageSetTools.addImageSet(newImageSet);
		
		
		if(debugMode==true){result("\n\tData Object loaded into variables.");}

		// If not calibrated stop here!
		if((xTiltVectorX==0) && (xTiltVectorY==0) && (yTiltVectorX==0) && (yTiltVectorY==0)){
			throw("Please perform the tilt calibration first.")
		}
		
		numberOfPoints = 360; // Not using shadowing yet. (Spend 10s at each 1° angle = 1hr.)
								// Will be changed below, but default option is 360.

		if(!getNumber("How many measurements should be taken?", numberOfPoints, numberOfPoints)){
			throw("Cancelled by User");
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
		if(debugMode==true){result("\nTiltVectorX Calculation values:");}
		if(debugMode==true){result("\n\tRadiusPX: " + radiusPX);}
		if(debugMode==true){result("\n\tRadiusPX ^ 2: " + radiusPX**2);}
		if(debugMode==true){result("\n\txTiltVectorX: " + xTiltVectorX);}
		if(debugMode==true){result("\n\txTiltVectorX ^ 2: " + xTiltVectorX**2);}
		if(debugMode==true){result("\n\ttan(alpha): " + tan(alpha));}
		if(debugMode==true){result("\n\ttan(alpha) ^ 2: " + tan(alpha)**2);}
		if(debugMode==true){result("\n\tTiltVectorX ^ 2: " + radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ));}
		tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
		if(debugMode==true){
			result("\nAlpha for tiltVectorX: " + alpha );
			result("\ntan (alpha): " + tan(alpha) );
			result("\ntiltVectorX = " + tiltVectorX);
		}
		number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.
		
		number estimatedTime = numberOfPoints * DFExposure / 60;
		if (!ContinueCancelDialog( "Complete darkfield imaging of this ring will take approximately " + estimatedTime + " minutes. Would you like to target these points?" )){
			throw("Cancelled by User");
		}
		result("\nGenerating Tilt coordinates...");

		number i, angleToMove, tiltX, tiltY;
		number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
		for(i=0; i < numberOfPoints; i++){
			number tracker = dataObject.getTracker()
			angleToMove = i * angleStep; // This is in Degrees.
			angleToMove = angleToMove * pi() / 180; // converted to radians
			
			// work out change in tilt to get there.
			tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
			tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
			if(debugMode==true){result("\n\ti: " + i);}
			if(debugMode==true){result("\n\tAngleToMove: " + angleToMove);}
			if(debugMode==true){result("\n\tsin(angle): " + sin(angleToMove));}
			if(debugMode==true){result("\n\tcos(angle): " + cos(angleToMove));}
			if(debugMode==true){result("\n\tAdditional TiltX: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\tAdditional TiltY: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\t---------");}
			
			setpixel(dataArray, tracker, 0, tracker); // spotID
			setpixel(dataArray, tracker, 1, tiltX); // xTilt value
			setpixel(dataArray, tracker, 2, tiltY); // yTilt value
		
			number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
			xTiltRelative = tiltX - beamCentreX
			yTiltRelative = tiltY - beamCentreY;
			setpixel(dataArray, tracker, 3, xTiltRelative);
			setpixel(dataArray, tracker, 4, yTiltRelative);

			tracker += 1;
			dataObject.setTracker(tracker);
			if(remainder(i,60)==0){ //This part just puts a '.' every 60 calculations as a crude progress bar.
				result("\n");
			} else {
				result(".");
			}
		}
		result("\nTilt coordinates have been generated for darkfield imaging");
	 }

	/* Function to check the ring coordinates before imaging begins.
		angleStep = angleStep size used to generate tilt coordinates. This controls which coordinates will be used.
		e.g. if a step size of 2° was used it will only have 180 coordinates.
	*/
	void imageRingDP (object self, number angleStep)
	{
		image dataArray := dataObject.getDataArray();
		number DPExposure = dataObject.getDPExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number binning = dataObject.getBinningMultiplier();
		number beamCentreX = dataObject.getCentreXTilt();
		number beamCentreY = dataObject.getCentreYTilt();
		number tracker = dataObject.getTracker(); // This is the # of points recorded.
				
		number i
		number numberOfPoints = 8; // can be changed to provide more or less
		for(i=0; i < numberOfPoints; i++){
			number j = 1 + (round(tracker / numberOfPoints) * i); // the index of the value in the data array to use
			// Load coordinates from dataArray
			number tiltXRelative = getPixel( dataArray, j, 3)
			number tiltYRelative = getPixel( dataArray, j, 4)
			// Move there
			moveBeamTilt( tiltXRelative + beamCentreX, tiltYRelative + beamCentreY );
			// Take image
			image DPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
			string fileName = "Ring at " + (i * angleStep) + " deg"
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
			if(debugMode==false){ // save the images if debugmode is off.
				string fileDirectory = GetApplicationDirectory("auto_save", 0);
				string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
				SaveAsGatan( DPImage, filePath );
				DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // just added
				closeImage( DPImage );
			}
		}
		self.beamCentre();
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
			if(!imageAlignmentDialog.alignTwoImages(thisImage, baseImage, offsetX, offsetY)){
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
			image alignedImage :=  imageAlignmentDialog.createAlignedImage (thisImage, minXShift, minYShift, maxXShift, maxYShift, XShift, YShift);
			showImage(alignedImage);
		}
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
		number binning = dataObject.getBinningMultiplier();

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
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and it has been captured.")
			exit(0);
		}
		if (!ContinueCancelDialog( "Please Centre the beam before continuing..." )){
			Throw( "User aborted process." );
		}
		self.startDPStoring();
	}
		
	void onDFChange (object self)
	{
		number newDFExposure;
		taggroup intfield=self.lookupelement("DarkfieldExposureFieldInput")
		newDFExposure = dlggetvalue(intfield);
		dataObject.setDFExposure(newDFExposure);
		if(debugMode==true){result("\nDarkField Exposure time set to " + newDFExposure + " seconds");}
	}
	void onBFChange (object self)
	{
		number newBFExposure;
		taggroup intfield=self.lookupelement("BrightfieldExposureFieldInput")
		newBFExposure = dlggetvalue(intfield);
		dataObject.setBFExposure(newBFExposure);
		if(debugMode==true){result("\nBrightField Exposure time set to " + newBFExposure + " seconds");}
	}
	void onDPChange (object self)
	{
		number newDPExposure;
		taggroup intfield=self.lookupelement("DiffractionExposureFieldInput")
		newDPExposure = dlggetvalue(intfield);
		dataObject.setDPExposure(newDPExposure);
		if(debugMode==true){result("\nDiffraction Pattern Exposure time set to " + newDPExposure + " seconds");}
	}	
	
		
	/* CONTROL PANEL BUTTON FUNCTIONS*/
	void beamCentreButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active.")
			exit(0);
		}
		if(debugMode==true){result("\nCentralizing Beam");}
		self.beamCentre();
	}

		
	/* IMAGE PANEL BUTTON FUNCTIONS */
	void StoreDPButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		// Stores a diffraction spot's tilt coordinates and takes a picture to reference the spot in future.
		if(dataObject.getTracker()<1)
		{ //The first tiltStore needs to make the reference image as well.
			Throw("Data NOT stored. Please Calibrate the system first.")
		}
		else
		{
			number shadowDistanceNM;
			shadowDistanceNM = dataObject.getShadowDistanceNM();
			getNumber("Set Shadowing Distance in (1/nm):", shadowDistanceNM , shadowDistanceNM)
			dataObject.setShadowDistanceNM(shadowDistanceNM)
			self.storeTiltCoord (shadowDistanceNM , 0 );
		}
	}
		
	void storeROIButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(dataObject.getTracker()<1){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		// Get the total number of ROI on the screen
		ImageDisplay viewDisplay
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			throw("No Live View window found");
		}
		/* Create the ImageSet Tag Group. The values will be filled out as the function goes on and uploaded to the dataObject before the storeROIButtonPress function ends. */
		TagGroup imageSet = imageSetTools.createNewImageSet();
		imageSetTools.addImageSet(imageSet);
				
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==true){result("\nThere are " + totalROI + " ROI highlighted on the View Window before any shadowing.");}
		if(totalROI < 1)
		{ 
			Throw("No ROI are present.")
		}
		image dataArray := dataObject.getDataArray();
		//if(dataObject.getTracker() > 1){ // All ready results stored?
			//if(TwoButtonDialog("Delete previous stored points?", "Yes", "No")){
				dataObject.setTracker(1);
				number height, width;
				getSize(dataArray, width, height)
				//realsubarea operator[( realimage img, number top, number left, number bottom, number right )
				dataArray[0, 1, height, width] = 0; // Set all values except first to 0
				result("\nStored points have been cleared. Calibration data are still in memory.")			
			//}
		//}
		number shadowDistanceNM;
		shadowDistanceNM = dataObject.getShadowDistanceNM();
		getNumber("Shadow points by (1/nm): ", shadowDistanceNM, shadowDistanceNM);
		
		dataObject.setShadowDistanceNM(shadowDistanceNM)
		imageSet.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM); // store in imageSet Tags
		
		// Create the information for the image of the diffraction pattern. This makes sure BF and DP are paired up later.
		TagGroup CentralImage = imageSetTools.createNewImageForImageSet();
		CentralImage.TagGroupSetTagAsString("ImageType", "DP");
		CentralImage.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
		CentralImage.TagGroupSetTagAsNumber("xTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("yTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("xTiltValue", dataObject.getCentreXTilt());
		CentralImage.TagGroupSetTagAsNumber("yTiltValue", dataObject.getCentreYTilt());
		CentralImage.TagGroupSetTagAsNumber("ShadowValue", 0);
		CentralImage.TagGroupSetTagAsNumber("DSpacingAng", 0);
		
		imageSetTools.addSpotToCurrentImageSet();
		imageSetTools.addImageDataToCurrentSpot(CentralImage, "Middle");
		
		if(debugMode==true){result("\nCreating ROI List...");}
		if(debugMode==true){result("\n\tROIs present: " + totalROI);}
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
		dataobject.setROIList(ROIData);
		if(debugMode==true){result("\nROI List loaded to DataObject.");}
		
		image ROIList = dataObject.getROIList();
		// For each ROI...
		if(debugMode==true){result("\nBeginning to move to and store ROIs...");}
		for(i=0; i < totalROI; i++)
		{
			result("\n\tROI " + (i+1) + " of " + totalROI);
			if(debugMode==true){result("\nROI " + (i+1) + " of " + totalROI +  " has index ");}
			number indexValue = getPixel(ROIList, i, 1);
			if(debugMode==true){result(indexValue);}
			dataObject.setROITracker(indexValue); // Set ROI tracker number
			self.moveToCurrentROI(); // Go there.
			self.storeTiltCoord(shadowDistanceNM, 0); // Store it in the system + Shadow.
		}
		if(debugMode==true){result("\nAll ROIs stored.");}
		OkDialog("All ROI have been stored. You may now begin imaging.");
		self.beamCentre();
		if(debugMode==true){
			imageSetTools.showImageSets();
		}
	}

	void storeRingButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(!markerRing.ComponentIsValid()){
			throw("Marker Ring not found")
		}
		image dataArray := dataObject.getDataArray();
		if(dataObject.getTracker() > 1){ // All ready results stored?
			//if(TwoButtonDialog("Delete previous stored points?", "Yes", "No")){
				dataObject.setTracker(1);
				number height, width;
				getSize(dataArray, width, height)
				//realsubarea operator[( realimage img, number top, number left, number bottom, number right )
				dataArray[0, 1, height, width] = 0; // Set all values except first to 0
				result("\nStored points have been cleared. Calibration data are still in memory.")			
			//}
		}
		number radiusPX = self.markerRingRadius();
		number numberOfPoints;
		self.loadRingPoints (radiusPX, 0, numberOfPoints);
		self.imageRingDP (45);
		self.beamCentre();
	}
	
	void deleteStoredTiltsButtonPress (object self)	
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		self.beamCentre();
		dataObject.resetTiltStore();
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
				scaleX = dataObject.getRefScale() * dataObject.getBinningMultiplier();
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
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(dataObject.getTracker()<2)
		{
			Throw("No spots are stored.");
		}
		number shadowDistanceNM = dataObject.getShadowDistanceNM();
		number integrationDistance = 45;
		number integration = TwoButtonDialog("Use integrated images? Can help when taking an entire ring.", "Yes", "No");
		if(integration==true){
			getNumber("How many results should each image be made of?", integrationDistance, integrationDistance);
		}
		self.darkFieldImage (shadowDistanceNM, integration, integrationDistance)
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

