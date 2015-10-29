// ********************************
//	Imaging Configuration Dialog
// ********************************
// When creating a new image set and preparing to take darkfield images this dialog can be used to select the image set settings.
// Not used to process or view image sets, which will have to show images and things.

class ImageConfiguration : uiframe
{
	// Global variables
	number imageConfigurationID; // Used by child dialog to return values to parent.
	object childDialog; // Store a clone of this dialog here for repeated use.
	TagGroup returnedSettings; // Used by child dialog to return values to parent.
	number dataObjectID;
	number toolkitID;
	number ImageSetToolsID;
	number debugMode;
	
	void takeImageConfiguration(object self, tagGroup settingsGroup){ // updates the returnedSettings object
		returnedSettings = settingsGroup;
	}
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		ImageSetToolsID = theImageSetToolsID;
	}
	
	/* Function to create the dialog (minus the OK/Cancel buttons) */
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for ImageSet Config dialog.");}
		taggroup box_items
		taggroup box=dlgcreatebox("Configure Image Set", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		string imageSetNameString = "DEBUG";
		string imageSetID = "i99999999999";
		number integrationState = 1; 
		number integrationDistance = 5;
		number saveNonIntImages = 1;
		number displayNonIntImages = 1;
		number shadowState = 1;
		number shadowDistance = 1;
		number ringState = 1;
		number DSpacing = 5;
		number numberOfRingPoints = 180;
		number autoSaveState = 1;
		number displayImagesState = 1;
		
		TagGroup ImageSetNameLabel = DLGCreateLabel("Image Set Name: ");
		TagGroup ImageSetNameField = DLGCreateStringField(imageSetNameString, 20, "changedImageSetName" ).dlgidentifier("ImageSetNameField");		
		TagGroup ImageSetIDLabel = DLGCreateLabel("Image Set ID: ");
		TagGroup ImageSetIDField = DLGCreateStringField(imageSetID, 20).dlgidentifier("ImageSetIDField");
		taggroup ImageSetTitle = dlggroupitems(ImageSetNameLabel, ImageSetNameField, ImageSetIDLabel, ImageSetIDField ).dlgtablelayout(4,1,0);
		
		// Integration Mode
		TagGroup IntegrationLabel = DLGCreateLabel("Integration Title");
		TagGroup IntegrationMode = DLGCreateCheckBox( "Integrated Images", integrationState, "changedIntegrationMode" ).dlgidentifier("IntegrationModeCheckBox");
		TagGroup IntegrationDistanceLabel = DLGCreateLabel("# of images per integration:")
		TagGroup IntegrationNumber = DLGCreateIntegerField(  integrationDistance, 10, "changedIntegrationDistance" ).dlgidentifier("IntegrationDistanceField");
		TagGroup IntDistArea = dlggroupitems(IntegrationDistanceLabel, IntegrationNumber).dlgtablelayout(2,1,0);
		TagGroup SaveNonInt = DLGCreateCheckBox( "Save Non-Integrated Images", saveNonIntImages, "changedSaveNonIntImages" ).dlgidentifier("SaveNonIntImagesCheckBox");
		TagGroup DisplayNonInt = DLGCreateCheckBox( "Display Non-Integrated Images", displayNonIntImages, "changedDisplayNonIntImages" ).dlgidentifier("DisplayNonIntImagesCheckBox");
		TagGroup IntSavesArea = dlggroupitems(SaveNonInt, DisplayNonInt).dlgtablelayout(1,2,0)
		TagGroup IntegrationArea = dlggroupitems(IntegrationLabel, IntegrationMode, IntDistArea, IntSavesArea).dlgtablelayout(1,4,0)
		
		// Shadow Mode
		TagGroup ShadowLabel = DLGCreateLabel("Shadowing Title");
		TagGroup ShadowMode = DLGCreateCheckBox( "Shadow Images", shadowState, "changedShadowMode" ).dlgidentifier("ShadowModeCheckBox");
		TagGroup ShadowDistanceLabel = DLGCreateLabel("Shadow Distance (1/nm):");
		TagGroup ShadowDistanceField = DLGCreateRealField(  shadowDistance, 10, 1, "changedShadowDistance" ).dlgidentifier("ShadowDistanceField");
		TagGroup ShadowDistanceValues = dlggroupitems(ShadowDistanceLabel, ShadowDistanceField).dlgtablelayout(2,1,0);
		TagGroup ShadowArea = dlggroupitems(ShadowLabel, ShadowMode, ShadowDistanceValues).dlgtablelayout(1,3,0);
		
		// Ring Mode
		TagGroup RingLabel = DLGCreateLabel("Ring Title");
		TagGroup RingMode = DLGCreateCheckBox( "Ring Mode", ringState, "changedRingMode" ).dlgidentifier("RingModeCheckBox");
		TagGroup DSpacingLabel = DLGCreateLabel("DSpacing (Angstroms):")
		TagGroup DSpacingField = DLGCreateRealField(  DSpacing, 10, 1, "changedDSpacing" ).dlgidentifier("DSpacingField");
		TagGroup DSpacingValues = dlggroupitems(DSpacingLabel, DSpacingField).dlgtablelayout(2,1,0);
		TagGroup NumberOfRingPointsLabel = DLGCreateLabel("# of spots to image:")
		TagGroup NumberOfRingPointsLabelField = DLGCreateIntegerField(  numberOfRingPoints, 10, "changedNumberOfRingPoints" ).dlgidentifier("NumberOfRingPointsLabelField");
		TagGroup NumberOfRingsValue = dlggroupitems(NumberOfRingPointsLabel, NumberOfRingPointsLabelField).dlgtablelayout(2,1,0)
		TagGroup RingArea = dlggroupitems(RingLabel, RingMode, DSpacingValues, NumberOfRingsValue).dlgtablelayout(1,4,0)
		
		// Save/Display General
		TagGroup autoSaveMode = DLGCreateCheckBox( "Auto-Save Images", autoSaveState, "changedSaveMode" ).dlgidentifier("SaveModeCheckBox");
		TagGroup displayImagesMode = DLGCreateCheckBox( "Display Images", displayImagesState, "changedDisplayImagesMode" ).dlgidentifier("DisplayImagesModeCheckBox");
		TagGroup newSetButton = DLGCreatePushButton("New Image Set", "onNewPress");
		TagGroup nextSetButton = DLGCreatePushButton(">", "onNextPress");
		TagGroup prevSetButton = DLGCreatePushButton("<", "onPrevPress");
		TagGroup Navigation = dlggroupitems(prevSetButton, newSetButton, nextSetButton).dlgtablelayout(3,1,0);
		TagGroup FileArea = dlggroupitems(autoSaveMode, displayImagesMode, Navigation).dlgtablelayout(1,3,0);
 
		TagGroup ImageNotes = DLGCreateTextBox( 50, 50, 2048 ).dlgidentifier("ImageNotesTextBox");
		
		box_items.DLGAddElement(ImageSetTitle);
		box_items.DLGAddElement(IntegrationArea);
		box_items.DLGAddElement(ShadowArea);
		box_items.DLGAddElement(RingArea);
		box_items.DLGAddElement(FileArea);
		box_items.DLGAddElement(ImageNotes);
		
		return box;
	}
	
	/* Fills the fields with the data from an ImageSet and enables/disables the fields */
	
	number updateDialog(object self, TagGroup ImageSet){
		number ImagesTaken
		string ImageSetID
		ImageSet.TagGroupGetTagAsNumber("ImagesTaken", ImagesTaken);
		if(ImagesTaken == 1){
			result("\nAttempted to load Image set " + ImageSetID + " in the configuration dialog, but image set has all ready been taken and cannot be configured.");
			return 0;
		}
		
	}
	
	/* Create the Dialog. Must be called before showScaleValueDialog. Uses the CreateFields function output */
	void generateDialog(object self){
		self.super.init( self.createFields() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showImageSettingsDialog(object self){
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// Function used to summon forth the dialog. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	number inputNewCalibration(object self)
	{
		if(debugMode==1){result("\nCreating child dialog Object (image set configuration options)");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showCalibrationDialog();	// Display the child with Pose() system
		if(useValues == 1){
			// save temporary tag groups to the dataObject
			self.saveToDataObject();
		}
		childDialog = NULL; // NULL the childDialog so it can go out of scope.
		return useValues;
	}

	// The constructor
	ImageConfiguration(object self)
	{
		imageConfigurationID = self.ScriptObjectGetID();
	}
	
	// The destructor (does nothing)
	~ImageConfiguration(object self)
	{
		result("\nImage set configuration Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}
		
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Imageset configuration dialog.");}
	}
}
