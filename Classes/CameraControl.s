// ********************************************************************************
//  Class with Imaging controls.
// ********************************************************************************
// Taking this outside of Toolkit because it is getting crowded.
// Insert this class before the toolkit.
// Does NOT include image processing and offline functions.
// This class is only for online camera use, and should not be called by offline functions.

class CameraControl
{
	number CameraControlID; // the ID of this object
	number ToolkitID; // the ID of the toolkit
	number dataObjectID;
	number imageSetToolsID;

	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image. Is 0 or 1.
	number debugMode;
	
	number cameraWidth, cameraHeight;
	number binningMultiplier;
	number DFExposure; // # of seconds to expose the camera for taking DarkField images.
	number DPExposure; // # of seconds to expose the camera for taking Diffraction Pattern images.
	number BFExposure; // # of seconds to expose the camera for taking BrightField images.
	
	TagGroup ImagingModes; // Taglist of the names used for imaging modes
	TagGroup DiffractionModes;// Taglist of names used for diffraction modes

	// Function to print out the various saved variables for debugging
	void printAllValues(object self)
	{
		result("\n\nCamera Control Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + CameraControlID +\
			"\n DebugMode: " + debugMode +\
			"\n EMonline: " + EMOnline +\
			"\n AllowControl: " + AllowControl +\
			"\n dataObjectID: " + dataObjectID +\
			"\n imageSetToolsID: " + imageSetToolsID +\
			"\n cameraWidth: " + cameraWidth +\
			"\n cameraHeight: " + cameraHeight +\
			"\n binningMultiplier: " + binningMultiplier +\
			"\n DFExposure: " + DFExposure +\
			"\n DPExposure: " + DPExposure +\
			"\n BFExposure: " + BFExposure +\
			"\n Imaging Modes saved: " + ImagingModes.TagGroupCountTags() +\
			"\n Diffraction Modes saved: " + DiffractionModes.TagGroupCountTags();
		result(textstring);
		result("\n-------End----------------");
	}
	// Check if the microscope is online and if there is a Live View Image
	void updateEMstatus(object self)
	{
		EMOnline = EMIsReady();
		if(!EMOnline){
			AllowControl = 0;
		} else {
			image viewImage
			if(!returnViewImage(debugMode, viewImage)){
				AllowControl = 0; //No View image, so no live camera control yet.
			} else {
				AllowControl = 1; // View window and microscope detected.
			}
		}
	}
	
	
	// Returns 1 if the microscope is in imaging mode. 0 could mean anything.
	number isImagingMode(object self)
	{
		string opticsMode = EMGetImagingOpticsMode();
		number totalModes = ImagingModes.TagGroupCountTags();
		number i;
		for(i=0; i < totalModes; i++){
			string possibleMode;
			ImagingModes.TagGroupGetIndexedTagAsString(i, possibleMode);
			if( opticsMode == possibleMode ){
				return 1;
			}
		}
		return 0;
	}
	
	// Returns 1 if the microscope is in diffraction mode. 0 could mean anything.
	number isDiffractionMode(object self)
	{
		string opticsMode = EMGetImagingOpticsMode();
		number totalModes = DiffractionModes.TagGroupCountTags();
		number i;
		for(i=0; i < totalModes; i++){
			string possibleMode;
			DiffractionModes.TagGroupGetIndexedTagAsString(i, possibleMode);
			if( opticsMode == possibleMode ){
				return 1;
			}
		}
		return 0;
	}
	
	
	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID){
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		imageSetToolsID = theImageSetToolsID;
		
		self.updateEMstatus(); // set the AllowControl variable asap.
		
		DFExposure = GetScriptObjectFromID(dataObjectID).getDFExposure(); // # of seconds to expose the camera for taking DarkField images.
		DPExposure = GetScriptObjectFromID(dataObjectID).getDPExposure(); // # of seconds to expose the camera for taking Diffraction Pattern images.
		BFExposure = GetScriptObjectFromID(dataObjectID).getBFExposure(); // # of seconds to expose the camera for taking BrightField images.

		// Default starting values for the different imaging modes. A way to edit these can be added later.
		DiffractionModes = GetScriptObjectFromID(dataObjectID).getDiffractionModes();
		ImagingModes = GetScriptObjectFromID(dataObjectID).getImagingModes();		
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Camera Control Object");}
	}
	
