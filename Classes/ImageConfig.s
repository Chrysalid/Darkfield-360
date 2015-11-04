// ********************************
//	Imaging Configuration Dialog
// ********************************
// When creating a new image set and preparing to take darkfield images this dialog can be used to select the image set settings.
// Not used to process or view image sets, which will have to show images and things.
// an imageset is created ouside the dialog and passed to this local store. If values are kept it will create a new image set or overwrite the existing image set of the same ID.
// when starting to save DPs it will create a new image set. All settings can be changed except set ID.
// when starting darkfield imaging it will over-write or update. At this point it can only change image save settings (and notes when i get them working)

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
	TagGroup LocalImageSet; 
	
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
	
	/* Function to create the dialog (minus the OK/Cancel buttons)
		In order to set the field valus etc. the dialog must be displayed, but as a modal dialog this cannot be done easily.
		Therefore this function must also pre-load the initial values using the LocalImageSet tag group.
			LocalImageSet must be set before calling this function.
	
	*/
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for ImageSet Config dialog.");}
		taggroup box_items
		taggroup box=dlgcreatebox("Configure Image Set", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		// Get the variables...
		string imageSetNameString, imageSetID;
		number RingMode, NumberOfRingPoints, RingDSpacing, DegreeStep, IntegratedImage, NumberOfIntegrations;
		number AutoSaveNonInt, AutoDisplayNonInt, shadowMode, ShadowDistance, AutoSaveImages, AutoDisplayImages;
		
		// ring mode values
		LocalImageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		LocalImageSet.TagGroupGetTagAsNumber("NumberOfRingPoints", NumberOfRingPoints);
		LocalImageSet.TagGroupGetTagAsNumber("RingDSpacing", RingDSpacing);
		LocalImageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// integration
		LocalImageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		LocalImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		LocalImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", AutoSaveNonInt);
		LocalImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", AutoDisplayNonInt);
		
		// shadow settings
		LocalImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		if(ShadowDistance != 0){
			shadowMode = 1;
		} else {
			shadowMode = 0;
		}
		
		LocalImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages);
		LocalImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages);
		LocalImageSet.TagGroupGetTagAsString("SetName", imageSetNameString);
		LocalImageSet.TagGroupGetTagAsString("ImageSetID", imageSetID)
		
		TagGroup ImageSetNameLabel = DLGCreateLabel("Image Set Name: ");
		TagGroup ImageSetNameField = DLGCreateStringField(imageSetNameString, 20, "changedImageSetName" ).dlgidentifier("ImageSetNameField");		
		TagGroup ImageSetIDLabel = DLGCreateLabel("Image Set ID: ");
		TagGroup ImageSetIDField = DLGCreateStringField(imageSetID, 20).dlgidentifier("ImageSetIDField");
		taggroup ImageSetTitle = dlggroupitems(ImageSetNameLabel, ImageSetNameField, ImageSetIDLabel, ImageSetIDField ).dlgtablelayout(4,1,0);
		
		// Integration Mode
		TagGroup IntegrationLabel = DLGCreateLabel("Integration Title");
		TagGroup IntegrationMode = DLGCreateCheckBox( "Integrated Images", IntegratedImage, "changedIntegrationMode" ).dlgidentifier("IntegrationModeCheckBox");
		TagGroup IntegrationDistanceLabel = DLGCreateLabel("# of images per integration:")
		TagGroup IntegrationNumber = DLGCreateIntegerField(  NumberOfIntegrations, 10, "changedIntegrationDistance" ).dlgidentifier("IntegrationDistanceField");
		TagGroup IntDistArea = dlggroupitems(IntegrationDistanceLabel, IntegrationNumber).dlgtablelayout(2,1,0);
		TagGroup SaveNonInt = DLGCreateCheckBox( "Save Non-Integrated Images", AutoSaveNonInt, "changedSaveNonIntImages" ).dlgidentifier("SaveNonIntImagesCheckBox");
		TagGroup DisplayNonInt = DLGCreateCheckBox( "Display Non-Integrated Images", AutoDisplayNonInt, "changedDisplayNonIntImages" ).dlgidentifier("DisplayNonIntImagesCheckBox");
		TagGroup IntSavesArea = dlggroupitems(SaveNonInt, DisplayNonInt).dlgtablelayout(1,2,0)
		TagGroup IntegrationArea = dlggroupitems(IntegrationLabel, IntegrationMode, IntDistArea, IntSavesArea).dlgtablelayout(1,4,0)
		
		// Shadow Mode
		TagGroup ShadowLabel = DLGCreateLabel("Shadowing Title");
		TagGroup ShadowState = DLGCreateCheckBox( "Shadow Images", shadowMode, "changedShadowMode" ).dlgidentifier("ShadowModeCheckBox");
		TagGroup ShadowDistanceLabel = DLGCreateLabel("Shadow Distance (1/nm):");
		TagGroup ShadowDistanceField = DLGCreateRealField(  shadowDistance, 10, 1, "changedShadowDistance" ).dlgidentifier("ShadowDistanceField");
		TagGroup ShadowDistanceValues = dlggroupitems(ShadowDistanceLabel, ShadowDistanceField).dlgtablelayout(2,1,0);
		TagGroup ShadowArea = dlggroupitems(ShadowLabel, ShadowState, ShadowDistanceValues).dlgtablelayout(1,3,0);
		
		// Ring Mode
		TagGroup RingLabel = DLGCreateLabel("Ring Title");
		TagGroup RingState = DLGCreateCheckBox( "Ring Mode", RingMode, "changedRingMode" ).dlgidentifier("RingModeCheckBox");
		TagGroup DSpacingLabel = DLGCreateLabel("DSpacing (Angstroms):")
		TagGroup DSpacingField = DLGCreateRealField(  RingDSpacing, 10, 1, "changedDSpacing" ).dlgidentifier("DSpacingField");
		TagGroup DSpacingValues = dlggroupitems(DSpacingLabel, DSpacingField).dlgtablelayout(2,1,0);
		TagGroup NumberOfRingPointsLabel = DLGCreateLabel("# of spots to image:")
		TagGroup NumberOfRingPointsLabelField = DLGCreateIntegerField(  numberOfRingPoints, 10, "changedNumberOfRingPoints" ).dlgidentifier("NumberOfRingPointsLabelField");
		TagGroup NumberOfRingsValue = dlggroupitems(NumberOfRingPointsLabel, NumberOfRingPointsLabelField).dlgtablelayout(2,1,0)
		TagGroup RingArea = dlggroupitems(RingLabel, RingState, DSpacingValues, NumberOfRingsValue).dlgtablelayout(1,4,0)
		
		// Save/Display General
		TagGroup autoSaveMode = DLGCreateCheckBox( "Auto-Save Images", AutoSaveImages, "changedSaveMode" ).dlgidentifier("SaveModeCheckBox");
		TagGroup displayImagesMode = DLGCreateCheckBox( "Display Images", AutoDisplayImages, "changedDisplayImagesMode" ).dlgidentifier("DisplayImagesModeCheckBox");
		TagGroup newSetButton = DLGCreatePushButton("New Image Set", "onNewPress");
		TagGroup nextSetButton = DLGCreatePushButton(">", "onNextPress");
		TagGroup prevSetButton = DLGCreatePushButton("<", "onPrevPress");
		TagGroup Navigation = dlggroupitems(prevSetButton, newSetButton, nextSetButton).dlgtablelayout(3,1,0);
		TagGroup FileArea = dlggroupitems(autoSaveMode, displayImagesMode, Navigation).dlgtablelayout(1,3,0);
 
		TagGroup ImageNotes = DLGCreateTextBox( 50, 5, 2048 ).dlgidentifier("ImageNotesTextBox");
		
		box_items.DLGAddElement(ImageSetTitle);
		box_items.DLGAddElement(IntegrationArea);
		box_items.DLGAddElement(ShadowArea);
		box_items.DLGAddElement(RingArea);
		box_items.DLGAddElement(FileArea);
		box_items.DLGAddElement(ImageNotes);
		
		return box;
	}
	
	/* Fills the fields with the data from an ImageSet and enables/disables the fields */
	/* Feed it the LocalImageSet to update it. */
	
	number updateDialog(object self, TagGroup ImageSet){
		if(debugMode==true){result("\nUpdating image set configuration dialog.");}
		number ImagesTaken, DPsTaken;
		string ImageSetID
		ImageSet.TagGroupGetTagAsNumber("ImagesTaken", ImagesTaken);
		ImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken);
		if(ImagesTaken == 1){
			result("\nAttempted to load Image set " + ImageSetID + " in the configuration dialog, but image set has all ready been taken and cannot be configured.");
			return 0;
		}
		
		// Get the variables...
		number RingMode, NumberOfRingPoints, RingDSpacing, DegreeStep, IntegratedImage, NumberOfIntegrations;
		number AutoSaveNonInt, AutoDisplayNonInt, shadowMode, ShadowDistance, AutoSaveImages, AutoDisplayImages;
		
		// ring mode values
		ImageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		ImageSet.TagGroupGetTagAsNumber("NumberOfRingPoints", NumberOfRingPoints);
		ImageSet.TagGroupGetTagAsNumber("RingDSpacing", RingDSpacing);
		ImageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// integration
		ImageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		ImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		ImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", AutoSaveNonInt);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", AutoDisplayNonInt);
		
		// shadow settings
		ImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		if(ShadowDistance != 0){
			shadowMode = 1;
		} else {
			shadowMode = 0;
		}
		
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages);
		
		string imageSetNameString;
		ImageSet.TagGroupGetTagAsString("SetName", imageSetNameString);
		
		self.SetElementIsEnabled("ImageSetIDField", 0); // this is always auto-generated
		
		if(IntegratedImage==1){ // can always change these values, as it does not affect the others.
			self.SetElementIsEnabled("SaveNonIntImagesCheckBox", 1);
			self.SetElementIsEnabled("DisplayNonIntImagesCheckBox", 1);
			self.SetElementIsEnabled("IntegrationDistanceField", 1);
		} else {
			self.SetElementIsEnabled("SaveNonIntImagesCheckBox", 0);
			self.SetElementIsEnabled("DisplayNonIntImagesCheckBox", 0);
			self.SetElementIsEnabled("IntegrationDistanceField", 0);
		}
		
		if(shadowMode==1 && DPsTaken == 0){
			self.SetElementIsEnabled("ShadowDistanceField", 1);
		} else {
			self.SetElementIsEnabled("ShadowDistanceField", 0);
		}
		
		if(RingMode==1 && DPsTaken == 0){
			self.SetElementIsEnabled("DSpacingField", 1);
			self.SetElementIsEnabled("NumberOfRingPointsLabelField", 1);	
		} else {
			self.SetElementIsEnabled("DSpacingField", 0);
			self.SetElementIsEnabled("NumberOfRingPointsLabelField", 0);
		}
		
		if(DPsTaken == 1){
			if(debugMode==true){result("\nDPs taken, disabling most switches.");}
			self.SetElementIsEnabled("IntegrationModeCheckBox", 0);
			self.SetElementIsEnabled("ShadowModeCheckBox", 0);
			self.SetElementIsEnabled("RingModeCheckBox", 0);
		}
		
	}
	
	/* Called when image set name is changed. This will update the LocalImageSet and then refresh the dialog with it. */
	void changedImageSetName(object self, tagGroup tg){ // tg is the source of the call
		string theValue = tg.DLGGetStringValue();
		LocalImageSet.TagGroupSetTagAsString("SetName", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedIntegrationMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("IntegratedImage", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedIntegrationDistance(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("NumberOfIntegrations", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedSaveNonIntImages(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoSaveNonInt", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedDisplayNonIntImages(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoDisplayNonInt", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedShadowMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		//LocalImageSet.TagGroupSetTagAsNumber("NumberOfIntegrations", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedShadowDistance(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("ShadowDistance", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedRingMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("RingMode", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedDSpacing(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("RingDSpacing", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedNumberOfRingPoints(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("NumberOfRingPoints", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedSaveMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoSaveImages", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedDisplayImagesMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoDisplayImages", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	/* Observes the current image set settings and makes a tag group out of them for future processing. */
	TagGroup generateResultTags(object self){
		TagGroup results = newTagGroup();
		string imageSetNameString
		string ImageSetID
		number IntegratedImage, NumberOfIntegrations, AutoSaveNonInt, AutoDisplayNonInt, shadowMode, ShadowDistance, RingMode, RingDSpacing, NumberOfRingPoints, AutoSaveImages, AutoDisplayImages
		
		self.DLGGetValue("ImageSetNameField", imageSetNameString);
		self.DLGGetValue("ImageSetIDField", ImageSetID);
		self.DLGGetValue("IntegrationModeCheckBox", IntegratedImage);
		self.DLGGetValue("IntegrationDistanceField", NumberOfIntegrations);
		self.DLGGetValue("SaveNonIntImagesCheckBox", AutoSaveNonInt);
		self.DLGGetValue("DisplayNonIntImagesCheckBox", AutoDisplayNonInt);
		self.DLGGetValue("ShadowModeCheckBox", shadowMode);
		self.DLGGetValue("ShadowDistanceField", ShadowDistance);
		self.DLGGetValue("RingModeCheckBox", RingMode);
		self.DLGGetValue("DSpacingField", RingDSpacing);
		self.DLGGetValue("NumberOfRingPointsLabelField", NumberOfRingPoints);
		self.DLGGetValue("SaveModeCheckBox", AutoSaveImages);
		self.DLGGetValue("DisplayImagesModeCheckBox", AutoDisplayImages);
		// notes not finished.
		
		results.TagGroupSetTagAsString("ImageSetNameField", imageSetNameString);
		results.TagGroupSetTagAsString("ImageSetIDField", ImageSetID);
		results.TagGroupSetTagAsNumber("IntegrationModeCheckBox", IntegratedImage);
		results.TagGroupSetTagAsNumber("IntegrationDistanceField", NumberOfIntegrations);
		results.TagGroupSetTagAsNumber("SaveNonIntImagesCheckBox", AutoSaveNonInt);
		results.TagGroupSetTagAsNumber("DisplayNonIntImagesCheckBox", AutoDisplayNonInt);
		results.TagGroupSetTagAsNumber("ShadowModeCheckBox", shadowMode);
		results.TagGroupSetTagAsNumber("ShadowDistanceField", ShadowDistance);
		results.TagGroupSetTagAsNumber("RingModeCheckBox", RingMode);
		results.TagGroupSetTagAsNumber("DSpacingField", RingDSpacing);
		results.TagGroupSetTagAsNumber("NumberOfRingPointsLabelField", NumberOfRingPoints);
		results.TagGroupSetTagAsNumber("SaveModeCheckBox", AutoSaveImages);
		results.TagGroupSetTagAsNumber("DisplayImagesModeCheckBox", AutoDisplayImages);
		
		return results;
	}
	
	/* Create the Dialog. Must be called before showScaleValueDialog. Uses the CreateFields function output */
	void generateDialog(object self){
	TagGroup position;
		position = DLGBuildPositionFromApplication();
		position.TagGroupSetTagAsTagGroup( "Width", DLGBuildAutoSize() );
		position.TagGroupSetTagAsTagGroup( "Height", DLGBuildAutoSize() );
		position.TagGroupSetTagAsTagGroup( "X", DLGBuildRelativePosition( "Inside", 1 ) );
		position.TagGroupSetTagAsTagGroup( "Y", DLGBuildRelativePosition( "Inside", 1 ) );
		self.super.init( self.createFields().dlgposition(position) );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showImageSettingsDialog(object self){
		// The local image set value has been assigned an image set by this point.
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// Function used to summon forth the dialog for external functions. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	// ImageSetID string is either an existing image set or "New" to create a new one.
	number inputNewCalibration(object self, string ImageSetID)
	{
		
		if(debugMode==1){result("\nLoading Image Set: " + ImageSetID);}
		if(ImageSetID == "New"){
			LocalImageSet = GetScriptObjectFromID(ImageSetToolsID).createNewImageSet();
		} else {
			TagGroup OriginalImageSet;
			if( GetScriptObjectFromID(ImageSetToolsID).getImageSetByID(ImageSetID, OriginalImageSet) == 0){
				result("\nImageSetID " + ImageSetID + " was not found while trying to load an existing ImageSet for the InputNewCalibration function.")
				return 0;
			}
			LocalImageSet = TagGroupClone( OriginalImageSet ); // getImageSetByID will point at the set, so a copy is made here to prevent changing the imageSet data prematurely.
		}
		
		if(debugMode==1){result("\nCreating child dialog Object (image set configuration options)");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showImageSettingsDialog();	// Display the child with Pose() system
		if(useValues == 1){
			// save temporary tag groups to the dataObject
			// self.saveToDataObject();
		}
		childDialog = NULL; // NULL the childDialog so it will always go out of scope.
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
