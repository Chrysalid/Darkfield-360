// **********************
//   Data Object Class
// **********************

// The dataObject contains variables that are used by other objects.
// Holds the toolkit settings.
// This is always available, even in offline systems, so it does not rely on the Camera module for resolution information.
// Performs a variety of calculations for tilt control and image processing.
// Loads and saves persistent tags, but not for the individual image sets or images.

class MyDataObject	
{
	number dataObjectID;
	number KeyListenerID;
	number imageAlignmentDialogID;
	number ToolkitID; // DataObject will be kept inside this object
	
	number toggle; // Variable available to all functions to act as an on / off value.
	image dataArray; // Array of values that are stored for future reference.
	image referenceDP; // A Diff. Pattern taken with the beam centred.
	image ROIList; // A list of ROI IDs (Row 0) and ROI index numbers (Row 1) so I can keep their order and name them properly.
	number tracker; // A variable to keep track of the number of stored data points
	number spotTracker; // A variable to keep track of the spot number. A spot can have several images making it up through shadowing and integration.
	number ROITracker; // A variable to keep track of which ROI a user looked at last.
	number ringMarkerColourTracker; // Variable to remember which colour marker rings have all ready been used.
	number debugMode; // Set to 1 to prevent image saving and provide robust feedback.
	number xTiltVectorX; // number of pixels moved in the (pixel) X axis per tiltX unit
	number xTiltVectorY; // number of pixels moved in the (pixel) Y axis per tiltX unit
	number yTiltVectorX; // number of pixels moved in the (pixel) X axis per tiltY unit
	number yTiltVectorY; // number of pixels moved in the (pixel) Y axis per tiltY unit
	number maxDeviation; // number of pixels difference allowed during pattern matching operations
	number centreXTilt, centreYTilt; // the centred tilt values. Do not set to 0,0, null, or any value that has not been verified.
	number cameraWidth, cameraHeight; // number of pixels on the camera.
	number keyListenerKeyToken; // ID number for the event listener set up later on.
	component markerRing, ringRadiusText; // Components used to draw the reticle.
	number originalScale // scale the system is set to at the start of the session
	string originalScaleString // scale the system is set to at the start of the session
	number refScale;
	string cameraLength;
	TagGroup cameraLengths;
	TagGroup DiffractionScale;
	TagGroup tiltVectorCalibrations;
	TagGroup imageSets;
	TagGroup ImagingModes;
	TagGroup DiffractionModes;
	string currentImageSet; // the imageSetID of the imageSet being created at the moment. Do not save this.
	number shadowDistanceNM;
	TagGroup DFList;
	number digitalMicrographVersion; //1 or 2. 2 is newer and uses different close dialog codes.

	number getDigitalMicrographVersion(object self){
		return digitalMicrographVersion;
	}
	number setDigitalMicrographVersion(object self, number value){
		digitalMicrographVersion = value;
		return value;
	}
	
	number getToggle(object self) {
		return toggle;
	}
	number setToggle(object self) {
		if(debugMode==1){result("\nToggle was " + toggle);}
		if(toggle==0){
			toggle = 1;
			return 1;
		} else {
			toggle = 0;
			return 0;
		}
	}
	
	number getTracker(object self) {
		return tracker;
	}
	number setTracker(object self, number newValue) {
		tracker = newValue;
		return tracker;
	}
	
	number getSpotTracker(object self) {
		return spotTracker;
	}
	void setSpotTracker(object self, number newValue) {
		spotTracker = newValue;
	}
	
	number getROITracker(object self) {
		return ROITracker;
	}
	number setROITracker(object self, number newValue) {
		ROITracker = newValue;
		return ROITracker;
	}
	number getringMarkerColourTracker(object self) {
		return ringMarkerColourTracker;
	}
	number setringMarkerColourTracker(object self, number newValue) {
		if(newValue >= 9){ // There are 9 colour options.
			ringMarkerColourTracker = 0;
		} else {
			ringMarkerColourTracker = newValue;
		}
		return ringMarkerColourTracker;
	}

	number setMaxDeviation(object self, number newValue){
		maxDeviation = newValue;
		return maxDeviation;
	}
	number getMaxDeviation(object self){
		return maxDeviation;
	}

	number getkeyListenerKeyToken(object self) {
		return keyListenerKeyToken;
	}
	number setkeyListenerKeyToken(object self, number newValue) {
		keyListenerKeyToken = newValue;
		return keyListenerKeyToken;
	}
	
	number setTiltVectors(object self, number xTVx, number xTVy, number yTVx, number yTVy){
		xTiltVectorX = xTVx;
		xTiltVectorY = xTVy;
		yTiltVectorX = yTVx;
		yTiltVectorY = yTVy;
		return 1;
	}
	// Load the values into variables passed to it.
	number getTiltVectors(object self, number &xTVx, number &xTVy, number &yTVx, number &yTVy){
		xTVx = xTiltVectorX;
		xTVy = xTiltVectorY;
		yTVx = yTiltVectorX;
		yTVy = yTiltVectorY;
		return 0;
	}

	number getCentreXTilt(object self) {
		return CentreXTilt;
	}
	number getCentreYTilt(object self) {
		return CentreYTilt;
	}
	number setCentreTiltHere(object self){
		EMGetBeamTilt(CentreXTilt, CentreYTilt); //Set the centre tilt values.
	}
	
	component setMarkerRing(object self, component newRing) {
		markerRing = newRing;
		return markerRing;
	}
	component getMarkerRing(object self) {
		return markerRing;
	}
	
	component setRingRadiusText(object self, component newRing) {
		ringRadiusText = newRing;
		return ringRadiusText;
	}
	component getRingRadiusText(object self) {
		return ringRadiusText;
	}
	
	image getDataArray(object self){
		return DataArray;
	}
	image setDataArray(object self, image dataArrayImage){
		dataArray := dataArrayImage;
		return dataArray;
	}
	
