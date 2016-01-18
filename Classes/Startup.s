//****************************************************
// STARTUP FUNCTIONS
//****************************************************

// This function is called when the toolkit starts.
// It creates, configures and stores the dialogs and tag groups found in the other sections.

object startToolkit () {
	
	result("\nCreating toolkit data store...")
	object dataObject = alloc(ToolkitDataObject); // This is the object that will contain everything else.
	
	result("\nSetting Variables.")
	// Set Variables
	dataObject.setMaxDeviation(0.2); // difference (in 1/nm) allowed during pattern matching operations
	result("\nLoading Persistent Memory Settings.")
	TagGroup persistentSave
	if(dataObject.checkPersistent()==false){
		result("\n\t No Persistent Memory found. Using default settings.")
		persistentSave = dataObject.createPersistent(1); // make a default set of data
		dataObject.updatePersistent(persistentSave); // save it to persistent memory
		dataObject.loadPersistent(persistentSave); // Load it into data object
	} else { // load variables from permanent memory into the dataObject.
		result("\n\t Persistent Memory found. Loading settings.")
		persistentSave = dataObject.createPersistent(0); // create set of data from memory and dataObject
		dataObject.loadPersistent(persistentSave); // Load it into data object
	}
	
	result("\nLoading Image Set Tools...");
	object theImageSetTools = alloc(ImageSetTools);
	
	result("\nLoading Camera Controls...");
	object theCameraControlObject = alloc(CameraControl);
	
	result("\nCreating KeyListener for shortcut commands...");
	// Create objects that will be used later but must be created now before the class drops from scope
	object KeyListener=alloc(MyKeyHandler); // Key handler for the view Window for shortcut key presses. Not attached yet.
	
	result("\nCreating Alignment Dialog System...");
	object alignmentDialog = alloc(alignmentdialog); // The aligning image dialog. Is not displayed or created yet.
	
	result("\nCreating Calibration Input Dialog...");
	object calibrationDialog = alloc(ScaleValueDialog);
	
	result("\nCreating Tilt Calibration Input Dialog...");
	object tiltDialog = alloc(TiltValueDialog);
	
	result("\nLoading Image Processing Functions...");
	object ImageProcessingObject = alloc(ImageProcessing);
	
	result("\nLoading Image Set Configuration Dialog...");
	object ImageConfigDialog = alloc(ImageConfiguration);
	
	result("\nLoading Progress Bar Dialog...");
	object ProgressBarDialog = alloc(ProgressDialog);
	
	result("\nLoading Imaging Functions Object...");
	object ImagingFunctionsObject = alloc(ImagingFunctions);
	
	// Construct the Toolkit.
	object Toolkit = alloc(DF360Dialog);
	result("\nAttaching data store to Toolkit...");
	Toolkit.storeDataObject(dataObject); // Needs only Toolkit to be loaded.
	Toolkit.storeCameraControlObject(theCameraControlObject); // uses dataObject
	Toolkit.storeCalibrationDialog(calibrationDialog); // uses dataObject
	Toolkit.storeAlignmentDialog(alignmentDialog); // uses dataObject
	Toolkit.storeTiltDialog(tiltDialog); // uses DataObject
	Toolkit.storeImageSetTools(theImageSetTools); // uses DataObject
	
	Toolkit.storeImageConfigDialog(ImageConfigDialog); // uses Dataobject and ImageSetTools
	Toolkit.storeProgressBarDialog(ProgressBarDialog); // uses dataObject; ImageSetToolsID;
	
	Toolkit.storeImageProcessingObject(ImageProcessingObject); // uses dataObject, imageSetTools and imageAlignment
	Toolkit.storeImagingFunctionsObject(ImagingFunctionsObject); // uses dataObjectID; imageSetToolsID; CameraControlObjectID; ProgressBarDialogID;
	
	Toolkit.storeKeyListener(KeyListener); 	// Insert it into toolkit. To make it listen for key presses on a display use Toolkit.startListening(ImageDisplay);
	//	uses DataObject; ImageSetToolsID; ImagingFunctionsID; CameraControlObjectID
	Toolkit.updateDialog();
	return Toolkit;
}

// This function is triggered by the script being run and begins everything.
void main()
	{
	OpenResultsWindow(); // Shortcut to open the results window.
	result("\n-----------------------");
	result("\nDarkField360 Toolkit");
	result("\n-----------------------");
	result("\nLoading Toolkit ...");

	object ToolKit = startToolkit();		
	
	result("\nLoading complete.");
	Toolkit.printAllValues();
	
	// Forces the user to choose the save directory
	result("\nPlease select an auto-save directory for images made by this script.")
	result("\nThis can be changed later in the toolkit options menu");
	result("\nThe auto-save directory has been set to " + setAutoSaveDir())
	
	printGreeting(); // Basic Instructions
	printCommands(); // Shortcut keys
}

main(); // Run the script.