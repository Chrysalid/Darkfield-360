//****************************************************
// STARTUP FUNCTIONS
//****************************************************

// This function is called when the toolkit starts.
// It creates, configures and stores the dialogs and tag groups found in the other sections.

object startToolkit () {
	
	result("\nCreating toolkit data store...")
	object dataObject = alloc(MyDataObject); // This is the object that will contain everything else.
	
	result("\nSetting Variables.")
	// Set Variables
	dataObject.setMaxDeviation(0.2); // difference (in 1/nm) allowed during pattern matching operations
	image dataArray; // Array of values that are stored for future reference.
	
	result("\nLoading Image Set Tools...")
	object theImageSetTools = alloc(ImageSetTools);
	
	result("\nLoading Camera Controls...")
	object theCameraControlObject = alloc(CameraControl);
	
	result("\nCreating KeyListener for shortcut commands...")
	// Create objects that will be used later but must be created now before the class drops from scope
	object KeyListener=alloc(MyKeyHandler) // Key handler for the view Window for shortcut key presses. Not attached yet.
	
	result("\nCreating Alignment Dialog System...")
	object alignmentDialog = alloc(alignmentdialog); // The aligning image dialog. Is not displayed or created yet.
	
	result("\nCreating Calibration Input Dialog...")
	object calibrationDialog = alloc(ScaleValueDialog);
	
	result("\nCreating Tilt Calibration Input Dialog...")
	object tiltDialog = alloc(TiltValueDialog);
	
	result("\nLoading Image Processing Functions...")
	object ImageProcessingObject = alloc(ImageProcessing);
	
	result("\nLoading Image Set Configuration Dialog...")
	object ImageConfigDialog = alloc(ImageConfiguration);
	
	if(dataObject.checkPersistent()==false){
		TagGroup persistentSave = dataObject.createDefaultPersistent(); // make a blank set of data
		dataObject.updatePersistent(persistentSave); // save it to memory
	}
	dataObject.overWriteDataObject(); // load variables from permanent memory into the dataObject.

	// Construct the Toolkit. This automatically creates the toolkit dialog.
	object Toolkit = alloc(CreateDF360DialogClass);
	// Toolkit.ToggleDebugMode() // comment out to deactivate debugMode on startup. Can be toggled on toolkit manually
	result("\nAttaching data store to Toolkit...")
	Toolkit.storeDataObject(dataObject);
	Toolkit.storeImageSetTools(theImageSetTools);
	Toolkit.storeKeyListener(KeyListener); 	// Insert it into toolkit. To make it listen for key presses on a display use Toolkit.startListening(ImageDisplay);
	Toolkit.storeAlignmentDialog(alignmentDialog); // Stored in toolkit object.
	Toolkit.storeCalibrationDialog(calibrationDialog);
	Toolkit.storeTiltDialog(tiltDialog);
	Toolkit.storeCameraControlObject(theCameraControlObject);
	Toolkit.storeImageProcessingObject(ImageProcessingObject);
	Toolkit.storeImageConfigDialog(ImageConfigDialog);
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
		// Note: The script looks for a view window here.
	image viewImage;
	if(!returnViewImage(0, viewImage)){
		result("\nNo View Window detected. Many controls will not be accessible or could cause crashes."\
		+ "\nIf you open a live View window later you can 'capture' it on the Options panel.");
	} else {
		Toolkit.captureViewScreen();
	}
	
	// Forces the user to choose the save directory
	result("\nPlease select an auto-save directory for images made by this script.")
	result("\nThis can be changed later in the toolkit options menu");
	result("\nThe auto-save directory has been set to " + setAutoSaveDir())
	
	printGreeting(); // Basic Instructions
	printCommands(); // Shortcut keys
}

main();