	image getReferenceDP(object self){
		return ReferenceDP;
	}
	image setReferenceDP(object self, image ReferenceDPImage){
		ReferenceDP := ReferenceDPImage;
		return ReferenceDP;
	}
	
	image getROIList(object self){ // returns a dummy image if one is not set. Otherwise the functions throws an exception.
		if(ROIList.ImageIsValid()){
			if(debugMode==1){result("\n\tGetting ROIList (valid)");}
			return ROIList;
		} else {
			if(debugMode==1){result("\n\tGetting ROIList (Dummy list)");}
			image dummyImage := [1,1]: { {0} };
			return dummyImage;
		}
	}
	image setROIList(object self, image ROIListImage){
		if(debugMode==1){result("\n\tSetting New ROIList");}
		if(!ROIListImage.ImageIsValid()){result("\n\tThe Set function does not detect a valid image");}
		ROIList := ROIListImage;
		return ROIList;
	}

	number getOriginalScale(object self) {
		return originalScale;
	}
	number setOriginalScale(object self, number newValue) {
		originalScale = newValue;
		return originalScale;
	}
	string getOriginalScaleString(object self) {
		return originalScaleString;
	}
	string setOriginalScaleString(object self, string newValue) {
		originalScaleString = newValue;
		return originalScaleString;
	}

	number getRefScale(object self) {
		return refScale;
	}
	void setRefScale(object self, number newValue) {
		refScale = newValue;
	}
	
	number getShadowDistanceNM(object self) {
		return shadowDistanceNM;
	}
	number setShadowDistanceNM(object self, number newValue) {
		shadowDistanceNM = newValue;
		return shadowDistanceNM;
	}
	
	string getCameraLength(object self) {
		return cameraLength;
	}
	void setCameraLength(object self, string newValue) {
		cameraLength = newValue;
	}
	
	TagGroup getDFList(object self){
		return DFList		
	}
	TagGroup setDFList(object self, TagGroup newValue){
		DFList = newValue
		return DFList;
	}

	void initialise(object self, number theToolkitID){
		ToolkitID = theToolkitID;
		if(debugMode==1){result("\nDatastore has been connected to Toolkit ID:" + theToolkitID);}
	}
	
	number getDataObjectID(object self){
		return dataObjectID;
	}
	
	// Function to return a text string with all the stored values.
	string printAllValues(object self){
		string textString
		textString = "\nPreparing Dump of all Data Variables..." +\
		"\ntoggle: " + toggle +\
		"\ntracker: " + tracker +\
		"\nspotTracker: " + spotTracker +\
		"\nROITracker: " + ROITracker +\
		"\ndebugMode: " + debugMode +\
		"\nxTiltVectorX: " + xTiltVectorX +\
		"\nxTiltVectorY: " + xTiltVectorY +\
		"\nyTiltVectorX: " + yTiltVectorX +\
		"\nyTiltVectorY: " + yTiltVectorY +\
		"\nmaxDeviation: " + maxDeviation +\
		"\ncentreXTilt: " + centreXTilt +\
		"\ncentreYTilt: " + centreYTilt +\
		"\nkeyListenerKeyToken: " + keyListenerKeyToken +\
		"\noriginalScale: " + originalScale +\
		"\noriginalScaleString: " + originalScaleString +\
		"\nrefScale: " + refScale +\
		"\ncameraLength: " + cameraLength +\
		"\nshadowDistanceNM: " + shadowDistanceNM;
		
		return textString
	}

	/* Function to print out all the values in the data image for debugging and backup */
	void printSpotIDArray (object self){
		result("\nprintSpotIDArray() called. Debug function requires updating.")
	}
	/* Function to print out all the values in the data image for debugging and backup.
			This version ignores the tracker value in the dataObject and uses the one provided.
	 */
	void printSpotIDArray (object self, number forcedValue){
		result("\nprintSpotIDArray() called. Debug function requires updating.");
	}

	 /* Displays a TagList saved inside the data Object. Used for debugging. */
	void showDFList(object self){
		DocumentWindow tagViewWindow = TagGroupOpenBrowserWindow( DFList, 0 );
	}
	
	/* Function to clear the stored data so tilts can be stored again without having to re-run the script. */
	void resetTiltStore (object self){
		if(tracker==0){
			throw("No Data to Delete");
		}
		if(debugMode==true){
			self.printSpotIDArray(); // Data dump before it is destroyed.
		}
		// Boolean TwoButtonDialog( String prompt, String acceptLabel, String rejectLabel )
		if(TwoButtonDialog( "Delete Calibration Data?", "Yes", "No")){
			DataArray = 0;
			ReferenceDP = 0; 
			self.setTracker(0);
			self.setSpotTracker(0);
			self.setTiltVectors(0,0,0,0);
			result("\nAll stored points and calibration data deleted. Please centre the beam and run the calibrate tilt function again");
			// Note: NEVER set centreXTilt or centreYTilt to 0, or anything other than real values.
		} else {
			self.setTracker(1);
			self.setSpotTracker(0);
			number height, width;
			getSize(dataArray, width, height)
			//realsubarea operator[( realimage img, number top, number left, number bottom, number right )
			dataArray[0, 1, height, width] = 0; // Set all values except first to 0
			result("\nStored points have been cleared. Calibration data are still in memory.")
		}
	 }
	
	// ************************************
	//  Tilt calculations
	// ************************************

	/* 	For a Desired Pixel Shift = X,Y. We are rotating the coordinate axis and then scaling the values.
		Theta = angle between x-axis and xTilt-axis
		xTilt = x cos (Theta) + y sin (Theta)
		yTilt = - x sin (Theta) - y cos (Theta) , with the -y term because the pixel y-axis is opposite the geometric y-axis.
		The values will then need scaling, since 1px =/= 1tilt	*/

	/* Function to convert a pixel distance into 1/nanometers. Very simple, but making it into a function should avoid mistakes
		isViewWindow parameter is 0 or 1
		binningMultiplier is a value usually taken from CameraControl. It is the binning number of the view window.
	*/
		
