// ********************************
//	Imaging Configuration Dialog
// ********************************
// When creating a new image set and preparing to take darkfield images this dialog can be used to select the image set settings.
// Not used to process or view completed image sets, which will have to show images and things.
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
		if(debugMode == true){
			result("\n Image Configuration from a child object has been handed to the parent object. Stored in returnedSettings");
		}
		returnedSettings = settingsGroup;
	}
	
	// Uses the LocalImageSet with the Image Tool function addImageSet().
	// The Image Tool function decides what to do with the data, so it does not matter to the Image Config function what Tag group is sent forwards.
	void addImageSetToImageList(object self){
		if(debugMode == true){
			result("\n The stored imageConfig settings will now be used to update/create an ImageSet");
		}
		GetScriptObjectFromID(ImageSetToolsID).addImageSet(returnedSettings);
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
		string imageSetNameString, imageSetID, imageSetNotes;
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
		LocalImageSet.TagGroupGetTagAsNumber("ShadowMode", ShadowMode);
		LocalImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		
		// save image settings
		LocalImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages);
		LocalImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages);
		LocalImageSet.TagGroupGetTagAsString("SetName", imageSetNameString);
		LocalImageSet.TagGroupGetTagAsString("ImageSetID", imageSetID);
		LocalImageSet.TagGroupGetTagAsString("ImageNotes", imageSetNotes);
		
		number ImagesTaken, DPsTaken;
		LocalImageSet.TagGroupGetTagAsNumber("ImagesTaken", ImagesTaken);
		LocalImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken);
		
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
		TagGroup FileArea = dlggroupitems(autoSaveMode, displayImagesMode).dlgtablelayout(1,2,0);
 
		TagGroup ImageNotes = DLGCreateStringField( imageSetNotes, 20, "changedImageSetNotes" ).dlgidentifier("ImageNotesTextBox");
		
		box_items.DLGAddElement(ImageSetTitle);
		box_items.DLGAddElement(IntegrationArea);
		box_items.DLGAddElement(ShadowArea);
		box_items.DLGAddElement(RingArea);
		box_items.DLGAddElement(FileArea);
		box_items.DLGAddElement(ImageNotes);
	
		// Enable / Disable inputs based on image set values. Taken from updateDialog() function.
		
		// use self.LookUpElement("StopButton").DLGEnabled(0)
		
		ImageSetIDField.DLGEnabled(0); // this is always auto-generated
		
		if(IntegratedImage==1){ // can always change these values, as it does not affect the others.
			SaveNonInt.DLGEnabled(1);
			DisplayNonInt.DLGEnabled(1);
			IntegrationNumber.DLGEnabled(1);
		} else {
			SaveNonInt.DLGEnabled(0);
			DisplayNonInt.DLGEnabled(0);
			IntegrationNumber.DLGEnabled(0);
		}
		
		if(shadowMode==1 && DPsTaken == 0){
			ShadowDistanceField.DLGEnabled(1);
		} else {
			ShadowDistanceField.DLGEnabled(0);
		}
		
		if(RingMode==1 && DPsTaken == 0){
			DSpacingField.DLGEnabled(1);
			NumberOfRingPointsLabelField.DLGEnabled(1);	
		} else {
			DSpacingField.DLGEnabled(0);
			NumberOfRingPointsLabelField.DLGEnabled(0);
		}
		
		if(DPsTaken == 1){
			if(debugMode==true){result("\nDPs taken, disabling most switches.");}
			IntegrationMode.DLGEnabled(0);
			ShadowState.DLGEnabled(0);
			RingState.DLGEnabled(0);
		}

	
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
		ImageSet.TagGroupGetTagAsNumber("ShadowMode", ShadowMode);
		
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages);
		
		string imageSetNameString, imageSetNotes;
		ImageSet.TagGroupGetTagAsString("SetName", imageSetNameString);
		ImageSet.TagGroupGetTagAsString("ImageNotes", imageSetNotes);
		
		self.SetElementIsEnabled("ImageSetIDField", 0); // this is always auto-generated
		self.SetElementIsEnabled("ImageNotesTextBox", 1); // this is always available for editing.
		
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
		GetScriptObjectFromID(imageConfigurationID).takeImageConfiguration(LocalImageSet); // send changes to the parent object to be remembered.
		
	}
	
	/* Called when image set name is changed. This will update the LocalImageSet and then refresh the dialog with it. */
	void changedImageSetName(object self, tagGroup tg){ // tg is the source of the call
		string theValue = tg.DLGGetStringValue();
		LocalImageSet.TagGroupSetTagAsString("SetName", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedImageSetNotes(object self, tagGroup tg){ // tg is the source of the call
		string theValue = tg.DLGGetStringValue();
		LocalImageSet.TagGroupSetTagAsString("ImageNotes", theValue);
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
		LocalImageSet.TagGroupSetTagAsNumber("ShadowMode", theValue);
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
		if(useValues == true){
		
		}
		childDialog = NULL; // NULL the childDialog so it will always go out of scope.
		return useValues; // Note, the image set from the childdialog will be stored in returnedSettings. It will either be an updated one, a new one or maybe nothing.
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
