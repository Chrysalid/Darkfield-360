// ********************************
//	Imaging Configuration Dialog
// ********************************


class ImageConfiguration : uiframe
{
	// Global variables
	number imageConfigurationID; // Used by child dialog to return values to parent.
	object childDialog; // Store a clone of this dialog here for repeated use.
	TagGroup returnedSettings; // Used by child dialog to return values to parent.
	number dataObjectID;
	number toolkitID;
	number debugMode;
	
	void takeImageConfiguration(object self, tagGroup settingsGroup){ // updates the returnedSettings object
		returnedSettings = settingsGroup;
	}
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
	}
	
	/* Function to create the dialog (minus the OK/Cancel buttons) */
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for ImageSet Config dialog.");}
		taggroup box_items
		taggroup box=dlgcreatebox("Configure Scale Factors", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		string imageSetNameString; // set this
		string imageSetID; // set this
		number integrationState; //0/1
		number integrationDistance;
		number saveNonIntImages;
		number displayNonIntImages;
		number shadowState;
		number shadowDistance;
		number ringState;
		number DSpacing;
		number numberOfRingPoints;
		number autoSaveState;
		
		TagGroup ImageSetNameLabel = DLGCreateLabel("Image Set Name: ");
		TagGroup ImageSetNameField = DLGCreateStringField(imageSetNameString, 20, "changedImageSetName" ).dlgidentifier("ImageSetNameField");		
		TagGroup ImageSetIDLabel = DLGCreateLabel("Image Set ID: ");
		TagGroup ImageSetIDField = DLGCreateStringField(imageSetID, 20).dlgidentifier("ImageSetIDField");
		taggroup ImageSetTitle = dlggroupitems(ImageSetNameLabel, ImageSetNameField, ImageSetIDLabel, ImageSetIDField ).dlgtablelayout(4,1,0);
		
		// Integration Mode
		TagGroup IntegrationLabel = DLGCreateLabel("Integration Title");
		TagGroup IntegrationMode = DLGCreateCheckBox( "Integrated Images", integrationState, "changedIntegrationMode" )dlgidentifier("IntegrationModeCheckBox");
		TagGroup IntegrationDistanceLabel = DLGCreateLabel("# of images per integration:")
		TagGroup IntegrationNumber = DLGCreateIntegerField(  integrationDistance, 10, "changedIntegrationDistance" )dlgidentifier("IntegrationDistanceField");
		TagGroup SaveNonInt = DLGCreateCheckBox( "Save Non-Integrated Images", saveNonIntImages, "changedSaveNonIntImages" )dlgidentifier("SaveNonIntImagesCheckBox");
		TagGroup DisplayNonInt = DLGCreateCheckBox( "Display Non-Integrated Images", displayNonIntImages, "changedDisplayNonIntImages" )dlgidentifier("DisplayNonIntImagesCheckBox");
		
		// Shadow Mode
		TagGroup ShadowLabel = DLGCreateLabel("Shadowing Title");
		TagGroup ShadowMode = DLGCreateCheckBox( "Shadow Images", shadowState, "changedShadowMode" )dlgidentifier("ShadowModeCheckBox");
		TagGroup ShadowDistanceLabel = DLGCreateLabel("Shadow Distance (1/nm):")
		TagGroup ShadowDistanceField = DLGCreateRealField(  shadowDistance, 10, "changedShadowDistance" )dlgidentifier("ShadowDistanceField");
		
		// Ring Mode
		TagGroup RingLabel = DLGCreateLabel("Ring Title");
		TagGroup RingMode = DLGCreateCheckBox( "Ring Mode", ringState, "changedRingMode" )dlgidentifier("RingModeCheckBox");
		TagGroup DSpacingLabel = DLGCreateLabel("DSpacing (Angstroms):")
		TagGroup DSpacingField = DLGCreateRealField(  DSpacing, 10, "changedDSpacing" )dlgidentifier("DSpacingField");
		TagGroup NumberOfRingPointsLabel = DLGCreateLabel("# of spots to image:")
		TagGroup NumberOfRingPointsLabelField = DLGCreateIntegerField(  numberOfRingPoints, 10, "changedNumberOfRingPoints" )dlgidentifier("NumberOfRingPointsLabelField");
		
		// Save/Display General
		TagGroup autoSaveMode = DLGCreateCheckBox( "Auto-Save Images", autoSaveState, "changedSaveMode" )dlgidentifier("SaveModeCheckBox");
		TagGroup displayImagesMode = DLGCreateCheckBox( "Display Images", displayImagesState, "changedDisplayImagesMode" )dlgidentifier("DisplayImagesModeCheckBox");
		
		if(debugMode==1){result("\n\tPopulating fields for calibration dialog.");}
		string theLabel;
		availableCameraLengths.TagGroupGetIndexedTagAsString(0, theLabel);
		number theFactor;
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value0Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value0Label");
		tagGroup value0Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value0Factor");
		taggroup value0Fields = dlggroupitems(value0Label, value0Factor).dlgtablelayout(2,1,0);

		availableCameraLengths.TagGroupGetIndexedTagAsString(1, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value1Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value1Label");
		tagGroup value1Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value1Factor");
		taggroup value1Fields = dlggroupitems(value1Label, value1Factor).dlgtablelayout(2,1,0);
		
		availableCameraLengths.TagGroupGetIndexedTagAsString(2, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value2Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value2Label");
		tagGroup value2Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value2Factor");
		taggroup value2Fields = dlggroupitems(value2Label, value2Factor).dlgtablelayout(2,1,0);
		
		availableCameraLengths.TagGroupGetIndexedTagAsString(3, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value3Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value3Label");
		tagGroup value3Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value3Factor");
		taggroup value3Fields = dlggroupitems(value3Label, value3Factor).dlgtablelayout(2,1,0);
		
		availableCameraLengths.TagGroupGetIndexedTagAsString(4, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value4Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value4Label");
		tagGroup value4Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value4Factor");
		taggroup value4Fields = dlggroupitems(value4Label, value4Factor).dlgtablelayout(2,1,0);
		
		/* tiltCalibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup tilt0Label = DLGCreateLabel( "X Pixels Per X Tilt:" );
		tagGroup tilt0Value = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value0Factor");
		taggroup tilt0Fields = dlggroupitems(value0Label, value0Factor).dlgtablelayout(2,1,0); */
		
		
		if(debugMode==1){result("\n\tGrouping Camera Lengths and scale calibrations...");}
		box_items.DLGAddElement(dlgcreatelabel("Camera Lengths and Scale Factors"));
		box_items.DLGAddElement(value0Fields);
		box_items.DLGAddElement(value1Fields);
		box_items.DLGAddElement(value2Fields);
		box_items.DLGAddElement(value3Fields);
		box_items.DLGAddElement(value4Fields);		
		
		if(debugMode==1){result("\n\tReturning tag group for calibration dialog.");}
		return box
	}
	
	/* Function to create the new tag lists from the field values and uploadthem to the parent dialog. */
	number uploadFields(object self){
		if(debugMode==1){result("\n\tCreating new CL value table...");}
		TagGroup CLValues = NewTagList();
		string value;
		self.DLGGetValue("value0Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value1Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value2Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value3Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value4Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		if(debugMode==1){result(" Done.");}
		// push to parent dialog.
		GetScriptObjectFromID(scaleValueID).takeCameraLengths(CLValues);
		
		if(debugMode==1){result("\n\tCreating new default calibration table values");}
		TagGroup diffractionData = NewTagGroup();
		string theLabel
		number theFactor
		self.DLGGetValue("value0Label", theLabel );
		self.DLGGetValue("value0Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value1Label", theLabel );
		self.DLGGetValue("value1Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value2Label", theLabel );
		self.DLGGetValue("value2Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value3Label", theLabel );
		self.DLGGetValue("value3Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value4Label", theLabel );
		self.DLGGetValue("value4Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		if(debugMode==1){result(" Done.");}
		// push to parent dialog.
		GetScriptObjectFromID(scaleValueID).takeCalibrationFactors(diffractionData);	
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
		if(debugMode==1){result("\nCreating child dialog Object (calibration options)");}
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
	ScaleValueDialog(object self)
	{
		scaleValueID = self.ScriptObjectGetID();
	}
	
	// The destructor (does nothing)
	~ScaleValueDialog(object self)
	{
		result("\nScale Calibration Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}
		
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Scale Calibration Dialog");}
	}
	
	void changedLabel(object self, tagGroup tg){ //Change method detects when a CL label is changed. tg is the source of the call
		//string value=tg.dlggetvalue()
		// create the camera length and calibration tables whenever there is a change and upload them to the parent dialog.
		self.uploadFields();
	}
	
	void changedValue(object self, tagGroup tg){ //Change method detects when a calibration factor is changed. tg is the source of the call
		// number value=tg.dlggetvalue()
		// create the camera length and calibration tables whenever there is a change and upload them to the parent dialog.
		self.uploadFields();
	}
}
