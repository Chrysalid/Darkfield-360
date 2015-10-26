// *******************************
// SHORTCUT KEYS
// *******************************

// Add a key listener to an imagedisplay dervied from
// D. R. G. Mitchell, adminnospam@dmscripting.com (remove the nospam to make this work)
// www.dmscripting.com


class MyKeyHandler
{
	number KeyToken // the numerical id of the listener - global to the object. Do we use this anyway?
	number dataObjectID; // numerical ID of the dataObject script object.
	number ToolkitID; // ID of the object this keyhandler will be stored inside of
	number ImageSetToolsID; // ID of the imageset tools object
	number toggle; // Variable
	/* Global Values for the object to reference in function calls */
	image targetArrayImage, referenceDP;
	imageDocument viewWindowDocument;
	number tracker, debugMode, DFExposure, DPExposure, BFExposure, numberOfPoints, takeAdditionalPoints;
	component markerRing, ringRadiusText;
	// object dataObject; Depreciated. We need to store a WEAK reference to the data object here and then put the key handler INSIDE the data object

	// Function to print out the various saved variables for debugging
	void printAllValues(object self)
	{
		result("\n\nKeyhandler Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tKeyToken: " + keyToken +\
			"\nDebugMode: " + debugMode +\
			"\nDataObjectID: " + DataObjectID + " and " + (GetScriptObjectFromID(dataObjectID).ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\nToolkitID: " + ToolkitID + " and " + (GetScriptObjectFromID(ToolkitID).ScriptObjectIsValid() ? "is" : "is not") +" valid";
		result(textstring);
		result("\n-------End----------------")
	}
	
	/* Function to load the data from the dataObject. It's ID must have all ready been assigned.
		We do NOT store the dataObject itself here, because the dataObject and the Keyhandler are inside the Toolkit object.
	*/
	number loadData(object self) {
		object dataObject = GetScriptObjectFromID(dataObjectID);
		toggle = dataObject.getToggle();
		targetArrayImage = dataObject.getDataArray();
		referenceDP = dataObject.getReferenceDP();
		tracker = dataObject.getTracker();
		DFExposure = dataObject.getDFExposure();
		DPExposure = dataObject.getDPExposure();
		BFExposure = dataObject.getBFExposure();
		markerRing = dataObject.getMarkerRing();
		ringRadiusText = dataObject.getRingRadiusText();
		ImageDocument viewWindowDocument;
		if(!returnViewImageDocument(debugMode, viewWindowDocument)){
			result("No View Window detected.")
			exit(0);
		}
		if(debugMode==1){result("\n\tKeyListener: Data Loaded.");}
		
		return 0;
	}
	
	/* Function stores the dataObject's ID so it can reference itself later. */
	image initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID)
	{
			ToolkitID = theToolkitID;  // the ID of the Object which this entire handler is contained inside.
			dataObjectID = theDataObjectID;
			ImageSetToolsID = theImageSetToolsID;
	}
	/* Function stores the ID of a key listener and loads the dataObject's values into itself */
	image startListening(object self, number KeyTok)
	{
			KeyToken = KeyTok; // the ID of the 'listener' that this handler is now being attached to.
			self.loadData(); // Load all that data
	}
	
	/* Function to dettach keylistner from the display  */
	image stopListening(object self, imageDisplay imgdisp)
	{
		imgdisp.imagedisplayremovekeyhandler(KeyToken);	
	}
	
		
	/* Function called when the key press event is detected. 
		Note: This cannot refer to Toolkit methods because they are not yet defined.
	*/
	number HandleKey(object self, imagedisplay imgdisp, object keydescription)
		{
			object dataObject = GetScriptObjectFromID(dataObjectID);
				//string validstring = dataObject.ScriptObjectIsValid() ? "is" : "is not";
				//if(debugMode==true){result("\n\tKeyListener: dataObject " + validstring + " present.");}
			object Toolkit = GetScriptObjectFromID(ToolkitID);
				//validstring = Toolkit.ScriptObjectIsValid() ? "is" : "is not";
				//if(debugMode==true){result("\n\tKeyListener: Toolkit " + validstring + " present.");}
			if(keydescription.MatchesKeyDescriptor( "s" )) // STORE POINT
				{
					if(debugMode==true){result("\nYou pressed s to store this tilt.");}
					if(dataObject.getTracker()<1){ //The first tiltStore needs to make the reference image as well.
						result("\nData NOT stored. Please Calibrate the system first.")
					} else {
						Toolkit.storeTiltCoord (0, 0);
					}
				}
			if(keydescription.MatchesKeyDescriptor( "0" )) // CENTRE BEAM
				{
					if(debugMode==true){result("\nYou pressed 0 to centralize the beam.");}
					// Centralize Beam
					Toolkit.beamCentre();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "r" )) // RESET DATA
				{	
					if(debugMode==true){result("\nYou pressed r to reset the stored Tilt Values.");}
					if(OkCancelDialog("Delete stored target coordinates?")){
						// Centre beam.
						Toolkit.beamCentre();
						if(debugMode==1){result("\nBeam centered");}
						dataObject.resetTiltStore();
					}
				}
			if(keydescription.MatchesKeyDescriptor( "p" )) // PRINT SPOTID ARRAY
				{	
					if(debugMode==true){result("\nYou pressed p to print the stored Tilt Values.");}
					if(debugMode!=true){
						dataObject.printSpotIDArray();
					} else {
						dataObject.printSpotIDArray (100);
						result(dataObject.printAllValues());
						self.printAllValues();
						dataObject.showDataTagGroup(3);
						GetScriptObjectFromID(ImageSetToolsID).showImageSets();
					}
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "1" )) // TOGGLE MARKER RING
				{	
					// Make the Marker Ring and radius display visible/hidden;
					Toolkit.toggleMarkerRing();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "2" )) // SET RING TO TARGET RADIUS IN 1/NM UNITS
				{
					number desiredRadiusNM;
					getNumber("Set Marker Ring to (1/nm): ", 2.00, desiredRadiusNM);
					Toolkit.setRingRadius(desiredRadiusNM);
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "3" )) // UPDATE RADIUS MEASUREMENT TEXT
				{
					Toolkit.updateRadius();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "h" )) // HELP
				{
					printGreeting();
					printCommands();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "t" )) // TOGGLE SWITCH
				{
					dataObject.setToggle();
					toggle = dataObject.getToggle();
					return toggle;
				}
			return 0;
		}
	// Constructor - does nothing here except report in the Results window
	Mykeyhandler(object self)
		{
			result("\nKey Handler with ID " + self.ScriptObjectGetID() + " created. Still needs to be attached to a DisplayImage in order to function.");
		}
	// Function called on any destruction event.
	~Mykeyhandler(object self)
		{
			result("\nKey Handler with ID " + self.ScriptObjectGetID() + " Destroyed. Shortcut keys will not function.")
		}
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in KeyListener");}
	}
}