	// External functions can call this to see if they can use the microscope.
	number getAllowControl(object self)
	{
		return AllowControl;
	}

	// Finds the camera width, height and binning multiplier. Should only run if camera is confirmed to exist.
	// Returns 1/0 on success/failure
	number storeCameraDetails(object self)
	{
		self.updateEMstatus();
		if(AllowControl == 0){
			result("\nLive Image not found. Camera details not stored.")
			return 0;
		}
		
		sscgetsize(cameraWidth, cameraHeight); // Get camera resolution
		if(debugMode==1){result("\nCamera Resolution set to " + cameraWidth + " x " + cameraHeight);}
		image ReferenceDP := sscUnprocessedAcquire(0.1,0,0,cameraWidth,cameraHeight);
		if(debugMode){result("\n\tReference exposure created");}
		GetScriptObjectFromID(dataObjectID).setReferenceDP(ReferenceDP);
		if(debugMode){result("\n\tReference exposure added to toolkit data store.");}
		
		// Find binning by comparing raw camera width with view window width
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo View Image detected when capturing Live View Window.")
			return 0;
		}
		number viewWidth, viewHeight;
		getSize(viewImage, viewWidth, viewHeight);
		binningMultiplier = cameraWidth / viewWidth;
		if(binningMultiplier < 1){
			result("\nBinning Multiplier found to be out of range (<1). Setting multiplier to 1.")
			binningMultiplier = 1;
		}
		if(debugMode==true){result("\n\tThe binning multiplier has been set to " + binningMultiplier);}
		
		return 1;
	}
	
	number getCameraWidth(object self) {
		return cameraWidth;
	}
	void setCameraWidth(object self, number newValue) {
		cameraWidth = newValue;
	}
	
	number getCameraHeight(object self) {
		return cameraHeight;
	}
	void setCameraHeight(object self, number newValue) {
		cameraHeight = newValue;
	}

	number getDFExposure(object self) {
		return DFExposure;
	}
	void setDFExposure(object self, number newValue) {
		DFExposure = newValue;
		GetScriptObjectFromID(dataObjectID).setDFExposure(newValue);
	}

	number getBFExposure(object self) {
		return BFExposure;
	}
	void setBFExposure(object self, number newValue) {
		BFExposure = newValue;
		GetScriptObjectFromID(dataObjectID).setBFExposure(newValue);
	}

	number getDPExposure(object self) {
		return DPExposure;
	}
	void setDPExposure(object self, number newValue) {
		DPExposure = newValue;
		GetScriptObjectFromID(dataObjectID).setDPExposure(newValue);
	}

	number getBinningMultiplier(object self){
		return binningMultiplier;
	}

	/* Function to get VIEW image xscale despite the mis-calibration of our 2100 */
	number getViewScale(object self){
		number xscale=1;
		xscale = binningMultiplier * GetScriptObjectFromID(dataObjectID).getRefScale();
		return xscale;
	}
	
	/* Function to centre beam */
	void beamCentre(object self){
		if(self.getAllowControl() == true){
			number centreXTilt = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
			number centreYTilt = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
			moveBeamTilt ( centreXTilt, centreYTilt );
		}
	}	
	
	// constructor
	CameraControl(object self){
		CameraControlID = self.ScriptObjectGetID();
	}
	
	// destructor
	~CameraControl(object self){
		if(debugMode == 1){result("\nCameraControl object deleted.");}
	}
}