	number convertPixelDistanceToNM(object self, number pixelDistance, number isViewWindow, number binningMultiplier)
	{
		if(binningMultiplier==0){
			throw("Please Calibrate the toolkit");
		}
		
		number scaleX, NMDistance;
		scaleX = self.getRefScale(); // Scale for an unbinned image
		if(isViewWindow==1){
			pixelDistance = pixelDistance * binningMultiplier;
		}
		if(debugMode==true){result("\nPixel Distance -> 1/NM " + pixelDistance + "px * " + scaleX);}
		NMDistance = pixelDistance * scaleX;
		if(debugMode==true){result(" = " + NMDistance);}
			return NMDistance;
		}

	/* Function to convert a 1/NM distance into pixels. Very simple, but making it into a function should avoid mistakes
		isViewWindow parameter is 0 or 1
		binningMultiplier is a value usually taken from CameraControl. It is the binning number of the view window.
	*/
	number convertNMDistanceToPixel(object self, number NMDistance, number isViewWindow, number binningMultiplier)
	{
		if(binningMultiplier==0){
			throw("Please Calibrate the toolkit");
		}
		number scaleX, pixelDistance;
		scaleX = self.getRefScale(); // Scale for an unbinned image
		if(isViewWindow==1){
			NMDistance = NMDistance / binningMultiplier;
		}
		if(debugMode==true){result("\nNM Distance -> Pixel: " + NMDistance + "(1/nm) / " + scaleX);}
		pixelDistance = NMDistance / scaleX;
		if(debugMode==true){result(" = " + pixelDistance);}
		return pixelDistance;
	}

	/* Function to convert a pixel distance into tilt. This doesn't work with direction, just magnitude.
		isViewWindow parameter is 0 or 1
		Assumes X-Tilt is being used, but can be told to use Y-Tilt instead.
		binningMultiplier is a value usually taken from CameraControl. It is the binning number of the view window. */
	number convertPixelDistanceToTilt(object self, number pixelDistance, number isViewWindow, number useYTilt, number binningMultiplier)
	{
		if(binningMultiplier==0){
			throw("Please Calibrate the toolkit");
		}
		number xTx, xTy, yTx, yTy;
		self.getTiltVectors(xTx, xTy, yTx, yTy);
		// xTx = x pixels moved per unit of xTilt
		// xTy = y pixels moved per unit of xTilt
		// yTx = x pixels moved per unit of yTilt
		// yTy = y pixels moved per unit of yTilt

		if(isViewWindow==true){
			pixelDistance = pixelDistance * binningMultiplier;
		}
		number tiltDistance;
		number xTiltPixelShift = distance(xTy,xTx); // pixels moved by 1 unit of xTilt
		number yTiltPixelShift = distance(yTy,yTx); // pixels moved by 1 unit of yTilt
		if(useYTilt)
		{
			tiltDistance = pixelDistance / yTiltPixelShift;
		} 
		else
		{
			tiltDistance = pixelDistance / xTiltPixelShift;
		}
		if(debugMode==true){result("\nPixel Distance -> Tilt: " + pixelDistance + "px");}
		if(debugMode==true){result(" = " + tiltDistance);}
		return tiltDistance;
	}

	/* Function to convert Pixel COORDINATES to Tilt Values that will bring that point into the centre of the screen.
		isViewWindow parameter is 0 or 1.
		tiltShiftOnly = 1 will return only the RELATIVE values of tilt. Basically, it assumes beam centre is (0tilt,0tilt)
				Since all beam movement functions are defined by relative shifts, this might be helpful.
		pixelShiftOnly = 1 will assume the X and Y pixel coordinate values are relative shifts instead of coordinates.
				Basically it will assume the origin is (0,0) instead of the centre of the image.
		binningMultiplier is a value usually taken from CameraControl. It is the binning number of the view window.
	 */
	void pixelToTilt(object self, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,\
			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly, number binningMultiplier)
	{
	
	/* --------
			A lot of confusion is that pixel axis have their origin in the top left corner, not bottom left as in natural axis.
			Converting between is:
				X(natural) = X(pixel)
				Y(natural) = Y(max) - Y(pixel)
				
			The testbed tilt vectors in pixel space are
				xTx = 1000, xTy = 0 because +1 xTilt moves the pattern to the right.
				yTx = 0, yTy = -1000 because +1 yTilt moves the pattern upwards, which is -ve for pixel space.
				
			In natural space they are 
				xTx = 1000, xTy = 0 because +1 xTilt moves the pattern to the right.
				yTx = 0, yTy = 1000 because +1 yTilt moves the pattern upwards, which is +ve for natural space.
				
			The function converts from the pixel coordinates of a given point to the tilt values required to bring that point to teh centre of the screen.
		
	 -------- */
	
	
		number xTx, xTy, yTx, yTy;
		self.getTiltVectors(xTx, xTy, yTx, yTy);
		// Starting values needed for calculations
		if(isViewWindow)
		{
			xPixel = binningMultiplier * xPixel;
			yPixel = binningMultiplier * yPixel;
		}
		number beamCentreXTilt, beamCentreYTilt, beamCentreXPixel, beamCentreYPixel, scaleX, scaleY;
		scaleX = self.getRefScale(); // Scale for an unbinned image
		number width, height;
		getSize(referenceDP, width, height);
		beamCentreXTilt = self.getCentreXTilt();
		beamCentreYTilt = self.getCentreYTilt();
		beamCentreXPixel = width / 2;
		beamCentreYPixel = height / 2;

		// convert the pixel coordinates into natural coordinates.
		number xPixelNatural = xPixel;
		number yPixelNatural = height - yPixel;
		
		number xPixelChange, yPixelChange;
		if(pixelShiftOnly != 1){
			xPixelChange = beamCentreXPixel - xPixelNatural;
			yPixelChange = beamCentreYPixel - yPixelNatural;
		} else {
			xPixelChange = xPixelNatural;
			yPixelChange = yPixelNatural;
		}

		// For a Desired Pixel Shift = X,Y. We are rotating the coordinate axis and then scaling the values.
		// Alpha = angle between x-axis and xTilt-axis
		number alpha, Tx, Ty, newX, newY
		alpha = atan2(xTy, xTx);
		
		// This finds the vectors to make up the new Tilt coordinates, and therefore do not have SCALING, which must be done afterwards.
		// These formula are standard for converting between rotated coordinate systems for natural axis (origin in bottom left, +ve x and +ve y)
		newX = xPixelChange * cos(alpha) + yPixelChange * sin(alpha);
		newY = - xPixelChange * sin(alpha) + yPixelChange * cos(alpha);
		
		// The coordinates are then scaled using the tilt vectors.
		Tx = newX * (1 / distance(xTx, xTy))
		Ty = newY * (1 / distance(yTx, yTy))
		
		if(tiltShiftOnly != 1){
			// The final tilt coordinates are returned, not just the Tx and Ty needed to shift a relative distance.
			xTiltTarget = beamCentreXTilt + Tx;
			yTiltTarget = beamCentreYTilt + Ty;
		}
		else
		{
			// Only the relative tilt shift has been requested.
			xTiltTarget = Tx;
			yTiltTarget = Ty;
		}
		
		if(debugMode==1){
			result("\nStart pixelToTilt function. \n-------------");
			result("\n\tTarget Coords: " +xPixel + ", " + yPixel );
			result("\n\tVector Values: " +xTx + ", " + xTy + ", " + yTx + ", " + yTy );
			result("\n\tScales: " +scaleX + ", " + scaleY );
			result("\n\tCentre Pixels: " +beamCentreXPixel + ", " + beamCentreYPixel );
			result("\n\tCentre Tilts: " +beamCentreXTilt + ", " + beamCentreYTilt );
			result("\n\tPixel Changes: " +xPixelChange + ", " + yPixelChange );
			result("\n\tConstants: " +newX + ", " + newY );
			result("\n\tAngles: " + alpha);
			result("\n\tTilt Changes: " +Tx + ", " + Ty );
			result("\n\tTilt Target: " + xTiltTarget + ", " + yTiltTarget);
			result("\nEnd pixelToTilt coordinates function. \n-------------");
		}
	}

