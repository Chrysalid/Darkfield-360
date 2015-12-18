// *******************************
// SHORTCUT KEYS
// *******************************

// Add a key listener to an imagedisplay dervied from
// D. R. G. Mitchell, adminnospam@dmscripting.com (remove the nospam to make this work)
// www.dmscripting.com

/* Functions to print out instructions to the output window. */
void printCommands(){
	result("\n\nShortcut Keys Available:");
	result("\n\t'h' to display these commands again.");
	result("\n\t's' to store a diffraction spot's coordinates.");
	result("\n\t'p' to view the stored image sets.");
	result("\n\t'p' in debug mode to print out a detailed list of debugging information");
	result("\n\t'1' to show the ring marker and measuring system.");
	result("\n\t'2' to move the marker ring to a different D-Spacing.");
	result("\n\t'3' to update the ring-mode radius display.");
	result("\n\t'0' to return the beam to the centre of the screen.");
}

class MyKeyHandler
{
	number KeyToken // the numerical id of the listener - global to the object. Do we use this anyway?
	number dataObjectID; // numerical ID of the dataObject script object.
	number ToolkitID; // ID of the object this keyhandler will be stored inside of
	number ImageSetToolsID; // ID of the imageset tools object
	number debugMode

	// Need undo command?
	
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
			if(keydescription.MatchesKeyDescriptor( "p" )) // PRINT DATA
				{	
					if(debugMode==true){result("\nYou pressed p to examine stored Tilt Values.");}
					if(debugMode!=true){
						GetScriptObjectFromID(ImageSetToolsID).showImageSets();
					} else {
						self.printAllValues();
						GetScriptObjectFromID(ToolkitID).printAllValues();
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
