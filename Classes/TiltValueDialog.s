// ********************************
//	Tilt Calibration Dialog Class
// ********************************
// It is used to enter/display the calibration scale factors and camera length options.

class TiltValueDialog : uiframe
{
	// Global variables
	number scaleValueID; // Used by child dialog to return values to parent.
	object childDialog; // Store a clone of this dialog here for repeated use.
	TagGroup returnedCameraLengths; // Used by child dialog to return values to parent.
	TagGroup returnedCalibrationFactors; // Used by child dialog to return values to parent.
	TagGroup returnedTiltVectorCalibrations; // Used by child dialog to return values to parent.
	tagGroup availableCameraLengths; // used to store initial values.
	tagGroup calibrationValues; // used to store initial values.
	tagGroup tiltCalibrationValues; // used to store initial values.
	number dataObjectID;
	number toolkitID;
	number debugMode;
	number availableValueFields; // stores the number of camera lengths.
	string cameraLength;
	
	// updates the returnedTiltVectorCalibrations taggroup in this object.
	void takeTiltFactors(object self, tagGroup tiltFactorList, string theCameraLength){
		cameraLength = theCameraLength;
		if(returnedTiltVectorCalibrations.TagGroupDoesTagExist(cameraLength)){
			//result("\nExisting CL found and deleted")
			returnedTiltVectorCalibrations.taggroupdeletetagwithlabel(cameraLength); // delete existing values.
		}
		returnedTiltVectorCalibrations.TagGroupCreateNewLabeledTag(cameraLength); // create value
		returnedTiltVectorCalibrations.TagGroupSetTagAsTagGroup(cameraLength, tiltFactorList); // update tilt values
		//TagGroupOpenBrowserWindow(returnedTiltVectorCalibrations,0);
	}

	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		availableValueFields = 5; // Number of camera lengths available
		returnedCameraLengths =  GetScriptObjectFromID(dataObjectID).getAvailableCameraLengths();
		availableCameraLengths =  GetScriptObjectFromID(dataObjectID).getAvailableCameraLengths();
		returnedCalibrationFactors = GetScriptObjectFromID(dataObjectID).getScaleCalibrationTable();
		calibrationValues = GetScriptObjectFromID(dataObjectID).getScaleCalibrationTable();
		returnedTiltVectorCalibrations = GetScriptObjectFromID(dataObjectID).getTiltVectorCalibrations();
		tiltCalibrationValues = GetScriptObjectFromID(dataObjectID).getTiltVectorCalibrations();
		
	}
	
	/* Function to create the dialog (minus the OK/Cancel buttons) */
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for tilt calibration dialog.");}
		taggroup box_items;
		taggroup box=dlgcreatebox("Configure Tilts", box_items);
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5);
		
		//TagGroupOpenBrowserWindow(availableCameraLengths,0);
		//TagGroupOpenBrowserWindow(calibrationValues,0);
		//TagGroupOpenBrowserWindow(tiltCalibrationValues,0);
		number totalCameraLengths = TagGroupCountTags(availableCameraLengths);
		
		if(debugMode==1){result("\n\tPopulating drop down dialog...");}
		TagGroup dropDownList;
		TagGroup dropDown = DLGCreatePopup( dropDownList, 1, "changeCL" ).dlgidentifier("cameraLengthDropDown");
		
		number i;
		for(i=0; i < availableValueFields; i++){
			string theLabel;
			if( availableCameraLengths.TagGroupGetIndexedTagAsString(i, theLabel) ){
				DLGAddPopupItemEntry( dropDownList, theLabel );
			}
		}
		taggroup dropDownGroup = dlggroupitems(DLGCreateLabel("Select Camera Length:"), dropDown).dlgtablelayout(2,1,0);
		if(debugMode==1){result(" done.");}
		
		string theLabel, thePath;
		number theValue;
		availableCameraLengths.TagGroupGetIndexedTagAsString(0, theLabel);
		thePath = theLabel + ":xTiltx";
		result("\nTheLabel: " + theLabel);
		result("\nThePath: " + thePath);
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		result("\nTheValue: " + theValue);
		tagGroup value0Label = DLGCreateLabel("X Pixels per X-Tilt:");
		tagGroup value0Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("xTiltxField");
		taggroup value0Fields = dlggroupitems(value0Label, value0Factor).dlgtablelayout(2,1,0);

		thePath = theLabel + ":xTilty";
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		tagGroup value1Label = DLGCreateLabel("Y Pixels per X-Tilt:");
		tagGroup value1Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("xTiltyField");
		taggroup value1Fields = dlggroupitems(value1Label, value1Factor).dlgtablelayout(2,1,0);
		
		thePath = theLabel + ":yTiltx";
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		tagGroup value2Label = DLGCreateLabel("X Pixels per Y-Tilt:");
		tagGroup value2Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("yTiltxField");
		taggroup value2Fields = dlggroupitems(value2Label, value2Factor).dlgtablelayout(2,1,0);
		
		thePath = theLabel + ":yTilty";
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		tagGroup value3Label = DLGCreateLabel("Y Pixels per Y-Tilt:");
		tagGroup value3Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("yTiltyField");
		taggroup value3Fields = dlggroupitems(value3Label, value3Factor).dlgtablelayout(2,1,0);
		
		if(debugMode==1){result("\n\tGrouping tilt values");}
		box_items.DLGAddElement(dropDownGroup);
		box_items.DLGAddElement(value0Fields);
		box_items.DLGAddElement(value1Fields);
		box_items.DLGAddElement(value2Fields);
		box_items.DLGAddElement(value3Fields);
		
		if(debugMode==1){result("\n\tReturning tag group for tilt calibration dialog.");}
		return box
	}
	
	/* Function to create the new tag lists from the field values and uploadthem to the parent dialog. */
	number uploadFields(object self){
		if(debugMode==1){result("\n\tCreating new tilt value table");}

		string thisCameraLength
		number option;
		self.DLGGetValue("cameraLengthDropDown", option);
		returnedCameraLengths.TagGroupGetIndexedTagAsString((option-1), thisCameraLength);

		TagGroup diffractionData = NewTagGroup();
		number theFactor
		string theLabel
		
		theLabel = "xTiltx";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		theLabel = "xTilty";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		theLabel = "yTiltx";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		theLabel = "yTilty";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		
		if(debugMode==1){result(" Done.");}
		// push to parent dialog.
		//TagGroupOpenBrowserWindow(diffractionData,0);
		GetScriptObjectFromID(scaleValueID).takeTiltFactors(diffractionData, thisCameraLength);
	}
	
	
	/* Function to save temporary tag groups to dataObject */
	void saveToDataObject(object self){
		if(debugMode==1){result("\n\tSaving new values to dataObject...");}
		GetScriptObjectFromID(dataObjectID).setTiltVectorCalibrations(returnedTiltVectorCalibrations);
		if(debugMode==1){result("\nSaving Complete.");}
	}
	
	
	/* Create the Dialog. Must be called before showScaleValueDialog. Uses the CreateFields function output */
	void generateDialog(object self){
		self.super.init( self.createFields() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showCalibrationDialog(object self){
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// Function used to summon forth the calibration dialog. Dialog is Modal.
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
	TiltValueDialog(object self)
	{
		scaleValueID = self.ScriptObjectGetID();
	}
	
	// The destructor (does nothing)
	~TiltValueDialog(object self)
	{
		result("\nTilt Calibration Dialog with ID: " + self.ScriptObjectGetID() + " closed.");
	}
		
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Tilt Calibration Dialog");}
	}
	
	void changeCL (object self, tagGroup tg){ //Change method detects when a CL is changed on the drop down menu
		number dropValue = tg.dlggetvalue();
		number theValue; // will hold the tilt value to load
		string thePath, thisCameraLength; // will hold the label for referencing values
		returnedCameraLengths.TagGroupGetIndexedTagAsString((dropValue-1), thisCameraLength);
		
		thePath = thisCameraLength + ":xTiltx";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("xTiltxField").DLGValue(theValue);
		
		thePath = thisCameraLength + ":xTilty";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("xTiltyField").DLGValue(theValue);
		
		thePath = thisCameraLength + ":yTiltx";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("yTiltxField").DLGValue(theValue);

		thePath = thisCameraLength + ":yTilty";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("yTiltyField").DLGValue(theValue);
	}
	
	void changedValue(object self, tagGroup tg){ //Change method detects when a calibration factor is changed. tg is the source of the call
		self.uploadFields();
	}
}


