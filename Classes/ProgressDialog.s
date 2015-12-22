// ********************************
//	Progress Dialog Class
// ********************************
// Displayed when DP or DF imaging is being performed.

class ProgressDialog : uiframe
{
	// Object variables
	Number dataObjectID;
	Number ToolkitID;
	Number ProgressID;
	number debugMode;
	
	// variable to keep track of when the thread is running and when it is not.
	Number ScanIsOn
	
	// Control signals for the thread
	Object StartSignal
	Object StopSignal
	number do_break
	
	object childDialog; // Store a clone of this dialog here for repeated use.

	// Returns the Alignment Dialog ID to external functions.
	number getProgressDialogID(object self){
		return ProgressID;
	}
	
	void stopLoop(object self){
		result("\nAttempting to stop loop");
		do_break = 1;
	}
	
	// Remove the object references to try make child dialogs drop from scope
	void cleanReferences(object self){
		childDialog = NULL
		StartSignal = NULL
		StopSignal = NULL
	}

	// Sets the progress bar to a given % completeness.
	//	% is 0 to 1.
	void setProgressPercent(object self, number percentComplete)
	{
		self.dlgsetprogress("progbar", percentComplete);
	}
	
	
	//----------------------------------
	//		Dialog Construction
	//----------------------------------
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
	}

	// This function creates the dialog tag group
	taggroup CreateDialogTagGroup(object self)
	{
		TagGroup dialog_items;
		TagGroup dialog = DLGCreateDialog("Imaging Progress", dialog_items);
		
		// the progress bar
		taggroup progbar;
		taggroup progressb=dlgcreateprogressbar("progbar").dlgfill("X");
		dialog_items.dlgaddelement(progressb);
		
		// The cancel button
		TagGroup cancelButton = DLGCreatePushButton("Cancel", "cancelButtonPress").dlgidentifier("cancelButton");
		// dlgidentifier(firstbutton, "first") // identifiers are strings which identify an element, such as a button
		// they are used to change the enabled/disabled status of the element
		dlgenabled(cancelButton, 1); // sets the button as enabled when the dialog is first created
		dialog_items.dlgaddelement(cancelButton);
		
		return dialog;
	}

	/* Create the Dialog. Must be called before showAlignmentDialog. Uses the CreateDialog Tag group output */
	void generateDialog(object self){
		self.super.init( self.CreateDialogTagGroup() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showDialog(object self){

		self.display("Imaging Progress") // display dialog as modeless; the calling script will continue after it has been created
		//return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so any loops etc. must be started before this.
		// In order to make function calls after this we will need a 'start' button on the controls.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	/* Function activated when pressing the cancel button. */
	void cancelButtonPress(object self ){
		Beep();
	}
	
	// The constructor
	ProgressDialog(object self)
	{
		ProgressID = self.ScriptObjectGetID();
	}

	// The destructor (does nothing)
	~ProgressDialog(object self)
	{
		result("\n Progress Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Progress Bar Dialog");}
	}
	
	// Function called by an outside source to make the dialog.
	number makeDialog(object self)
	{
		if(debugMode==1){result("\n\tCreating child dialog Object");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\n\tGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\n\tShowing child dialog");}
		childDialog.showDialog();	// Display the child dialog
		//childDialog.setProgressPercent(0.5); example of how to set the progress.
		return 1;
	}
	
}