	/* Function to convert Tilt SHIFT to pixel SHIFT.
		isViewWindow parameter is 0 or 1. This will scale the returned pixel value by the binning multiplier.
		binningMultiplier is a value usually taken from CameraControl. It is the binning number of the view window.	
	*/
		
	void tiltToPixel(object self, number xTilt, number yTilt, number &xPixelShift, number &yPixelShift, number isViewWindow, number binningMultiplier)
	{
		// Load data from dataObject
		number xTx, xTy, yTx, yTy;
		self.getTiltVectors(xTx, xTy, yTx, yTy);
		if(binningMultiplier == 0){
			result("\nBinning Multiplier = 0");
			throw("Please calibrate the toolkit");
		}
		
		xPixelShift = (xTilt * xTx) + (yTilt * yTx);
		yPixelShift = (xTilt * xTy) + (yTilt * yTy);
		
		if(isViewWindow==1){
			if(debugMode==1){result("\nisViewWindow = " + isViewWindow);}
			xPixelShift = xPixelShift / binningMultiplier;
			yPixelShift = yPixelShift / binningMultiplier;
		}
		if(debugMode==1){result("\nxPixelShift = " + xPixelShift);
		result("\nyPixelShift = " + yPixelShift);}
	}

	//--------------------------------------
	//		TagGroup Functions
	//--------------------------------------
	
	/* show tag groups for debugging
		0 = TagGroup cameraLengths;
		1 = TagGroup DiffractionScale;
		2 = TagGroup tiltVectorCalibrations;
		3 = all
	*/
	void showDataTagGroup(object self, number selectedGroup){
		if(selectedGroup==0){
			TagGroupOpenBrowserWindow( cameraLengths , 0 );
		}
		if(selectedGroup==1){
			TagGroupOpenBrowserWindow( DiffractionScale , 0 );
		}
		if(selectedGroup==2){
			TagGroupOpenBrowserWindow( tiltVectorCalibrations , 0 );
		}
		if(selectedGroup==3){
			TagGroupOpenBrowserWindow( cameraLengths , 0 );
			TagGroupOpenBrowserWindow( DiffractionScale , 0 );
			TagGroupOpenBrowserWindow( tiltVectorCalibrations , 0 );
		}
	}

	/* Function to return a tag-group list of possible camera lengths */
	TagGroup getAvailableCameraLengths(object self){
		if( TagGroupIsValid(CameraLengths) ){
			TagGroup toReturn = cameraLengths.TagGroupClone();
			return toReturn;
		} else {
			TagGroup EmptyCameraList = NewTagList();
			EmptyCameraList.TagGroupInsertTagAsString(infinity(), "None");
			return EmptyCameraList;
		}
	}

	/* Function to return the binned image scale from the calibration table. */
	number getScaleCalibration(object self, string label){
		number scaleCalibration;
		DiffractionScale.TagGroupGetTagAsNumber(label, scaleCalibration);
		return scaleCalibration;	
	}
	
	/* Function to return the scale calibration table. */
	TagGroup getScaleCalibrationTable(object self){
		TagGroup toReturn = DiffractionScale.TagGroupClone();
		return toReturn;
	}
	
	/* Function to return the tilt calibration table. */
	TagGroup getTiltVectorCalibrations(object self){
		TagGroup toReturn = tiltVectorCalibrations.TagGroupClone();
		return toReturn;
	}

