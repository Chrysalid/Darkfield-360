//****************************************************
// TOOLKIT FUNCTIONS & CLASS
//****************************************************

// Contains the dialog that acts as the main control interface for the toolkit.
// This is the highest level object, with the other objects contained inside it. When this one closes, they all go out of scope.
// Currently has a lot of functions that make use of the child objects, rather than putting them in their own classes.
// The Image-taking functions in particular need to be seperated out for ease of management.

class DF360Dialog : uiframe
{
	number ToolkitID; // the ID of this object
	number debugMode;
	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image.
	number isCalibrated; // flag to test if the scope is calibrated or not.
	
	/* These objects are the various classes that are brought together in the toolkit to provide functions and record values. */
	object dataObject;
	number dataObjectID;
	object imageSetTools;
	number imageSetToolsID;
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
	object ProgressBarDialog;
	number ProgressBarDialogID;
	object ImagingFunctionsObject;
	number ImagingFunctionsObjectID;
	
	// Function to print out the various saved variables for debugging. Will only work in Debug Mode
	void printAllValues(object self)
	{
		if(debugMode != 1){
			return;
		}
		result("\n\nToolkit Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ToolkitID +\
			"\n DebugMode: " + debugMode +\
			"\n EMonline: " + EMOnline +\
			"\n AllowControl: " + AllowControl +\
			"\n DataObjectID: " + DataObjectID + " and " + (dataObject.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\n KeyListenerID: " + KeyListenerID + " and " + (KeyListener.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\n imageAlignmentDialogID: " + imageAlignmentDialogID + " and " + (imageAlignmentDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n imageSetToolsID: " + imageSetToolsID + " and " + (imageSetTools.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n scaleCalibrationDialogID: " + scaleCalibrationDialogID + " and " + (scaleCalibrationDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n tiltCalibrationDialogID: " + tiltCalibrationDialogID + " and " + (tiltCalibrationDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n CameraControlObjectID: " + CameraControlObjectID + " and " + (CameraControlObject.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n ImageProcessingObjectID: " + ImageProcessingObjectID + " and " + (ImageProcessingObject.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n ImageConfigDialogID: " + ImageConfigDialogID + " and " + (ImageConfigDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid";
		result(textstring);
		result("\n-------End----------------")
		CameraControlObject.printAllValues();
		ImageSetTools.printAll();
		DataObject.printAll();
		ImagingFunctionsObject.printAllValues();
		ProgressBarDialog.printAllValues();
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

	
	/* The Toolkit will store the ImageSetTools object for future use. */
	number storeImageSetTools(object self, object &theImageSetTools)
	{
		imageSetTools = theImageSetTools;
		imageSetToolsID = imageSetTools.ScriptObjectGetID();
		imageSetTools.initialise(ToolkitID, dataObjectID);
		imageSetTools.setDebugMode(debugMode);
		return imageSetToolsID;
	}
	
	/* The Toolkit will store the KeyListener for future use. */
	number storeKeyListener(object self, object &theKeyListener)
	{
		KeyListener = theKeyListener;
		KeyListenerID = KeyListener.ScriptObjectGetID();
		KeyListener.initialise(ToolkitID, dataObjectID, imageSetToolsID, ImagingFunctionsObjectID, CameraControlObjectID);
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

	/* Store the alignment dialog for future use. */
	number storeAlignmentDialog(object self, object theAlignmentDialog)
	{
		imageAlignmentDialog = theAlignmentDialog;
		imageAlignmentDialogID = imageAlignmentDialog.ScriptObjectGetID();
		imageAlignmentDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		imageAlignmentDialog.setDebugMode(debugMode);
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

	/* Store the tilt calibration dialog for future use. */
	number storeTiltDialog(object self, object theDialog)
	{
		tiltCalibrationDialog = theDialog;
		tiltCalibrationDialogID = tiltCalibrationDialog.ScriptObjectGetID();
		tiltCalibrationDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		tiltCalibrationDialog.setDebugMode(debugMode);
		return tiltCalibrationDialogID;
	}
	
	/* Store the Camera Control object */
	void storeCameraControlObject(object self, object theCameraControlObject)
	{
		CameraControlObject = theCameraControlObject;
		CameraControlObjectID = CameraControlObject.ScriptObjectGetID();
		CameraControlObject.initialise(ToolkitID, dataObjectID);
		CameraControlObject.setDebugMode(debugMode);
	}

	/* Store the Image Processing object */
	void storeImageProcessingObject(object self, object theImageProcessingObject)
	{
		ImageProcessingObject = theImageProcessingObject;
		ImageProcessingObjectID = ImageProcessingObject.ScriptObjectGetID();
		ImageProcessingObject.initialise(ToolkitID, dataObjectID, imageSetToolsID, imageAlignmentDialogID); // Tell the object who it belongs to
		ImageProcessingObject.setDebugMode(debugMode);
	}
	
	/* Store the Image Configuration dialog object */
	void storeImageConfigDialog(object self, object theImageConfigDialog)
	{
		imageConfigDialog = theImageConfigDialog;
		imageConfigDialogID = imageConfigDialog.ScriptObjectGetID();
		imageConfigDialog.initialise(ToolkitID, dataObjectID, imageSetToolsID); // Tell the object who it belongs to
		imageConfigDialog.setDebugMode(debugMode);
	}

	void storeProgressBarDialog(object self, object theProgressBarDialog)
	{
		ProgressBarDialog = theProgressBarDialog;
		ProgressBarDialogID = ProgressBarDialog.ScriptObjectGetID();
		ProgressBarDialog.initialise(ToolkitID, dataObjectID, imageSetToolsID); // Tell the object who it belongs to
		ProgressBarDialog.setDebugMode(debugMode);
	}
	
	void storeImagingFunctionsObject(object self, object theImagingFunctionsObject)
	{
		ImagingFunctionsObject = theImagingFunctionsObject;
		ImagingFunctionsObjectID = ImagingFunctionsObject.ScriptObjectGetID();
		ImagingFunctionsObject.initialise(ToolkitID, dataObjectID, imageSetToolsID, CameraControlObjectID, ProgressBarDialogID);
		ImagingFunctionsObject.setDebugMode(debugMode);
	}
	
		
	void UpdateDebugMode(object self){
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
		if(ProgressBarDialog.ScriptObjectIsValid()){
			ProgressBarDialog.setDebugMode(debugMode);
		}
		if(ImagingFunctionsObject.ScriptObjectIsValid()){
			ImagingFunctionsObject.setDebugMode(debugMode);
		}
		if(CameraControlObject.ScriptObjectIsValid()){
			CameraControlObject.setDebugMode(debugMode);
		}
		if(ImageProcessingObject.ScriptObjectIsValid()){
			ImageProcessingObject.setDebugMode(debugMode);
		}
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
		number initialDFExposure = CameraControlObject.getDFExposure();
		TagGroup DarkfieldImagingExposure = DLGCreateRealField( initialDFExposure, 10, 3, "onDFChange").dlgidentifier("DarkfieldExposureFieldInput")
		panel1.dlgaddelement(DarkfieldImagingExposure)
		panel1.dlgaddelement(dlgcreatelabel("Brightfield Exposure:")) // Label
		number initialBFExposure = CameraControlObject.getBFExposure();
		TagGroup BrightfieldImagingExposure = DLGCreateRealField( initialBFExposure, 10, 3, "onBFChange").dlgidentifier("BrightfieldExposureFieldInput")
		panel1.dlgaddelement(BrightfieldImagingExposure)
		panel1.dlgaddelement(dlgcreatelabel("Diffraction Pattern Exposure:")) // Label
		number initialDPExposure = CameraControlObject.getDPExposure();
		TagGroup DiffractionImagingExposure = DLGCreateRealField( initialDPExposure, 10, 3, "onDPChange").dlgidentifier("DiffractionExposureFieldInput")
		panel1.dlgaddelement(DiffractionImagingExposure)
		TagGroup captureViewButton = DLGCreatePushButton("Capture Live View Window", "captureViewButtonPress");
		panel1.dlgaddelement(captureViewButton);
		
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
		TagGroup debugModeCheckBox = DLGCreateCheckBox( "Debug Mode", debugMode, "onDebugOptionChange");
		panel6.dlgaddelement(debugModeCheckBox);
		TagGroup changeSaveDir = DLGCreatePushButton("Save Directory", "saveDirButtonPress");
		panel6.dlgaddelement(changeSaveDir);
		TagGroup enterScaleButton = DLGCreatePushButton("Set Scale", "enterScaleButtonPress");
		panel6.dlgaddelement(enterScaleButton);
		TagGroup manualTiltEntryButton = DLGCreatePushButton("Tilt Calibration", "manualTiltCalibrationButtonPress");
		panel6.dlgaddelement(manualTiltEntryButton);
		TagGroup saveSettingsToFile = DLGCreatePushButton("Save Settings File", "saveToolKitVariablesToFilePress");
		panel6.dlgaddelement(saveSettingsToFile);
		TagGroup loadSettingsFromFile = DLGCreatePushButton("Load Settings File", "loadToolkitVariablesFromFilePress");
		panel6.dlgaddelement(loadSettingsFromFile);
		TagGroup saveSettingsToDM = DLGCreatePushButton("Set as Default", "saveVariablesToMemoryPress");
		panel6.dlgaddelement(saveSettingsToDM);
		number initialModeWarningOption = (dataObject.getDisableModeWarnings() == false) ? 1 : 0;
		TagGroup DisableModeWarnings = DLGCreateCheckBox( "Show Mode Warnings", initialModeWarningOption, "onModeWarningOptionChange");
		panel6.dlgaddelement(DisableModeWarnings);
		TagGroup ExamineGTGFile = DLGCreatePushButton("View GTG file", "ExamineGTGFilePress");
		panel6.dlgaddelement(ExamineGTGFile);

		panel6.dlgtablelayout(2,12,0); // Arrange the buttons
		
		// Panel 7 is for final Imaging steps
		taggroup panel7=dlgcreatepanel()
		panel7.dlgaddelement(dlgcreatelabel("Dark Field Imaging")) // Label
		TagGroup DarkFieldStoredButton = DLGCreatePushButton("Start Imaging", "DarkFieldImageButtonPress")
		panel7.dlgaddelement(DarkFieldStoredButton)
		panel7.dlgaddelement(dlgcreatelabel("Image Processing")) // Label
		panel7.dlgaddelement(dlgcreatelabel("")) // Blank
		TagGroup LoadImageSetButton = DLGCreatePushButton("Load Image Set File", "LoadImageSetButtonPress")
		panel7.dlgaddelement(LoadImageSetButton)
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
	DF360Dialog(object self)
	{
		ToolkitID = self.ScriptObjectGetID();
		debugMode = 1;
		isCalibrated = 0;		
	}
		
	// Function called on any destruction event.
	~DF360Dialog(object self)
	{
		imageDisplay imgdisp;
		if(CameraControlObject.returnViewImageDisplay(imgdisp) == true){
			component annotid=imgdisp.ComponentGetChild(0)
			while (annotid.ComponentIsValid()){
				annotid.componentremovefromparent();
				annotid=imgdisp.ComponentGetChild(0);
			}
			CameraControlObject.beamCentre();
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
		if(!CameraControlObject.returnViewImage(viewImage)){
			if(debugMode==true){result("\nNo View Window detected.");}
			return; // Stop here if no view window is there.
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
			return;
		}
		if (!ContinueCancelDialog( "Please Centre the beam before continuing..." )){
			return;
		}
		isCalibrated = ImagingFunctionsObject.startDPStoring();
		ImagingFunctionsObject.setIsCalibrated(isCalibrated);
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
		CameraControlObject.beamCentre();
	}

		
	/* IMAGE PANEL BUTTON FUNCTIONS */
	
	void EditImageSetButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			return;
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
		} else {
			if(debugMode==true){result("\nUser cancelled image set creation/edit. No changes made.");}
			return;
		}
		
		// Create the information for the image of the centre of the diffraction pattern. This will be used to make the central DP image later.
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
		
	}
	
	
	// This button saves the current tilt setting for the current ImageSet with the storeTiltCoord() function.
	// Does not create any images or move the beam.
	// Uses StoreDP() on ImagingFunctionsObject
	void StoreDPButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			return;
		}
		// Stores a diffraction spot's tilt coordinates and takes a picture to reference the spot in future.
		if(isCalibrated == 0)
		{
			Throw("Data not stored. Please Calibrate the system first.");
		}
		
		ImagingFunctionsObject.StoreDP();

	}
		
	// This button saves the ROI point coordinates on the Live view screen to the current ImageSet.
	// Uses the StoreAllROI function on the ImagingFunctionsObject.
	void storeROIButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			Throw("Toolkit Controls are offline. Ensure there is a live view window active and has been captured.");
		}
		if(isCalibrated == 0){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		number isROIStored = ImagingFunctionsObject.StoreAllROI();
		
		if(isROIStored == true){
			OkDialog("All ROI have been stored. You may now Finalize the image set.");
			if(debugMode==true){
				imageSetTools.showImageSets();
			}
		}
		
		
	}
	
	/* This button will use the spot data stored in the current image set to create DP images.
			It will then update the image set with information about the images being taken.
			This step is the final phase before DF imaging begins.
			Function is kept in ImagingFunctionsObject
	*/
	
	void FinalizeImageSetButtonPress(object self)
	{
		ImagingFunctionsObject.finalizeImageSet();
	}
	
	
		
	/* RING PANEL BUTTON FUNCTIONS*/
	void RingToggleButtonPress (object self)
	{
		if(debugMode==1){result("\n\tYou have pressed to toggle the marker ring");}
		// Make the Marker Ring and radius display visible/hidden;
		CameraControlObject.toggleMarkerRing();
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
		CameraControlObject.setRingRadius (desiredRadiusNM);
		CameraControlObject.updateRadius();
	}
		
	void updateRingRadiusButtonPress(object self)
	{
		CameraControlObject.updateRadius();
	}

	void recenterRingButtonPress (object self)
	{
		CameraControlObject.recenterMarkerRing();
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
		if(CameraControlObject.returnViewImage(viewImage) == true){ // if View image present...
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
		CameraControlObject.makeNewCircle(targetImage, radiusPX, radiusTextString, componentColour);
	}

	/* Imaging & Processing Panel Functions */
	
	void DarkFieldImageButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			return;
		}
		TagGroup imageSet;
		ImageSetTools.getCurrentImageSet(imageSet);
		number DPsTaken
		imageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken)
		
		if(DPsTaken == false)
		{
			Throw("Image Set has not been finalised");
		}
		
		ImagingFunctionsObject.startDarkfieldImaging(imageSet);
		//ProgressBarDialog.makeDialog(); //command to start the progress bar dialog.
	}
	
	void LoadImageSetButtonPress(object self)
	{
		ImageSetTools.importImageSetFile();
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
			return;
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
			return;
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
	
	void onDebugOptionChange(object self, TagGroup tg)
	{
		number setting = tg.dlggetvalue();
		if(setting == 0 || setting == 1){
			debugMode = setting;
			result("\nDebugMode set to " + debugMode);
			self.UpdateDebugMode();
		} else {
			result("\n There was an error setting the debug mode to " + setting);
		}
		
	}
	
	void onModeWarningOptionChange(object self, TagGroup tg)
	{
		number setting = tg.dlggetvalue();
		setting = (setting == 1) ? 0 : 1 ;
		dataObject.setDisableModeWarnings(setting);
		if(debugMode == true){result("\n\t DisableModeWarning option changed to " + dataObject.getDisableModeWarnings());}
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
		CameraControlObject.captureViewScreen();
		/* Needs to be in toolkit, not in CameraControlObject object */
		ImageDisplay frontdisp
		if(CameraControlObject.returnViewImageDisplay(frontdisp))
		{
			self.attachKeyListener(frontdisp) // attach the keylistener to the live-view display and start it up.
			if(debugMode==1){result("\n\tKeyListener created and attached. Shortcut keys available.");}
		}
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
	
	void ExamineGTGFilePress (object self){
		string path;
		if(OpenDialog( path )){
			TagGroup ToLoad = NewTagGroup();
			if(TagGroupLoadFromFile( ToLoad, path )){
				TagGroupOpenBrowserWindow( ToLoad , 0 );
			}		
		}	
	}
	
}
