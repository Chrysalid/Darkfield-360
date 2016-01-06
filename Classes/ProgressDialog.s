// ********************************
//	Progress Dialog Class
// ********************************
// Displayed when DP or DF imaging is being performed.
// Calls imaging functions in the Toolkit so they can run in their own thread and be cancelled.
// This current version is not ideal because it does not actively know how complete the process is. I am just trying to get the thread system working at the moment.

class ProgressDialog : uiframe
{
	// Object variables
	Number dataObjectID;
	Number ToolkitID;
	Number DialogID;
	Number ImageSetToolsID;
	Number ImageFunctionsObjectID;
	number debugMode;
	
	// Control signals for the thread
	Object StartSignal;
	Object StopSignal;
	number do_break; // Note: Only the parent object do_break value is used.
	
	number startTick;
	number refreshProgressEvery; // number of seconds between updating the progress bar.
	number currentProgress;
	
	object childDialog; // Store a clone of this dialog here. The clone is what the user will actually interact with so it can be safely closed without the object class going out of scope..

	// Used to post variables into the results window for debugging.
	void printAllValues(object self)
	{
		result("\n\nProgress Bar Dialog Debug Values")
		result("\n--------------------------");
		string textstring;
		textstring = "\n\tObjectID: " + DialogID +\
			"\n DebugMode: " + debugMode +\
			"\n ToolkitID: " + ToolkitID +\
			"\n dataObjectID: " + dataObjectID +\
			"\n imageSetToolsID: " + imageSetToolsID +\
			"\n ImageFunctionsObjectID: " + ImageFunctionsObjectID +\
			"\n do_Break: " + do_Break +\
			"\n currentProgress: " + currentProgress ;
		result(textstring);
		result("\n-------End----------------");
	}
	
	// clears the child dialog from this object's memory.
	void StopChildDialog(object self)
	{
		childDialog = NULL;
	}
	
	// Closes the dialog
	void CloseSelf( object self )
	{
		number version = GetScriptObjectFromID(dataObjectID).getDigitalMicrographVersion();
		
		if(version == 1){
			// This command works in DM v 1.x, but not in v2.x
			self.GetFrameWindow().WindowClose(0);
		} else if(version == 2) {
			// This command works in DMv 2.x but not in v1.x
			self.close();
		} else {
			throw("Error closing progress bar window");
		}
		// remove this object from its parent's memory.
		GetScriptObjectFromID(DialogID).StopChildDialog();
	}
	
	// Forces the object to record the current time.
	void setStartingTick( object self )
	{
		startTick = GetOSTickCount();
	}
	
	void setDoBreak(object self, number theValue)
	{
		do_break = theValue;
	}
	
	number getDoBreak(object self)
	{
		return do_break;
	}
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID, number theImageFunctionsObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		ImageSetToolsID = theImageSetToolsID;
		ImageFunctionsObjectID = theImageFunctionsObjectID;
		refreshProgressEvery = 0.5;
		currentProgress = 0;
		do_break = 0;
	}
	
	void startLoop(object self){
		if(debugMode == true){result("\nAttempting to start imaging process");}
		startsignal=NewSignal(0);
		stopsignal=NewSignal(0);
		self.startthread("ProgressThread");
	}

	// function to set the current progress variable for use by INTERNAL functions.
	void setCurrentProgress(object self, Number percentComplete){
		currentProgress = percentComplete;
	}
	
	// EXTERNAL - This instruction is to be sent to the parent object only.
	// % is 0 to 1.
	// Command is issued to the parent object. It will pass the information down to the Child Dialog without the external function needing its ID.
	void setProgressPercent(object self, number percentComplete)
	{
		// Is parent object, so pass to child.
		if(debugMode == true){
			result("\n\t Progress bar dialog being set to " + (percentComplete * 100) + "%");
		}
		childDialog.setCurrentProgress(percentComplete);
	}
	
	// Function to end the loop for use in INTERNAL processes.
	void stopLoop(object self){
		if(debugMode == true){result("\n Stopping progress bar process");}
		GetScriptObjectFromID(DialogID).setDoBreak(1);
		stopsignal.setsignal();
	}
	
	/* Function activated when pressing the cancel button.
		The dialog is not aware of the ImagingFunctionsObject's class methods, so it cannot stop the loop there.
		However, the ImageFunctionsObject will check with the parent dialog at regular intervals to see if do_break == 1
	*/
	void cancelButtonPress(object self ){
		self.stopLoop();
		if(debugMode == true){result("\n Closing dialog");}
		self.CloseSelf();
	}
	
	// EXTERNAL - This instruction is to be sent to the parent object only.
	// This allows external objects to cancel/close the progress dialog without knowing the child ID.
	void EndProgress( object self ){
		// Is parent, so activate close commands from here.
		childDialog.stopLoop();
		childDialog.CloseSelf();
	}
	
	// Starts a loop that listens for a stop signal and refreshes the progress bar. External functions can set the progress bar and end it with other class methods.
	void ProgressThread (object self){
		// Loop the thread until a stop signal is encountered
		while( true )
		{
			Try 
			{
				// Infinite processing loop which listens for a stop signal
				while(true)
				{
					number CurrentTicks=GetOSTickCount();
					// Listen for a stop signal from the Stop button in the dialog
					// Be careful when using very short waitforstopsignal values <0.02s
					// as thread control may become erratic.

					while(true){ // loop that will listen for stop and update the progress bar
						number waitforstopsignal=0.05 // dwell in seconds
						StartSignal.WaitOnSignal(waitforstopsignal, StopSignal) // wait <interval> second for stop signal
						number NowTicks=GetOSTickCount();
						number ElapsedTime=CalcOSSecondsBetween(CurrentTicks, NowTicks);
						if(ElapsedTime >= refreshProgressEvery){
							self.dlgsetprogress("progbar", currentProgress);
							break;
						}
					} // end update loop
				} // end of processing loop
			} // end of Try code block
			
			Catch // If any exceptions occur or a stop signal is received stop the thread.
			{
				// A break was encountered, set the signal back to its starting point and break out of the Try/Catch loop
				GetScriptObjectFromID(DialogID).setDoBreak(1);
				stopsignal.resetsignal()
				break;
			}
			
			// Stop the thread by breaking out of the function. Otherwise the start signal is reset to keep the thread running
			If(GetScriptObjectFromID(DialogID).getDoBreak() == true){
				break;
			}	
		} // end of final loop
	}
	
	
	//----------------------------------
	//		Dialog Construction
	//----------------------------------
	


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
	
	// The constructor
	ProgressDialog(object self)
	{
		DialogID = self.ScriptObjectGetID(); // This stores the dialog's object ID. This is important because child dialogs will use this ID to interact with this parent object.
	}

	// The destructor (does nothing)
	~ProgressDialog(object self)
	{
		if(debugMode == true){result("\n Progress Dialog with ID: "+self.ScriptObjectGetID()+" closed.");}
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Progress Bar Dialog");}
	}
	
	// Function called by an outside source to make the dialog.
	number makeDialog(object self)
	{
		do_break = 0;
		if(debugMode==1){result("\n\tCreating Progress Bar Dialog child dialog Object");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\n\tGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\n\tShowing child dialog");}
		childDialog.showDialog();	// Display the child dialog
		//childDialog.setProgressPercent(0.5); example of how to set the progress.
		childDialog.startLoop();
		return 1;
	}
}