	/* Function to return the image sets list. */
	TagGroup getImageSets(object self){
		TagGroup toReturn = imageSets.TagGroupClone();
		return toReturn;
	}
	/* Function to change just the image sets from a tag group */
	void setImageSets(object self, TagGroup newImageSets){
		imageSets = NULL;
		imageSets = newImageSets;	
	}
	/* Function to change just the image sets from a tag group */
	void setAvailableCameraLengths(object self, TagGroup newTags){
		cameraLengths = NULL;
		cameraLengths = newTags;
	}
	/* Function to change just the image sets from a tag group */
	void setScaleCalibrationTable(object self, TagGroup newTags){
		DiffractionScale = NULL;
		DiffractionScale = newTags;
	}
	
	/* Function to change just the image sets from a tag group */
	void setTiltVectorCalibrations(object self, TagGroup newTags){
		tiltVectorCalibrations = NULL;
		tiltVectorCalibrations = newTags;
	}
	void setTiltVectorCalibrations(object self, string atCameraLength, TagGroup newTags){
		tiltVectorCalibrations.TagGroupDeleteTagWithLabel(atCameraLength);
		tiltVectorCalibrations.TagGroupCreateNewLabeledTag(atCameraLength);
		tiltVectorCalibrations.TagGroupSetTagAsTagGroup(atCameraLength, newTags);
	}
	
	string getCurrentImageSet(object self){
		return currentImageSet;
	}
	
	void setCurrentImageSet(object self, string input){
		currentImageSet = input;
	}
	
	/* Function to check if persistent tags are present */
	number checkPersistent(object self){
		TagGroup persistentTG = GetPersistentTagGroup();
		string tagPath = "Darkfield360";
			if(TagGroupIsValid(persistentTG) == 0){
				if(debugMode==1){result("\nNo Persistent tags detected.");}
				return -1;
			}
		number doesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(doesExist == 0){
			if(debugMode==1){result("\nDarkfield tag group not found.");}
			return 0;
		}
		if(debugMode==1){result("\nDarkfield tag group found.");}
		return 1;
	}
	
	/* Function to load the persistent tags into the dataObject by deleting the existing dataObject stuff */
	void overWriteDataObject(object self){
	
		string tagPath = "Darkfield360:CameraLengths";
		TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, cameraLengths);

		tagPath = "Darkfield360:DiffractionScale";
		TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, diffractionScale);
		
		tagPath = "Darkfield360:TiltCalibration";
		TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, tiltVectorCalibrations);
		
		tagPath = "Darkfield360:ImageSets";
		TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, imageSets);		
	}
	
	/* Function to save the persistent tag group in memory. Input is the entire Darkfield360 tag group to be saved. */
	number updatePersistent(object self, TagGroup updatedTagGroup){
		string tagPath = "Darkfield360";
		if(self.checkPersistent()==1) {
			// Yes the tag does exist - so delete it
			taggroupdeletetagwithlabel(GetPersistentTagGroup(), tagPath)
		}
		taggroupaddlabeledtaggroup(GetPersistentTagGroup(), tagPath, updatedTagGroup);	
	}

	/* Function to load data from a Darkfield360 tag group (usually from persistent memory) into the dataObject */
	number loadPersistent(object self, TagGroup persistentTG){
		number TagRef;
		result("\nLoading saved program settings...");
		string tagPath = "Darkfield360";
		if(TagGroupIsValid(persistentTG) != 1){
			result("\n\tTag group input is not valid")
			return 0;
		}
		
		// Check if cameraLength options exist
		tagPath = "CameraLengths";
		number CameraLengthsDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(CameraLengthsDoesExist==1){ // set the dataobject tag to the cameralengths data
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, cameraLengths);
			result("\n\tLoaded camera length options");
		}
		
		// Check if calibration scale data exists.
		tagPath = "DiffractionScale";
		number scaleDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(scaleDoesExist==1){ // set the dataobject tag to the diffraction scale taggroup
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, DiffractionScale);
			result("\n\tLoaded camera length scale calibrations");
		}
		
		// Check if tilt calibration data exists.
		tagPath = "TiltCalibration";
		number tiltDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(tiltDoesExist==1){ // set the dataobject tag to the tilt calibration taggroup
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, tiltVectorCalibrations);
			result("\n\tLoaded tilt calibrations");
		}
		
		// Image Sets
		tagPath = "ImageSets";
		number ImageSetsDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(ImageSetsDoesExist==1){
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, imageSets);
			result("\n\tLoaded Image Sets");
		}
		
		// Imaging modes
		tagPath = "ImagingModes";
		number ImagingModesDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(ImageSetsDoesExist==1){
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, ImagingModes);
			result("\n\tLoaded Imaging Mode list");
		} else {
			ImagingModes = NewTagList();
			TagRef = ImagingModes.TagGroupCreateNewTagAtEnd();
			ImagingModes.TagGroupSetIndexedTagAsString(TagRef, "SAMAG");
			TagRef = ImagingModes.TagGroupCreateNewTagAtEnd();
			ImagingModes.TagGroupSetIndexedTagAsString(TagRef, "IMAGING");
			TagRef = ImagingModes.TagGroupCreateNewTagAtEnd();
			ImagingModes.TagGroupSetIndexedTagAsString(TagRef, "MAG1");
			TagRef = ImagingModes.TagGroupCreateNewTagAtEnd();
			ImagingModes.TagGroupSetIndexedTagAsString(TagRef, "MAG2");
		}
		
		// Diffraction modes
		tagPath = "DiffractionModes";
		number DiffractionModesDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(ImageSetsDoesExist==1){
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, DiffractionModes);
			result("\n\tLoaded Diffraction Mode list");
		} else {
			DiffractionModes = NewTagList();
			TagRef = DiffractionModes.TagGroupCreateNewTagAtEnd();
			DiffractionModes.TagGroupSetIndexedTagAsString(TagRef, "DIFFRACTION");
		}
		
		//TagGroupOpenBrowserWindow(cameraLengths, 0);
		return 1;
	}
	
	/* Function to create a tag group from ONLY the dataObject values.
		Not used yet?
	*/
	TagGroup createDataFromDataObject(object self){
		TagGroup dataSet = newTagGroup();
		dataSet.TagGroupCreateNewLabeledTag("CameraLengths");
		dataSet.TagGroupSetTagAsTagGroup("CameraLengths", self.getAvailableCameraLengths());
		
		dataSet.TagGroupCreateNewLabeledTag("DiffractionScale");
		dataSet.TagGroupSetTagAsTagGroup("DiffractionScale", self.getScaleCalibrationTable());
		
		dataSet.TagGroupCreateNewLabeledTag("TiltCalibration");
		dataSet.TagGroupSetTagAsTagGroup("TiltCalibration", self.getTiltVectorCalibrations());
		
		dataSet.TagGroupCreateNewLabeledTag("ImageSets");
		dataSet.TagGroupSetTagAsTagGroup("ImageSets", self.getImageSets());
	
		return dataSet;
	}
	
	/* Function to create a 'default' tag group for storage
		Used if no existing Darkfield360 tags are found or to reset the stored data
	*/
	TagGroup createDefaultPersistent(object self){
		TagGroup persistentTG = NewTagGroup();
		persistentTG.TagGroupCreateNewLabeledTag("Toolkit Version");
		persistentTG.TagGroupSetTagAsNumber("Toolkit Version", versionNumber);
		
		TagGroup CLValues = NewTagList();
		CLValues.TagGroupInsertTagAsString(infinity(), "20cm");
		CLValues.TagGroupInsertTagAsString(infinity(), "25cm");
		CLValues.TagGroupInsertTagAsString(infinity(), "30cm");
		CLValues.TagGroupInsertTagAsString(infinity(), "40cm");
		CLValues.TagGroupInsertTagAsString(infinity(), "50cm");
		// Add the new table to the tag group.
		persistentTG.TagGroupCreateNewLabeledTag("CameraLengths");
		persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", CLValues);
		
		TagGroup diffractionData = NewTagGroup();
		diffractionData.TagGroupCreateNewLabeledTag("20cm");
		diffractionData.TagGroupSetTagAsNumber("20cm", 0.0095);
		diffractionData.TagGroupCreateNewLabeledTag("25cm");
		diffractionData.TagGroupSetTagAsNumber("25cm", 0.0081);
		diffractionData.TagGroupCreateNewLabeledTag("30cm");
		diffractionData.TagGroupSetTagAsNumber("30cm", 0.0070);
		diffractionData.TagGroupCreateNewLabeledTag("40cm");
		diffractionData.TagGroupSetTagAsNumber("40cm", 0.0054);
		diffractionData.TagGroupCreateNewLabeledTag("50cm");
		diffractionData.TagGroupSetTagAsNumber("50cm", 0.0044);
		// Add the new table to the tag group.
		persistentTG.TagGroupCreateNewLabeledTag("DiffractionScale");
		persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", diffractionData);	
		
		// For each camera length there are new tilt values.
		TagGroup tiltCalibrationContainer = NewTagGroup();
		number availableCameraLengths = TagGroupCountTags(CLValues);
		number i;
		for(i=0; i < availableCameraLengths; i++){
			TagGroup tiltCalibrationData = NewTagGroup();
			tiltCalibrationData.TagGroupCreateNewLabeledTag("xTiltx");
			tiltCalibrationData.TagGroupSetTagAsNumber("xTiltx", xTiltVectorX);
			tiltCalibrationData.TagGroupCreateNewLabeledTag("xTilty");
			tiltCalibrationData.TagGroupSetTagAsNumber("xTilty", xTiltVectorY);
			tiltCalibrationData.TagGroupCreateNewLabeledTag("yTiltx");
			tiltCalibrationData.TagGroupSetTagAsNumber("yTiltx", yTiltVectorX);
			tiltCalibrationData.TagGroupCreateNewLabeledTag("yTilty");
			tiltCalibrationData.TagGroupSetTagAsNumber("yTilty", yTiltVectorX);
			// Add the new table to the tag group.
			string CLname;
			TagGroupGetIndexedTagAsText(CLValues, i, CLname);
			number index = tiltCalibrationContainer.TagGroupCreateNewLabeledTag(CLname);
			tiltCalibrationContainer.TagGroupSetTagAsTagGroup(CLname, tiltCalibrationData);
		}
		// Add the new table to the tag group.
		persistentTG.TagGroupCreateNewLabeledTag("TiltCalibration");
		persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltCalibrationContainer);
		
		persistentTG.TagGroupCreateNewLabeledTag("ImageSets");
		persistentTG.TagGroupSetTagAsTagGroup("ImageSets", NewTagGroup());
		
		number TagRef;
		TagGroup defaultImagingModes = NewTagList();
		TagRef = defaultImagingModes.TagGroupCreateNewTagAtEnd();
		defaultImagingModes.TagGroupSetIndexedTagAsString(TagRef, "SAMAG");
		TagRef = defaultImagingModes.TagGroupCreateNewTagAtEnd();
		defaultImagingModes.TagGroupSetIndexedTagAsString(TagRef, "IMAGING");
		TagRef = defaultImagingModes.TagGroupCreateNewTagAtEnd();
		defaultImagingModes.TagGroupSetIndexedTagAsString(TagRef, "MAG1");
		TagRef = defaultImagingModes.TagGroupCreateNewTagAtEnd();
		defaultImagingModes.TagGroupSetIndexedTagAsString(TagRef, "MAG2");
		persistentTG.TagGroupCreateNewLabeledTag("ImagingModes");
		persistentTG.TagGroupSetTagAsTagGroup("ImagingModes", defaultImagingModes);
		
		TagGroup defaultDiffractionModes = NewTagList();
		TagRef = defaultDiffractionModes.TagGroupCreateNewTagAtEnd();
		defaultDiffractionModes.TagGroupSetIndexedTagAsString(TagRef, "DIFFRACTION");
		persistentTG.TagGroupCreateNewLabeledTag("DiffractionModes");
		persistentTG.TagGroupSetTagAsTagGroup("DiffractionModes", defaultDiffractionModes);
		
		return persistentTG;
	}
	
	/* Function to generate a Darkfield360 option tag group using dataObject and persistent storage, and using the other (and the default tags) to fill any gaps.
		Set the dataDominant input to 1 to take the dataobject values first, then fill in gaps with the existing peristent tags.
		Set the dataDominant input to 0 to take the persistent memory values first, then fill in the gaps with the dataObject values.
		If neither values can be found then take the default entry from the default persistent list.
	*/
	TagGroup createPersistent(object self, number dataDominant){
		if(debugMode==1){result("\nGenerating a persistent tag group");}
		TagGroup persistentTG = self.createDefaultPersistent();
		
		// Check if the tag groups exist inside dataObject
		number CameraLengthsDoesExist = TagGroupIsValid(cameralengths);
		number scaleDoesExist = TagGroupIsValid(DiffractionScale);
		number tiltDoesExist = TagGroupIsValid(tiltVectorCalibrations);
		number imageSetsDoesExist = TagGroupIsValid(imageSets);
		number imagingModesDoesExist = TagGroupIsValid(ImagingModes);
		number diffractionModesDoesExist = TagGroupIsValid(DiffractionModes);

		if(debugMode==1)
		{
			result("\nLoading Data Object tags:")
			result("\n\t CameraLengthsDoesExist: " + CameraLengthsDoesExist);
			result("\n\t DiffractionScaleDoesExist: " + scaleDoesExist);
			result("\n\t TiltCalibrationDoesExist: " + tiltDoesExist);
			result("\n\t ImageSetsDoesExist: " + imageSetsDoesExist);
			result("\n\t ImagingModesDoesExist: " + imagingModesDoesExist);
			result("\n\t DiffractionModesDoesExist: " + diffractionModesDoesExist);
			result("\nLoading Complete.");
		}
		
		// Check if there are DF360 persistant options saved on the computer at all.
		number persistentExists = self.checkPersistent();
		
		TagGroup darkfield360
		string tagPath;
		TagGroup loadedCameraLengths;
		number loadedCameraLengthsDoesExist;
		TagGroup loadedDiffractionScale;
		number loadedDiffractionScaleDoesExist;
		TagGroup loadedTiltCalibration;
		number loadedTiltCalibrationDoesExist;
		TagGroup loadedImageSets;
		number loadedImageSetsDoesExist;
		TagGroup loadedImagingModes;
		number loadedImagingModesDoesExist;
		TagGroup loadedDiffractionModes;
		number loadedDiffractionModesDoesExist;
		
		if(persistentExists == true)
		{
			// Check to see if the relevent tags are found and load them.
			if(debugMode==1){result("\nLoading persistent tags:");}
			TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), "Darkfield360", darkfield360);
			
			tagPath = "CameraLengths";
			loadedCameraLengthsDoesExist = TagGroupGetTagAsTagGroup(darkfield360, tagPath, loadedCameraLengths);
			
			tagPath = "DiffractionScale";
			loadedDiffractionScaleDoesExist = TagGroupGetTagAsTagGroup(darkfield360, tagPath, loadedDiffractionScale);
			
			tagPath = "TiltCalibration";
			loadedTiltCalibrationDoesExist = TagGroupGetTagAsTagGroup(darkfield360, tagPath, loadedTiltCalibration);
			
			tagPath = "ImageSets";
			loadedImageSetsDoesExist = TagGroupGetTagAsTagGroup(darkfield360, tagPath, loadedImageSets);
			
			tagPath = "ImagingModes";
			loadedImagingModesDoesExist = TagGroupGetTagAsTagGroup(darkfield360, tagPath, loadedImagingModes);
			
			tagPath = "DiffractionModes";
			loadedDiffractionModesDoesExist = TagGroupGetTagAsTagGroup(darkfield360, tagPath, loadedDiffractionModes);
			
			if(debugMode==1)
			{
				result("\n\t loadedCameraLengthsDoesExist: " + loadedCameraLengthsDoesExist);
				result("\n\t loadedDiffractionScaleDoesExist: " + loadedDiffractionScaleDoesExist);
				result("\n\t loadedTiltCalibrationDoesExist: " + loadedTiltCalibrationDoesExist);
				result("\n\t loadedImageSetsDoesExist: " + loadedImageSetsDoesExist);
				result("\n\t loadedImagingModesDoesExist: " + loadedImagingModesDoesExist);
				result("\n\t loadedDiffractionModesDoesExist: " + loadedDiffractionModesDoesExist);
				result("\nLoading Complete.");
			}
		}
		
		if(CameraLengthsDoesExist == true && loadedCameraLengthsDoesExist == true) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving CameraLengths from DataObject");}
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", cameraLengths);
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving CameraLengths from Persistent Memory");}
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", loadedCameraLengths);
				if(debugMode==1){result(". Done.");}
			}
		} else if(CameraLengthsDoesExist == true) {
			if(debugMode==1){result("\n\t Saving CameraLengths from DataObject");}
			persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", cameraLengths);
			if(debugMode==1){result(". Done.");}
		} else if(loadedCameraLengthsDoesExist == true)	{
			if(debugMode==1){result("\n\t Saving CameraLengths from Persistent Memory");}
			persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", loadedCameraLengths);
			if(debugMode==1){result(". Done.");}
		} else {
			// neither exist, so do nothing to keep default values.
		}
		
		if(ScaleDoesExist == true && loadedDiffractionScaleDoesExist == true) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving DiffractionScale from DataObject");}
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", diffractionScale); // use dataObject
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", loadedDiffractionScale); // use persistent memory
			}
		} else if(ScaleDoesExist == true) {
			if(debugMode==1){result("\n\t Saving DiffractionScale from DataObject");}
			persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", diffractionScale); // use dataObject
			if(debugMode==1){result(". Done.");}
		} else if(loadedDiffractionScaleDoesExist == true)	{
			persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", loadedDiffractionScale); // use persistent memory
		} else {
			if(debugMode==1){result("\n\t Using DiffractionScale from Default");}
			// neither exist, so do nothing to keep default values.
		}
		
		if(tiltDoesExist == true && loadedTiltCalibrationDoesExist == true) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving TiltCalibration from DataObject");}
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectorCalibrations); // use dataObject
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", loadedTiltCalibration); // use persistent memory
			}
		} else if(tiltDoesExist == true) {
			if(debugMode==1){result("\n\t Saving TiltCalibration from DataObject");}
			persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectorCalibrations); // use dataObject
			if(debugMode==1){result(". Done.");}
		} else if(loadedTiltCalibrationDoesExist == true)	{
			persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", loadedTiltCalibration); // use persistent memory
		} else {
			// neither exist, so do nothing to keep default values.
		}
		
		if(imageSetsDoesExist == true && loadedImageSetsDoesExist == true) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving ImageSets from DataObject");}
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", imageSets); // use dataObject
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", loadedImageSets); // use persistent memory
			}
		} else if(imageSetsDoesExist == true) {
			if(debugMode==1){result("\n\t Saving ImageSets from DataObject");}
			persistentTG.TagGroupSetTagAsTagGroup("ImageSets", imageSets); // use dataObject
			if(debugMode==1){result(". Done.");}
		} else if(loadedImageSetsDoesExist == true)	{
			persistentTG.TagGroupSetTagAsTagGroup("ImageSets", loadedImageSets); // use persistent memory
		} else {
			if(debugMode==1){result("\n\t Using ImageSets from Default");}
			// neither exist, so do nothing to keep default values.
		}
		
		if(imagingModesDoesExist == true && loadedImagingModesDoesExist == true) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving ImagingModes from DataObject");}
				persistentTG.TagGroupSetTagAsTagGroup("ImagingModes", ImagingModes); // use dataObject
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving ImagingModes from Persistent Memory");}
				persistentTG.TagGroupSetTagAsTagGroup("ImagingModes", loadedImagingModes); // use persistent memory
				if(debugMode==1){result(". Done.");}
			}
		} else if(imagingModesDoesExist == true) {
			if(debugMode==1){result("\n\t Saving ImagingModes from DataObject");}
			persistentTG.TagGroupSetTagAsTagGroup("ImagingModes", ImagingModes); // use dataObject
			if(debugMode==1){result(". Done.");}
		} else if(loadedImagingModesDoesExist == true)	{
			if(debugMode==1){result("\n\t Saving ImagingModes from Persistent Memory");}
			persistentTG.TagGroupSetTagAsTagGroup("ImagingModes", loadedImagingModes); // use persistent memory
			if(debugMode==1){result(". Done.");}
		} else {
			if(debugMode==1){result("\n\t Using ImagingModes from Default");}
			// neither exist, so do nothing to keep default values.
		}
		
		if(diffractionModesDoesExist == true && loadedDiffractionModesDoesExist == true) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving DiffractionModes from DataObject");}
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionModes", DiffractionModes); // use dataObject
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving DiffractionModes from Persistent Memory");}
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionModes", loadedDiffractionModes); // use persistent memory
				if(debugMode==1){result(". Done.");}
			}
		} else if(diffractionModesDoesExist == true) {
			if(debugMode==1){result("\n\t Saving DiffractionModes from DataObject");}
			persistentTG.TagGroupSetTagAsTagGroup("DiffractionModes", DiffractionModes); // use dataObject
			if(debugMode==1){result(". Done.");}
		} else if(loadedDiffractionModesDoesExist == true)	{
			if(debugMode==1){result("\n\t Saving DiffractionModes from Persistent Memory");}
			persistentTG.TagGroupSetTagAsTagGroup("DiffractionModes", loadedDiffractionModes); // use persistent memory
			if(debugMode==1){result(". Done.");}
		} else {
			if(debugMode==1){result("\n\t Using DiffractionModes from Default");}
			// neither exist, so do nothing to keep default values.
		}
		
		if(debugMode==1){result("\nReturning TagGroup");}
		return persistentTG;		
	}
	
	// Constructor
	MyDataObject(object self)
		{
			dataObjectID = self.ScriptObjectGetID(); // Tell the dataObject its own ID number
			if(EMIsReady()){ // If there is a microscope attached, then record tilt.
				setCentreTiltHere(self); // Store the Tilt values IMMEDIATELY to avoid referencing a null value or 0.
			}
			DFList = NewTagGroup();
			xTiltVectorX = 0; // number of pixels moved in the (pixel) X axis per tiltX unit in an unbinned image
			xTiltVectorY = 0; // number of pixels moved in the (pixel) Y axis per tiltX unit
			yTiltVectorX = 0; // number of pixels moved in the (pixel) X axis per tiltY unit
			yTiltVectorY = 0; // number of pixels moved in the (pixel) Y axis per tiltY unit
			// This section of code is for VirtualTEM and testing purposes only.
			// xTiltVectorX = -1000; // number of pixels moved in the (pixel) X axis per tiltX unit in an unbinned image
			// xTiltVectorY = 0; // number of pixels moved in the (pixel) Y axis per tiltX unit
			// yTiltVectorX = 0; // number of pixels moved in the (pixel) X axis per tiltY unit
			// yTiltVectorY = -1000; // number of pixels moved in the (pixel) Y axis per tiltY unit
			// End of VirtualTEM settings
			// cameraLength = 20;
			if( DoesFunctionExist("Notes") ){ // is a hacked check for version number
				digitalMicrographVersion = 2;
			} else {
				digitalMicrographVersion = 1;
			}			
			result("\nToolkit data store has been created with ObjectID " + self.ScriptObjectGetID())
		}
	// Function called on any destruction event.
	~MyDataObject(object self)
		{
			result("\nToolkit data store with ID " + self.ScriptObjectGetID() + " deleted.");
		}
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in DataObject");}
	}
}

