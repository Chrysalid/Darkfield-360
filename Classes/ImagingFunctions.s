//****************************************************
// IMAGE TAKING FUNCTIONS
//****************************************************

// Requires the following objects be loaded before it:
//		dataObject
//		imageSetTools
//		CameraControlObject
//		ProgressBarDialog
//		LiveViewControls

// The Image-taking functions. These use the data from other classes to take images and save them.

class ImagingFunctions
{
	number ImagingFunctionsID;
	number ToolkitID;
	number dataObjectID;
	number imageSetToolsID;
	number CameraControlObjectID;
	number ProgressBarDialogID;
	
	number debugMode;
	number isCalibrated; // 0/1 to check if the calibration is done
	
	number getIsCalibrated (object self){
		return isCalibrated;
	}
	
	void setIsCalibrated (object Self, number theValue){
		if(theValue == 0 || theValue == 1){
			isCalibrated = theValue;
		} else {
			if(debugMode == true){result("\n\n ImagingFunctions.IsCalibrated attempted to take an illegal value of " + theValue);}
		}
	}
	
	TagGroup StoredImageSet; // the image set to be used during imaging processes.
	
	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID, number theCameraControlObjectID, number theProgressBarDialogID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		ImageSetToolsID = theImageSetToolsID;
		CameraControlObjectID = theCameraControlObjectID;
		ProgressBarDialogID = theProgressBarDialogID;
	}
	
	void printAllValues(object self)
	{
		result("\n\nImaging Functions Debug Values")
		result("\n--------------------------");
		string textstring;
		textstring = "\n\tObjectID: " + ImagingFunctionsID +\
			"\n DebugMode: " + debugMode +\
			"\n ToolkitID: " + ToolkitID +\
			"\n dataObjectID: " + dataObjectID +\
			"\n imageSetToolsID: " + imageSetToolsID +\
			"\n CameraControlObjectID: " + CameraControlObjectID +\
			"\n ProgressBarDialogID: " + ProgressBarDialogID ;
		result(textstring);
		result("\n-------End----------------");
	}
	
	// begin darkfield imaging thread.
	void startDarkfieldImaging(object self, TagGroup theImageSet){
		result("\n Attempting to start imaging process");
		StoredImageSet = theImageSet;
		self.startthread("darkFieldImage");
	}
	
	// begin spot recording (DP) imaging thread.
	void startDiffractionPatternImaging(object self, TagGroup theImageSet){
		result("\n Attempting to start imaging process");
		StoredImageSet = theImageSet;
		self.startthread("diffractionPatternImage");
	}
	
	//****************************************************
	// IMAGING PROCESSES
	//****************************************************
	
	 /*	Function to calculate tilt values used to shadow a spot	
			Returns a tag group with the information formatted for storage in Spot/Image groups in imageSets.
	*/
	
	TagGroup calculateShadowTilt (object self, number xTiltStart, number yTiltStart, number shadowDistanceNM, string higherOrLower)
	{
		if(debugMode==true){result("\nFinding Shadowing Coordinates.");}
		if(higherOrLower != "Higher" && higherOrLower != "Lower"){
			throw("higherOrLower set incorrectly as " + higherOrLower);
		}
		
		number xTiltCenter = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number yTiltCenter = GetScriptObjectFromID(dataObjectID).getCentreYTilt();

		// First of all we get some values for the base coordinates.
		number xTiltRelativeStart, yTiltRelativeStart; // tilt values relative to centre tilt
		xTiltRelativeStart = xTiltStart - xTiltCenter;
		yTiltRelativeStart = yTiltStart - yTiltCenter;
		//void void tiltToPixel(object self, number xTilt, number yTilt, number &xPixelShift, number &yPixelShift, number isViewWindow, number binningMultiplier)
		number xPixelShiftStart, yPixelShiftStart
		GetScriptObjectFromID(dataObjectID).tiltToPixel(xTiltRelativeStart, yTiltRelativeStart, xPixelShiftStart, yPixelShiftStart, 0, 1);
		// NMDistance is the D-spacing of the spot in units of 1/NM
		number NMDistanceStart = distance(yPixelShiftStart, xPixelShiftStart) * GetScriptObjectFromID(dataObjectID).getRefScale();
		number shadowMultiplier = shadowDistanceNM / NMDistanceStart;
		number DSpacingAng = convertInverseNMToAngstrom(NMDistanceStart); // for tag writing later
		if(shadowMultiplier.isNaN()){ // checks to see if the shadow multiplier is a real number
			throw("Shadow Multiplier is not a number");
		}		
		// Need centre -> Tilt, not just tilt value.
		number direction = (higherOrLower == "Higher") ? 1 : -1 ;
		number shadowXshift = xTiltRelativeStart * shadowMultiplier * direction;
		number shadowYshift = yTiltRelativeStart * shadowMultiplier * direction;
		if(debugMode==true){result("\n\tShadowXShift (tilt) = " + shadowXshift);}
		if(debugMode==true){result("\n\tShadowYShift (tilt) = " + shadowYshift);}
		
		number xTilt = xTiltStart + shadowXshift;
		number yTilt = yTiltStart + shadowYshift;
		
		if(debugMode==1){result("\n\tBeam tilt caclulated for 1st shadow point.");}
		// Store new beam tilt.
		number xTiltRelative = xTilt - xTiltCenter;
		number yTiltRelative = yTilt - yTiltCenter;
		
		number shadowValue = (higherOrLower == "Higher") ? 2 : 3 ;
		
		number xPixelShift, yPixelShift
		GetScriptObjectFromID(dataObjectID).tiltToPixel(xTiltRelative, yTiltRelative, xPixelShift, yPixelShift, 0, 1);
		
		TagGroup shadowData = GetScriptObjectFromID(imageSetToolsID).createNewImageForImageSet();
		shadowData.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
		shadowData.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);
		shadowData.TagGroupSetTagAsNumber("XTiltValue", xTilt);
		shadowData.TagGroupSetTagAsNumber("YTiltValue", yTilt);
		shadowData.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
		shadowData.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		shadowData.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		shadowData.TagGroupSetTagAsNumber("XShift", xPixelShift);
		shadowData.TagGroupSetTagAsNumber("YShift", yPixelShift);
		return shadowData;
	}
	
	/* Function to create tilt values & their shadow coordinates
		Returns 3 coordinate sets as Taggroups. They are formatted as generic ImageSet Image entries
		Does not add the data to anything and contains many blank values.
		xTilt, yTilt = the tilt coordinates (not relative values) of the intended spot.
		shadowDistance = distance from the central point (in 1/nm) to perform shadowing. 0 = no shadowing.
	*/
	
	void createTiltCoord (object self, number xTilt, number yTilt, number shadowDistance, TagGroup &MiddleCoordinates, TagGroup &HigherCoordinates, TagGroup &LowerCoordinates)
	{
		number xTiltCenter = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number yTiltCenter = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
		
		if(debugMode==true)
		{
			result("\nCreating the tilt coordinate. Shadowing distance is set to " + shadowDistance + "(1/nm)");
			GetScriptObjectFromID(CameraControlObjectID).positionViewWindow();
		}
		
		number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
		xTiltRelative = xTilt - xTiltCenter;
		yTiltRelative = yTilt - yTiltCenter;
		
		MiddleCoordinates = GetScriptObjectFromID(imageSetToolsID).createNewImageForImageSet();
		MiddleCoordinates.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
		MiddleCoordinates.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);
		MiddleCoordinates.TagGroupSetTagAsNumber("XTiltValue", xTilt);
		MiddleCoordinates.TagGroupSetTagAsNumber("YTiltValue", yTilt);
		MiddleCoordinates.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		MiddleCoordinates.TagGroupSetTagAsNumber("ShadowValue", 1);
		number xPixelShift, yPixelShift, NMDistance;
		GetScriptObjectFromID(dataObjectID).tiltToPixel(xTiltRelative, yTiltRelative, xPixelShift, yPixelShift, 0, 1);
		// NMDistance is the D-spacing of the spot in units of 1/NM
		NMDistance = distance(yPixelShift, xPixelShift) * GetScriptObjectFromID(dataObjectID).getRefScale();
		number DSpacingAng = convertInverseNMToAngstrom(NMDistance);
		MiddleCoordinates.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		MiddleCoordinates.TagGroupSetTagAsNumber("XShift", xPixelShift);
		MiddleCoordinates.TagGroupSetTagAsNumber("YShift", yPixelShift);
		
		// For images with Shadowing activated...
		if(shadowDistance!=0)
		{
			if(debugMode==true){result("\nFinding Shadowing Coordinates.");}
			HigherCoordinates = self.calculateShadowTilt (xTilt, yTilt, shadowDistance, "Higher");
						
			// Second shadowing point
			LowerCoordinates = self.calculateShadowTilt (xTilt, yTilt, shadowDistance, "Lower");
		}
	}
	
	/* Function to store the tilt values for DP imaging in the current Image Set
		xTilt, yTilt = the tilt coordinates (not relative values) of the intended spot.
		shadowDistance = distance from the central point (in 1/nm) to perform shadowing. 0 = no shadowing.
		
		Does not store images or move anything.
	*/
	void storeTiltCoord(object self, number xTilt, number yTilt, number shadowDistance)
	{
		number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		// Generate the coordinate tags for this tilt value
		TagGroup MiddleCoordinates, HigherCoordinates, LowerCoordinates;
		self.createTiltCoord (xTilt, yTilt, shadowDistance, MiddleCoordinates, HigherCoordinates, LowerCoordinates);
		
		TagGroup spot = GetScriptObjectFromID(imageSetToolsID).addSpotToCurrentImageSet(); // The 1-3 images here will be placed inside the spot group
		MiddleCoordinates.TagGroupSetTagAsString("ImageType", "DP");
		MiddleCoordinates.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
		GetScriptObjectFromID(imageSetToolsID).addImageDataToCurrentSpot(MiddleCoordinates, "Middle"); // this is the middle image and is added to that tag in the spot taggroup

		// For images with Shadowing activated...
		if(shadowDistance!=0)
		{
			HigherCoordinates.TagGroupSetTagAsString("ImageType", "DP");
			HigherCoordinates.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
			GetScriptObjectFromID(imageSetToolsID).addImageDataToCurrentSpot(HigherCoordinates, "Higher");
			
			LowerCoordinates.TagGroupSetTagAsString("ImageType", "DP");
			LowerCoordinates.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
			GetScriptObjectFromID(imageSetToolsID).addImageDataToCurrentSpot(LowerCoordinates, "Lower");
		}
	}
	
	/* Function to take a DF image by reading from the ImageSet Tag group
		imageSet - the image set Tag group to take data from
		spotID - the spot number of the desired image
		imageLabel - the label of the image to be taken. Usually "Higher/Lower/Middle"
		ImageTags - persistent Tag group that will also be attached to the image.
	*/
	
	image takeDFImage (object self, TagGroup imageSet, number spotID, string imageLabel, TagGroup &persistentImageTags ){
		if(debugMode==true){result("\n Taking a Darkfield Image...");}
		
		if( imageSet.TagGroupIsValid() == false ){
			throw("Error when loading Image Set in DFImage function.");
		}
		TagGroup DFImageList, DFImageGroupTags, DFImageTags;
		if(debugMode==true){result("\n\t Loading DF image data... ");}
		imageSet.TagGroupGetTagAsTagGroup("Images", DFImageList);
		DFImageList.TagGroupGetIndexedTagAsTagGroup(spotID, DFImageGroupTags);
		DFImageGroupTags.TagGroupGetTagAsTagGroup(imageLabel, DFImageTags);
		// DFImageTags should now contain all of the required data for the DF image to be made.
		if( DFImageTags.TagGroupIsValid() == false ){
			throw("Error when loading DF Data in DFImage function.");
		}
		if(debugMode==true){result("\t Loading Complete.");}
		
		number xTiltTarget, yTiltTarget, relativeXTilt, relativeYTilt;
		// Read relative xTilt and yTilt from array
		DFImageTags.TagGroupGetTagAsNumber("XTiltRelative", relativeXTilt);
		DFImageTags.TagGroupGetTagAsNumber("YTiltRelative", relativeYTilt);
		
		xTiltTarget = GetScriptObjectFromID(dataObjectID).getCentreXTilt() + relativeXTilt;
		yTiltTarget = GetScriptObjectFromID(dataObjectID).getCentreYTilt() + relativeYTilt;
		
		// Move the beam tilt to this value.
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to imaging manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". Add your own modes in or replace these ones if your scope is different.
		if ( GetScriptObjectFromID(CameraControlObjectID).isImagingMode() == false ) {
			if(debugMode==true){
				result("\nTakeDFImage() called when EM not in imaging mode. Is in mode: " + opticsMode);
			}
			result("\nIf this mode is an imaging mode of your microscope then it needs to be added to the DF360 toolkit list of imaging mode names.");
			if(GetScriptObjectFromID(dataObjectID).getDisableModeWarnings() == false){
				if (!ContinueCancelDialog( "Switch to an imaging mode before continuing." )){
					Throw( "User aborted process." );
				}
			} else if(debugMode == true){
				result("Images taken despite incorrect imaging mode due to Mode Warning Option setting");
			}
		}
		opticsMode = EMGetImagingOpticsMode();
		
		// Take the  Image
		if(debugMode==true){result("\n\t Taking Exposure...");}
		number Exposure = GetScriptObjectFromID(CameraControlObjectID).getDFExposure();
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		image DFImage;
		DFImage := sscUnprocessedAcquire(Exposure,0,0,cameraWidth,cameraHeight);
		if(debugMode==true){result("\t done.");}
		
		// Retrive values for image tags...
		number shadowValue
		number shadowDistance
		number DSpacingAng
		string ImageSetID;
		imageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID);
		// retrive calibration values
		number xTiltx, xTilty, yTiltx, yTilty;
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:xTiltx", xTiltx);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:xTilty", xTilty);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:yTiltx", yTiltx);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:yTilty", yTilty);
		
		// retrieve other settings.
		number RingMode, IntegratedImage, NumberOfIntegrations, DegreeStep
		imageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		imageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		imageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		imageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// reteive settings specific to this image, not the image set.
		DFImageTags.TagGroupGetTagAsNumber("ShadowValue", shadowValue);
		DFImageTags.TagGroupGetTagAsNumber("shadowDistance", shadowDistance);
		DFImageTags.TagGroupGetTagAsNumber("DSpacingAng", DSpacingAng);

		// Create Image Tags...
		TagGroup ImageTags = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet();
		// ImageTags.TagGroupSetTagAsNumber("ImageID"); // Unique imageID number
		ImageTags.TagGroupSetTagAsString("ImageType", "DF");
		ImageTags.TagGroupSetTagAsString("ImageSetID", ImageSetID);
		ImageTags.TagGroupSetTagAsNumber("ImageSpotNumber", spotID);
		ImageTags.TagGroupSetTagAsString("ImageMode", opticsMode);
		ImageTags.TagGroupSetTagAsString("CameraLength", GetScriptObjectFromID(dataObjectID).getCameraLength());
		ImageTags.TagGroupSetTagAsNumber("ExposureTime", Exposure);
		ImageTags.TagGroupSetTagAsNumber("XTiltRelative", relativeXTilt);
		ImageTags.TagGroupSetTagAsNumber("YTiltRelative", relativeYTilt);		
		ImageTags.TagGroupSetTagAsNumber("XTiltValue", xTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("YTiltValue", yTiltTarget);		
		ImageTags.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		ImageTags.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		ImageTags.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:xTiltx", xTiltx);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:xTilty", xTilty);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:yTiltx", yTiltx);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:yTilty", yTilty);
		ImageTags.TagGroupSetTagAsNumber("RingMode", RingMode);
		ImageTags.TagGroupSetTagAsNumber("IntegratedImage", IntegratedImage);
		ImageTags.TagGroupSetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		ImageTags.TagGroupSetTagAsNumber("DegreeStep", DegreeStep);
		
		
		if(debugMode==true){result("\n\t attaching Darkfield360 tags to image's persistent tags");}
		// attach these tags to the image's Persistent Tag group
		TagGroup persistentTG = DFImage.ImageGetTagGroup();
		persistentTG.TagGroupAddLabeledTagGroup("Darkfield360", ImageTags)
		// Return a copy of the tags for outside functions. Making a copy makes sure they will not be accidentally changed later.
		if(debugMode == true){result("\n\t making copy of image tags.");}
		persistentImageTags = ImageTags.TagGroupClone();
		
		return DFImage;
	}

	/* Function to take a DP image by reading from the ImageSet Tag group
			imageSet - the image set Tag group to take data from
			spotID - the spot number of the desired image
			imageLabel - the label of the image to be taken. Usually "Higher/Lower/Middle"
			persistentImageTags - variable to return the persistent image tags after they are generated for ease of reference.
		It will add persistent image tags to the image under the Darkfield360 tag
	*/
	
	image takeDPImage(object self, TagGroup imageSet, number spotID, string imageLabel, TagGroup &persistentImageTags)
	{
		if(debugMode==true){result("\n takeDPImage function started...");}
		TagGroup DPImageTags, SpotData, targetSpotData;
		string ImageSetID;
		{result("\n\t recalling ImageSetID");}
		imageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID);
		// arguments: (TagGroup tagGroup, String tagPath, TagGroup subGroup )
		{result("\n\t generating spot tag group address");}
		string tagPath = "Spots";
		{result("\n\t Loading all spot information into tag group");}
		imageSet.TagGroupGetTagAsTagGroup(tagPath, SpotData);
		{result("\n\t Loading Spot " + SpotID);}
		SpotData.TagGroupGetIndexedTagAsTagGroup(SpotID, targetSpotData);
		{result("\n\t Loading Middle/Higher/Lower DP setting");}
		targetSpotData.TagGroupGetTagAsTagGroup(imageLabel, DPImageTags); // Loads the DP image information into this variable for reference.
	
		number xTiltTarget, yTiltTarget, relativeXTilt, relativeYTilt;
		
		// Read relative xTilt and yTilt from Tag group
		DPImageTags.TagGroupGetTagAsNumber("XTiltRelative", relativeXTilt);
		DPImageTags.TagGroupGetTagAsNumber("YTiltRelative", relativeYTilt);
		
		xTiltTarget = GetScriptObjectFromID(dataObjectID).getCentreXTilt() + relativeXTilt;
		yTiltTarget = GetScriptObjectFromID(dataObjectID).getCentreYTilt() + relativeYTilt;
		
		// Move the beam tilt to this value.
		{result("\n\t moving beam tilt to spot");}
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to Diffraction mode manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". 
		if ( GetScriptObjectFromID(CameraControlObjectID).isDiffractionMode() == false ) {
			if(debugMode==true){
				result("\nTakeDPImage() called when EM is not in a diffraction mode. It is in mode: " + opticsMode);
				result("\nIf this mode is a diffraction imaging mode of your microscope then it needs to be added to the DF360 toolkit list of diffraction mode names.");
			}
			if(GetScriptObjectFromID(dataObjectID).getDisableModeWarnings() == false){
				if (!ContinueCancelDialog( "Switch to a diffraction mode before continuing." )){
					Throw( "User aborted process." );
				}
			} else if(debugMode == true){
				result("Images taken despite incorrect imaging mode due to Mode Warning Option setting");
			}
		}
		
		
		
		opticsMode = EMGetImagingOpticsMode();
		
		// Take the  Image
		number Exposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		{result("\n\t taking image of DP.");}
		image DPImage;
		DPImage := sscUnprocessedAcquire(Exposure,0,0,cameraWidth,cameraHeight);
		
		// Create Image Tags to be attached to the image itself (not the image set)
		TagGroup ImageTags = GetScriptObjectFromID(ImageSetToolsID).createImageTags();

		// Retrive image values
		number shadowValue, shadowDistance, DSpacingAng, xShift, yShift;
		DPImageTags.TagGroupGetTagAsNumber("ShadowValue", ShadowValue);
		DPImageTags.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		DPImageTags.TagGroupGetTagAsNumber("DSpacingAng", DSpacingAng);
		DPImageTags.TagGroupGetTagAsNumber("XShift", XShift);
		DPImageTags.TagGroupGetTagAsNumber("YShift", YShift);
		// retrive calibration values
		number xTiltx, xTilty, yTiltx, yTilty;
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:xTiltx", xTiltx);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:xTilty", xTilty);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:yTiltx", yTiltx);
		imageSet.TagGroupGetTagAsNumber("TiltCalibration:yTilty", yTilty);
		// retrieve settings not used in the DP mode
		number RingMode, IntegratedImage, NumberOfIntegrations, DegreeStep
		imageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		imageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		imageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		imageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// Write values to tag group.
		ImageTags.TagGroupSetTagAsString("ImageType", "DP");
		ImageTags.TagGroupSetTagAsString("ImageSetID", ImageSetID);
		ImageTags.TagGroupSetTagAsNumber("ImageSpotNumber", spotID);
		ImageTags.TagGroupSetTagAsString("ImageMode", opticsMode);
		ImageTags.TagGroupSetTagAsString("CameraLength", GetScriptObjectFromID(dataObjectID).getCameraLength());
		ImageTags.TagGroupSetTagAsNumber("ExposureTime", Exposure);
		ImageTags.TagGroupSetTagAsNumber("XTiltRelative", relativeXTilt);
		ImageTags.TagGroupSetTagAsNumber("YTiltRelative", relativeYTilt);		
		ImageTags.TagGroupSetTagAsNumber("XTiltValue", xTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("YTiltValue", yTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("XShift", XShift);
		ImageTags.TagGroupSetTagAsNumber("YShift", YShift);		
		ImageTags.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		ImageTags.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		ImageTags.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:xTiltx", xTiltx);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:xTilty", xTilty);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:yTiltx", yTiltx);
		ImageTags.TagGroupSetTagAsNumber("TiltCalibration:yTilty", yTilty);
		ImageTags.TagGroupSetTagAsNumber("RingMode", RingMode);
		ImageTags.TagGroupSetTagAsNumber("IntegratedImage", IntegratedImage);
		ImageTags.TagGroupSetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		ImageTags.TagGroupSetTagAsNumber("DegreeStep", DegreeStep);
		
		if(debugMode==true){result("\n\t attaching Darkfield360 tags to image's persistent tags");}
		// attach these tags to the image's Persistent Tag group
		TagGroup persistentTG = DPImage.ImageGetTagGroup();
		persistentTG.TagGroupAddLabeledTagGroup("Darkfield360", ImageTags)
		// Return a copy of the tags for outside functions. Making a copy makes sure they will not be accidentally changed later.
		if(debugMode == true){result("\n\t making copy of image tags.");}
		persistentImageTags = ImageTags.TagGroupClone();
		if(debugMode == true){result("\n returning DPImage. End of function.");}
		return DPImage;
	}

	/* Function to take a Brightfield Image for an ImageSet
		Mostly the same as the TakeDF function with a few tweaks and no shadowing.
	*/
	image takeBFImage (object self, TagGroup imageSet, TagGroup &persistentImageTags ){
		if(debugMode == true){result("\n Taking BF Image...");}
		TagGroup ImageSetTags, BFImageTags, SpotTags;
		imageSet.TagGroupGetTagAsTagGroup("Images", ImageSetTags);
		ImageSetTags.TagGroupGetIndexedTagAsTagGroup(0, SpotTags);
		SpotTags.TagGroupGetTagAsTagGroup("Middle", BFImageTags); // Loads the BF image information into this variable for reference.
	
		string ImageSetID;
		imageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID);
		number xTiltTarget, yTiltTarget, relativeXTilt, relativeYTilt;
		
		// Read relative xTilt and yTilt from array. Should be 0 for both
		BFImageTags.TagGroupGetTagAsNumber("XTiltRelative", relativeXTilt);
		BFImageTags.TagGroupGetTagAsNumber("YTiltRelative", relativeYTilt);
		
		if(relativeXTilt != 0 || relativeYTilt !=0 ){
			Throw("Relative X/Y Tilts are not 0. ImageSet misconfigured.")
		}
		
		xTiltTarget = GetScriptObjectFromID(dataObjectID).getCentreXTilt() + relativeXTilt;
		yTiltTarget = GetScriptObjectFromID(dataObjectID).getCentreYTilt() + relativeYTilt;
		
		// Move the beam tilt to this value.
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to imaging manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". Add your own modes in or replace these ones if your scope is different.
		if ( GetScriptObjectFromID(CameraControlObjectID).isImagingMode() == false ) {
			if(debugMode==true){
				result("\nTakeBFImage() called when EM not in imaging mode. Is in mode: " + opticsMode);
			}
			result("\nIf this mode is an imaging mode of your microscope then it needs to be added to the DF360 toolkit list of imaging mode names.");
			if(GetScriptObjectFromID(dataObjectID).getDisableModeWarnings() == false){
				if (!ContinueCancelDialog( "Switch to an imaging mode before continuing." )){
					Throw( "User aborted process." );
				}
			} else if(debugMode == true){
				result("Images taken despite incorrect imaging mode due to Mode Warning Option setting");
			}
		}
		
		opticsMode = EMGetImagingOpticsMode();
		
		
		// Take the  Image
		number Exposure = GetScriptObjectFromID(CameraControlObjectID).getBFExposure();
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		image BFImage;
		BFImage := sscUnprocessedAcquire(Exposure,0,0,cameraWidth,cameraHeight);
		
		// Create Image Tags...
		TagGroup ImageTags = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet();
		// ImageTags.TagGroupSetTagAsNumber("ImageID"); // Unique imageID number
		ImageTags.TagGroupSetTagAsString("ImageSetID", ImageSetID);
		ImageTags.TagGroupSetTagAsString("ImageType", "BF");
		ImageTags.TagGroupSetTagAsNumber("ImageSpotNumber", 0);
		ImageTags.TagGroupSetTagAsNumber("ExposureTime", Exposure);
		ImageTags.TagGroupSetTagAsNumber("XTiltRelative", relativeXTilt);
		ImageTags.TagGroupSetTagAsNumber("YTiltRelative", relativeYTilt);		
		ImageTags.TagGroupSetTagAsNumber("XTiltValue", xTiltTarget);
		ImageTags.TagGroupSetTagAsNumber("YTiltValue", yTiltTarget);		
		ImageTags.TagGroupSetTagAsNumber("ShadowValue", 0);
		ImageTags.TagGroupSetTagAsNumber("ShadowDistance", 0);
		ImageTags.TagGroupSetTagAsNumber("DSpacingAng", 0);
		ImageTags.TagGroupSetTagAsString("ImageMode", opticsMode);

		TagGroup persistentTG = BFImage.ImageGetTagGroup();
		persistentTG.TagGroupAddLabeledTagGroup("Darkfield360", ImageTags)
		// Return a copy of the tags for outside functions. Making a copy makes sure they will not be accidentally changed later.
		if(debugMode == true){result("\n\t making copy of image tags.");}
		persistentImageTags = ImageTags.TagGroupClone();
		return BFImage;
	}
	
	
	/* This function will use the spot data stored in the current image set to create DP images.
			It will then update the image set with information about the images being taken.
			This step is the final phase before DF imaging begins.
			Uses function: image takeDPImage(object self, TagGroup imageSet, number spotID, string imageLabel)
	*/
	
	void diffractionPatternImage(object self){
		if(debugMode==true){result("\nFinalizing Image Set...");}
		
		// Is there an open imageSet?
		TagGroup targetImageSet
		number isCurrent = GetScriptObjectFromID(imageSetToolsID).getCurrentImageSet(targetImageSet)
		if(isCurrent == 0){
			Throw("There is no Image Set to finalize. Please create one.");
		}
		if(debugMode==true){result("\n\tImage Set found and loaded.");}
		// Has the imageSet been finalized, and so does not accept new points?
		// Boolean TagGroupGetTagAsNumber( TagGroup tagGroup, String tagPath, NumberVariable number )
		number DPsTaken
		if(targetImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken) == 0){
			result("\n\tImage Set does not have the DPSTaken tag. This is an error.");
			Throw("Image Set Error: No DPsTaken flag.");
		} 
		if(DPsTaken == 1){
			result("\n\tImage Set has been finalized all ready.");
			result("\n\tPlease create a new image set.");
			throw("Image Set has all ready been finalized.");
		}
		// ImageSetID check
		string ImageSetID
		if(targetImageSet.TagGroupGetTagAsString("ImageSetID", ImageSetID) == 0){
			result("\n\tImage Set does not have the ImageSetID tag. This is an error.");
			Throw("Image Set Error: No ImageSetID flag.");
		} 
		
		// Shadow mode settings check
		number shadowDistanceNM, shadowMode;
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode) == 0){
			result("\n\tImage Set does not have the ShadowMode tag. This is an error.");
			Throw("Image Set Error: No ShadowMode flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowDistance", shadowDistanceNM) == 0){
			result("\n\tImage Set does not have the ShadpwDistance tag. This is an error.");
			Throw("Image Set Error: No ShadowDistance flag.");
		}
		if(ShadowMode == 0){ // the shadow distance can be a non-0 value, yet not be used.
			shadowDistanceNM = 0;
		}
		if(ShadowMode==1 && shadowDistanceNM==0){
			result("\n\tImage Set shadowing distance is set to 0, but the shadow mode option is On.");
			Throw("Shadow distance not set");
		}
		// Image save & display settings
		number AutoSaveImages, AutoDisplayImages;
		if(targetImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages) == 0){
			result("\n\tImage Set does not have the AutoSaveImages tag. This is an error.");
			Throw("Image Set Error: No AutoSaveImages flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages) == 0){
			result("\n\tImage Set does not have the AutoDisplayImages tag. This is an error.");
			Throw("Image Set Error: No AutoDisplayImages flag.");
		}
		// Ring Mode checks
		number RingMode, NumberOfRingPoints, RingDSpacing;
		if(targetImageSet.TagGroupGetTagAsNumber("RingMode", RingMode) == 0){
			result("\n\tImage Set does not have the RingMode tag. This is an error.");
			Throw("Image Set Error: No RingMode flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("NumberOfRingPoints", NumberOfRingPoints) == 0){
			result("\n\tImage Set does not have the NumberOfRingPoints tag. This is an error.");
			Throw("Image Set Error: No NumberOfRingPoints flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("RingDSpacing", RingDSpacing) == 0){
			result("\n\tImage Set does not have the RingDSpacing tag. This is an error.");
			Throw("Image Set Error: No RingDSpacing flag.");
		}
		if(RingMode == true && RingDSpacing <= 0){
			result("\n\tImage Set RingDSpacing tag is < 0");
			Throw("Image Set Error: RingDSpacing is " + RingDSpacing);
		}
		// Integrated Image Checks
		number IntegratedImage, NumberOfIntegrations, AutoSaveNonInt, AutoDisplayNonInt
		if(targetImageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage) == 0){
			result("\n\tImage Set does not have the IntegratedImage tag. This is an error.");
			Throw("Image Set Error: No IntegratedImage flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations) == 0){
			result("\n\tImage Set does not have the NumberOfIntegrations tag. This is an error.");
			Throw("Image Set Error: No NumberOfIntegrations flag.");
		}
		if(IntegratedImage == true && NumberOfIntegrations <= 0){
			result("\n\tNumberOfIntegrations is <= 0.");
			throw("Image Set Error: Number of Integrations per image is too small");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", AutoSaveNonInt) == 0){
			result("\n\tImage Set does not have the AutoSaveNonInt tag. This is an error.");
			Throw("Image Set Error: No AutoSaveNonInt flag.");
		}
		if(targetImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", AutoDisplayNonInt) == 0){
			result("\n\tImage Set does not have the AutoDisplayNonInt tag. This is an error.");
			Throw("Image Set Error: No AutoDisplayNonInt flag.");
		}
		
		number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		number DFExposure = GetScriptObjectFromID(CameraControlObjectID).getDFExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		GetScriptObjectFromID(dataObjectID).getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number binning = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		number beamCentreX = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number beamCentreY = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
		number RefScale = GetScriptObjectFromID(dataObjectID).getRefScale();
		
		// Generate Ring Mode Coordinates
		if(RingMode == true){
			if(debugMode==true){result("\nStarting to create Ring Data Points.");}
			
			// Ask the user how many DPs will be taken when the image set is finalized (not how many darkfield images will be taken)
			number NumberOfPoints;
			if (getnumber( "How many diffraction patterns should be recorded?", 16, NumberOfPoints) == false ){
				throw("Cancelled by User");
			}
			
			if(debugMode==true){result("\n\tNumber of points to DP is " + numberOfPoints);}
			if(numberOfPoints<=0){
				throw("Wrong number of points.");
			}
			number angleStep = 360 / numberOfPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
			
			// alpha is angle between X axis and TiltX axis in radians.
			number Px, Py, alpha;
			alpha = atan2(xTiltVectorY, xTiltVectorX);
			// tiltVectorX is the tilt needed to reach the target radius using only xTilt
			number tiltVectorX
			// RingDSpacing is the d-spacing in Angstroms. convert to (1/NM).
			number radiusNM = convertAngstromToInverseNM(RingDSpacing);
			// convert to pixels
			number radiusPX = radiusNM / RefScale;
						
			tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
			if(debugMode==true){
				result("\n\tAlpha for tiltVectorX: " + alpha );
				result("\n\ttan (alpha): " + tan(alpha) );
				result("\n\tRingRadius (1/NM): " + radiusNM );
				result("\n\tRingRadius (px): " + radiusPX );
				result("\n\ttiltVectorX = " + tiltVectorX);
			}
			number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.
			
			number estimatedTime = numberOfPoints * DFExposure / 60;
			if (!ContinueCancelDialog( "Complete darkfield imaging of this ring will take approximately " + estimatedTime + " minutes. Would you like to continue to target these points?" )){
				throw("Cancelled by User");
			}
			result("\nGenerating Tilt coordinates for DP imaging.");

			number i, angleToMove, tiltX, tiltY;
			number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
			for(i=0; i < numberOfPoints; i++){
				angleToMove = i * angleStep; // This is in Degrees.
				angleToMove = angleToMove * pi() / 180; // converted to radians
				
				// work out change in tilt to get there.
				tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
				tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
				
				number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
				xTiltRelative = tiltX - beamCentreX
				yTiltRelative = tiltY - beamCentreY;				
				
				self.storeTiltCoord (tiltX, tiltY, shadowDistanceNM);
				
				if(remainder(i,60)==0){ //This part just puts a '.' every 60 calculations as a crude progress bar, and a line break every 60.
					result("\n");
				} else {
					result(".");
				}
			}
			result("\nTilt coordinates have been generated for RingMode imaging");
		}
		
		
		// Load the spot coordinate tag group and check there are some spots there.
		if(debugMode==true){result("\n\tRetrieving spot data... ");}
		TagGroup spots;
		targetImageSet.TagGroupGetTagAsTagGroup("Spots", spots);
		number NumberOfSpots = spots.TagGroupCountTags();
		if(NumberOfSpots == 0){
			result("\n\tImage Set does not have any spots in it.");
			Throw("Image Set Error: No spots found.");
		}
		if(debugMode==true){result(NumberOfSpots + " spots found.");}
		
		// spots are now stored and ready to be imaged. The process for the loop is:
			// Acquire image/s
				// Uses function: image takeDPImage(object self, TagGroup imageSet, number spotID, string imageLabel)
			// Update the DF Images group.
				// Add DF image information to image set for it to be taken later
			// Save +/ show images
			// update image set with image ID or file name for DP image
			
		// Set up the progress bar system.
		GetScriptObjectFromID(ProgressBarDialogID).makeDialog(); //command to start the progress bar dialog.
		GetScriptObjectFromID(ProgressBarDialogID).setProgressPercent(0);
		// Check if the image acquisition has been cancelled by the user
		if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
			result("\n\n Break signal recieved. Ending Diffraction Pattern imaging thread.")
			return
		}
		
		image DiffractionPointsRecord; // image will be the central DP pattern and will have all diffraction points stored on it and given their number.
		Component comp; // used to get the ImageDisplay as a component so additional components can be added to it.
		
		number i;
		for(i=0; i < NumberOfSpots; i++){
			// Check if the image acquisition has been cancelled by the user
			if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
				result("\n\n Break signal recieved. Ending Diffraction Pattern imaging thread.")
				return
			}
			// update the progress bar %
			number percentComplete = i / NumberOfSpots;
			GetScriptObjectFromID(ProgressBarDialogID).setProgressPercent(percentComplete);
			
			if(debugMode==true){result("\n\t Recording spot " + i + " (Middle)...");}
			TagGroup newDFImageData;
			image DPImage := self.takeDPImage( targetImageSet, i, "Middle", newDFImageData)
			if(debugMode==true){result("\n\t Exposure done.");}
			if(i == 0){ // central image used to make a record of spots and their numbers.
				if(debugMode==true){result("\n\t Creating Record of DP spots image.");}
				DiffractionPointsRecord = DPImage; // Note: Just a copy of the image, not a reference to the actual image.
				showImage(DiffractionPointsRecord);
				DiffractionPointsRecord.ImageSetName("Record of Diffraction Spots");
				comp = ImageGetImageDisplay( DiffractionPointsRecord, 0 );
				Component patternName = NewTextAnnotation( 10, 10, "Diffraction Pattern Name", 25 );
				patternName.componentsetfillmode(1); // mode 2 is not filled. Important for circles.
				patternName.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
				patternName.componentsetforegroundcolor(1,1,1); // Colour that the shape is drawn in
				patternName.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.
				patternName.componentsetfontfacename("Microsoft Sans Serif");
				comp.ComponentAddChildAtEnd( patternName ); // add the component to the image display
				if(debugMode==true){result("\n\t Record of DP spots image created.");}
			} else {
				if(debugMode==true){result("\n\t Adding spot to Record of DP spots image.");}
				number pixelShiftX, pixelShiftY, markerCenterX, markerCenterY;
				newDFImageData.TagGroupGetTagAsNumber("XShift", pixelShiftX);
				newDFImageData.TagGroupGetTagAsNumber("YShift", pixelShiftY);
				
				number markerRadius, markerLeft, markerRight, markerTop, markerBottom;
				markerRadius = 10; // set radius of marker rings here.
				
				markerCenterX = ( GetScriptObjectFromID(CameraControlObjectID).getCameraWidth() / 2 ) - pixelShiftX;
				markerCenterY = ( GetScriptObjectFromID(CameraControlObjectID).getCameraHeight() / 2 ) + pixelShiftY;
				markerTop = markerCenterY + markerRadius;
				markerBottom = markerCenterY - markerRadius;
				markerLeft = markerCenterX - markerRadius;
				markerRight = markerCenterX + markerRadius;
				
				component marker = NewOvalAnnotation( markerTop , markerLeft, markerBottom, markerRight );
				marker.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
				marker.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
				marker.componentsetforegroundcolor(1,0,0);// Colour that the shape is drawn in
				marker.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.
				comp.ComponentAddChildAtEnd( marker ); // add the component to the image display
				
				component markerID = NewTextAnnotation(markerRight, markerCenterY - 25, Decimal(i), 50);
				markerID.componentsetfillmode(1); // mode 2 is not filled. Important for circles.
				markerID.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
				markerID.componentsetforegroundcolor(1,0,0); // Colour that the shape is drawn in
				markerID.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.
				markerID.componentsetfontfacename("Microsoft Sans Serif");
				comp.ComponentAddChildAtEnd( markerID ); // add the component to the image display
				if(debugMode==true){result("\n\t Spot added to Record of DP spots image.");}
			}
			image DPImageLower, DPImageHigher;
			TagGroup NewSpotSet, NewMiddleDF, higherImageData, NewHigherDF, lowerImageData, NewLowerDF;

			// Update the DF Images group. Note that in RingMode all but one (i == 0) of these values will be erased later.
			if(debugMode==true){result("\n\t Creating Image Group in ImageSet:Images ...");}
			NewSpotSet = GetScriptObjectFromID(ImageSetToolsID).addImageToCurrentImageSet(); // creates a new set of 'spots' in the imageset:Images indexed taggroup
			if(debugMode==true){result(" done.");}
			
			if(debugMode==true){result("\n\t Creating image settings for ImageSet:Images[spot index]:Middle ...");}
			NewMiddleDF = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet(newDFImageData); // Uses loaded version of createNewImageForImageSet function to fill in a lot of the values.
			string imgtype = (i == 0) ? "BF" : "DF"
			NewMiddleDF.TagGroupSetTagAsString("ImageType", imgtype);
			number exptype = (i == 0) ? GetScriptObjectFromID(CameraControlObjectID).getBFExposure() : GetScriptObjectFromID(CameraControlObjectID).getDFExposure();
			NewMiddleDF.TagGroupSetTagAsNumber("ExposureTime", GetScriptObjectFromID(CameraControlObjectID).getDFExposure());
			if(debugMode==true){result(" done.");}
			
			if(debugMode==true){result("\n\t Adding image settings to ImageSet:Images[spot index]:Middle ...");}
			// add the tag group to the new 'image' spot set
			NewSpotSet.TagGroupSetTagAsTagGroup("Middle", NewMiddleDF);
			if(debugMode==true){result(" done.");}
			
			if(ShadowMode == true && (i > 0)){
				if(debugMode==true){result("\n\t Shadowing spot " + i + " (Higher)...");}
				DPImageHigher := self.takeDPImage( targetImageSet, i, "Higher", higherImageData);
				NewHigherDF = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet(higherImageData);
				NewHigherDF.TagGroupSetTagAsString("ImageType", "DF");
				NewHigherDF.TagGroupSetTagAsNumber("ExposureTime", GetScriptObjectFromID(CameraControlObjectID).getDFExposure());
				// add the tag group to the new 'image' spot set
				NewSpotSet.TagGroupSetTagAsTagGroup("Higher", NewHigherDF);
				// test for a cancelled progress dialog.
				if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
					result("\n\n Break signal recieved. Ending Diffraction Pattern imaging thread.")
					return
				}
				
				if(debugMode==true){result("\n\t Shadowing spot " + i + " (Lower)...");}
				DPImageLower := self.takeDPImage( targetImageSet, i, "Lower", lowerImageData);
				NewLowerDF = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet(lowerImageData);
				NewLowerDF.TagGroupSetTagAsString("ImageType", "DF");
				NewLowerDF.TagGroupSetTagAsNumber("ExposureTime", GetScriptObjectFromID(CameraControlObjectID).getDFExposure());
				// add the tag group to the new 'image' spot set
				NewSpotSet.TagGroupSetTagAsTagGroup("Lower", NewLowerDF);
				// test for a cancelled progress dialog.
				if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
					result("\n\n Break signal recieved. Ending Diffraction Pattern imaging thread.")
					return
				}
			}
			
			if(debugMode==true){result("\n\t Images taken.");}
			if(AutoDisplayImages == true){
				if(debugMode==true){result("\n\t Displaying images.");}
				showImage(DPImage);
				GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(DPImage)
				if(ShadowMode == true && (i > 0)){
					showImage(DPImageHigher);
					showImage(DPImageLower);
					GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(DPImageHigher)
					GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(DPImageLower)
				}
			}
			
			if(AutoSaveImages == true ){
				if(debugMode==true){result("\n\t Saving images.");}
				GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(DPImage);
				if(ShadowMode == true && (i > 0)){
					GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(DPImageHigher);
					GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(DPImageLower);
				}
			}
			
		} // End of loop
		
		// If the RingMode is being used then we must generate the full set of DF coordinates
		// NumberOfRingPoints variable is the number of points.
		 
		// Generate Ring Mode Coordinates
		if(RingMode == true){
			// Delete the DF image tag group created by DP imaging previously, except for the first one which is the BF image.
			TagGroup DFToDelete;
			targetImageSet.TagGroupGetTagAsTagGroup("Images", DFToDelete);
			if(debugMode==true){result("\n\tDeleting " + DFToDelete.TagGroupCountTags() + " existing DF image groups except for index 0");}
			while (DFToDelete.TagGroupCountTags() > 1){
				DFToDelete.TagGroupDeleteTagWithIndex(1);
				if(debugMode==true){result("\n\t\tTag removed.");}
			}
			if(debugMode==true){result("\n\tDeleted existing DF image groups.");}
			if(debugMode==true){result("\n\tStarting to create Ring coordinates for DF Imaging.");}
			number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
			number DFExposure = GetScriptObjectFromID(CameraControlObjectID).getDFExposure();
			number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
			GetScriptObjectFromID(dataObjectID).getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
			number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
			number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
			number binning = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
			number beamCentreX = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
			number beamCentreY = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
			number RefScale = GetScriptObjectFromID(dataObjectID).getRefScale();
			
	
			if(debugMode==true){result("\n\tNumber of points to DF is " + NumberOfRingPoints);}
			if(NumberOfRingPoints<=0){
				throw("Wrong number of points.");
			}
			number angleStep = 360 / NumberOfRingPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
			targetImageSet.TagGroupSetTagAsNumber("DegreeStep", angleStep); // record this to the image Set data
			// alpha is angle between X axis and TiltX axis in radians.
			number Px, Py, alpha;
			alpha = atan2(xTiltVectorY, xTiltVectorX);
			// tiltVectorX is the tilt needed to reach the target radius using only xTilt
			number tiltVectorX
			// RingDSpacing is the d-spacing in Angstroms. convert to (1/NM).
			number radiusNM = convertAngstromToInverseNM(RingDSpacing);
			// convert to pixels
			number radiusPX = radiusNM / RefScale;
						
			tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
			if(debugMode==true){
				result("\n\tAlpha for tiltVectorX: " + alpha );
				result("\n\ttan (alpha): " + tan(alpha) );
				result("\n\ttiltVectorX = " + tiltVectorX);
			}
			number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.

			number i, angleToMove, tiltX, tiltY;
			number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
			for(i=0; i < NumberOfRingPoints; i++){
				angleToMove = i * angleStep; // This is in Degrees.
				angleToMove = angleToMove * pi() / 180; // converted to radians
				
				// work out change in tilt to get there.
				tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
				tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
				
				/* debug code to check maths in detail
				if(debugMode==true){result("\n\ti: " + i);}
				if(debugMode==true){result("\n\tAngleToMove: " + angleToMove);}
				if(debugMode==true){result("\n\tsin(angle): " + sin(angleToMove));}
				if(debugMode==true){result("\n\tcos(angle): " + cos(angleToMove));}
				if(debugMode==true){result("\n\tAdditional TiltX: " + (averageTiltVector * sin(angleToMove)));}
				if(debugMode==true){result("\n\tAdditional TiltY: " + (averageTiltVector * sin(angleToMove)));}
				if(debugMode==true){result("\n\t---------");}
				*/
				TagGroup imageGroup = GetScriptObjectFromID(ImageSetToolsID).addImageToCurrentImageSet(); // Create the spot group for this set of images.
				
				TagGroup MiddleCoordinates, HigherCoordinates, LowerCoordinates;
				self.createTiltCoord (tiltX, tiltY, shadowDistanceNM, MiddleCoordinates, HigherCoordinates, LowerCoordinates); 
				
				MiddleCoordinates.TagGroupSetTagAsString("ImageType", "DF");
				MiddleCoordinates.TagGroupSetTagAsNumber("ExposureTime", DFExposure);
				// Add the spot number to this data as well.
				MiddleCoordinates.TagGroupSetTagAsNumber("ImageSpotNumber", i+1); // +1 because 0 is the central BF and all ready there.
				
				GetScriptObjectFromID(ImageSetToolsID).addImageDataToCurrentImageSet(MiddleCoordinates, "Middle"); // add the image data to the Images list
				
				if(ShadowMode == true){
					HigherCoordinates.TagGroupSetTagAsString("ImageType", "DF");
					HigherCoordinates.TagGroupSetTagAsNumber("ExposureTime", DFExposure);
					HigherCoordinates.TagGroupSetTagAsNumber("ImageSpotNumber", i+1);
					GetScriptObjectFromID(ImageSetToolsID).addImageDataToCurrentImageSet(HigherCoordinates, "Higher"); // add the image data to the Images list
					
					LowerCoordinates.TagGroupSetTagAsString("ImageType", "DF");
					LowerCoordinates.TagGroupSetTagAsNumber("ExposureTime", DFExposure);
					LowerCoordinates.TagGroupSetTagAsNumber("ImageSpotNumber", i+1);
					GetScriptObjectFromID(ImageSetToolsID).addImageDataToCurrentImageSet(LowerCoordinates, "Lower"); // add the image data to the Images list
				}				
				
				if(remainder(i,60)==0){ //This part just puts a '.' every 60 calculations as a crude progress bar, and a line break every 60.
					result("\n");
				} else {
					result(".");
				}
			}
			result("\n\tTilt coordinates have been generated for RingMode DF imaging");
		}
		
		showImage(DiffractionPointsRecord);
		
		if(debugMode==true){result("\nAll Diffraction Patterns imaged. Setting DPsTaken flag to 1");}
		// update the image set to show that DP were taken.
		targetImageSet.TagGroupSetTagAsNumber("DPsTaken", 1);
		GetScriptObjectFromID(ProgressBarDialogID).EndProgress(); // end the progress dialog
	}
	
	/* Function will use the stored Tilt values to take darkfield images. 1st Image will be Bright Field of site.
		ImageSet = the image set tag group. Only use the current image set for now.
	*/
	
	number darkFieldImage (object self)
	{
		TagGroup ImageSet = StoredImageSet;
		if(ImageSet.TagGroupIsValid() == false){
			throw("ImageSet Taggroup is Invalid or does not exist.")
		}
		
		number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		number DFExposure = GetScriptObjectFromID(CameraControlObjectID).getDFExposure();
		number BFExposure = GetScriptObjectFromID(CameraControlObjectID).getBFExposure();
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		
		number xTiltCenter = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number yTiltCenter = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
		
		image ReferenceDP = GetScriptObjectFromID(dataObjectID).getReferenceDP();
		
		if(debugMode==true){result("\n Loading the variables for this image set for DF imaging...");}
		string DFImageSetID;
		ImageSet.TagGroupGetTagAsString("ImageSetID", DFImageSetID);
		if(debugMode==true){result("\n\t ImageSetID is " + DFImageSetID);}
		number saveNonIntegrated, saveImages, displaynonintegrated, displayImages;
		ImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", saveNonIntegrated);
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", saveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", displaynonintegrated);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", displayImages);

		if(saveImages == 0 && displayImages == 0){
			throw("Images must be shown, saved or both.");
		}
		
		number integration
		ImageSet.TagGroupGetTagAsNumber("IntegratedImage", integration);
		if(debugMode==true){result("\n\t integration is " + integration);}
		
		number ringMode
		ImageSet.TagGroupGetTagAsNumber("RingMode", ringMode);
		if(debugMode==true){result("\n\t RingMode is " + RingMode);}
		
		number shadowMode
		ImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode);
		if(debugMode==true){result("\n\t ShadowMode is " + shadowMode);}
		
		number numberOfIntegrations
		ImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		if(debugMode==true){result("\n\t NumberOfIntegrations is " + NumberOfIntegrations);}
		
		number degreeStep
		ImageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		if(debugMode==true){result("\n\t DegreeStep is " + DegreeStep);}
		
		number shadowDistance
		ImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		if(debugMode==true){result("\n\t shadowDistance is " + shadowDistance);}
		
		image startBFImage;
		image middleIntegratedImage, higherIntegratedImage, lowerIntegratedImage;
		image middleSumImage, higherSumImage, lowerSumImage;
		
		if(integration == 1){
			if(debugMode==true){result("\nCreating Integrated Images to populate...");}
			middleIntegratedImage = RealImage( "Integrated Image Middle", 4, cameraWidth, cameraHeight );
			middleIntegratedImage = middleIntegratedImage * 0;
			higherIntegratedImage = RealImage( "Integrated Image Higher", 4, cameraWidth, cameraHeight );
			higherIntegratedImage = higherIntegratedImage * 0;
			lowerIntegratedImage = RealImage( "Integrated Image Lower", 4, cameraWidth, cameraHeight );
			lowerIntegratedImage = lowerIntegratedImage * 0;
			
			middleSumImage = RealImage( "Sum of all middle", 4, cameraWidth, cameraHeight );
			middleSumImage = middleSumImage * 0;
			higherSumImage = RealImage( "Sum of all top", 4, cameraWidth, cameraHeight );
			higherSumImage = higherSumImage * 0;
			lowerSumImage = RealImage( "Sum of all lower", 4, cameraWidth, cameraHeight );
			lowerSumImage = lowerSumImage * 0;
		}
		
		TagGroup DFImages;
		if (ImageSet.TagGroupGetTagAsTagGroup("Images", DFImages) == false){
			throw("An Error was encountered when loading the dark field image tag group data.")
		}
		
		number TotalExposures = DFImages.TagGroupCountTags() + (DFImages.TagGroupCountTags() * 2 * shadowMode);
		number TotalSpots = DFImages.TagGroupCountTags();
		
		Result("\n------------- Starting Dark Field Imaging Process ---------------\n");
		result("\n" + TotalExposures + " exposures to take, taking " + (DFExposure * TotalExposures / 60) + " minutes.");
		
		if (!ContinueCancelDialog( "Insert the Objective Aperture and center it. Switch to Imaging Mode and check the Brightfield image before continuing." )){
			throw("Aborted by User. No data changed.")
		}
		
		// Set up the progress bar system.
		GetScriptObjectFromID(ProgressBarDialogID).makeDialog(); //command to start the progress bar dialog.
		GetScriptObjectFromID(ProgressBarDialogID).setProgressPercent(0);
		// Check if the image acquisition has been cancelled by the user
		if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
			result("\n\n Break signal recieved. Ending Darkfield imaging thread.")
			return 0;
		}
		
		// Create the first image, which will always be a bright field image of the region
		moveBeamTilt(xTiltCenter, yTiltCenter); // Move to the tilt coords
		TagGroup BFImageTags;
		startBFImage := self.takeBFImage(ImageSet, BFImageTags);
		
		if(displayImages == true && saveImages == true)
		{
			showImage(startBFImage);
			GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(startBFImage);
			GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(startBFImage);
		} else		
		if(saveImages == true){
			GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(startBFImage);
		} else
		if(displayImages == true)
		{
			showImage(startBFImage);
			GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(startBFImage);
		}
		
		if(debugMode==true){result("\n Bright Field Image taken and saved/displayed.");}
		
		// Code used to save integrated files, which are not yet part of the saveImageInImageSet() function.
		string fileDirectory, fileName;
		string saveDir = GetApplicationDirectory( 1100, 1 );
			// index 1100 = autosave
		string imageSetDir = PathConcatenate(saveDir, DFImageSetID);
		number imageSetDirExists = DoesDirectoryExist( imageSetDir );
		if(imageSetDirExists == false){
			fileDirectory = saveDir;
		} else {
			fileDirectory = imageSetDir;
		}
		
		if(debugMode==true){result("\n Starting to record Darkfield Images.");}
		number im
		for(im=1; im < TotalSpots ; im++){
			// Check if the image acquisition has been cancelled by the user
			if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
				result("\n\n Break signal recieved. Ending Darkfield imaging thread.")
				return 0;
			}
			
			// update the progress bar %
			number percentComplete = im / TotalSpots;
			GetScriptObjectFromID(ProgressBarDialogID).setProgressPercent(percentComplete);
		
			TagGroup ThisSpotGroup, MiddleImage, HigherImage, LowerImage;
			TagGroup MiddleImageTags, HigherImageTags, LowerImageTags;			
			image MiddleDFImage, HigherDFImage, LowerDFImage;
			
			if(debugMode==true){result("\n\t Loading data for spot " + im + "... ");}
			DFImages.TagGroupGetIndexedTagAsTagGroup(im, ThisSpotGroup); // The image group
			ThisSpotGroup.TagGroupGetTagAsTagGroup("Middle", MiddleImage);
			ThisSpotGroup.TagGroupGetTagAsTagGroup("Higher", HigherImage);
			ThisSpotGroup.TagGroupGetTagAsTagGroup("Lower", LowerImage);
			if(debugMode==true){result("\t Loading Complete.");}
			
			if(debugMode==true){result("\n\t Taking Middle Image for spot " + im);}
			MiddleDFImage := self.takeDFImage (ImageSet, im, "Middle", MiddleImageTags);
			
			// If there are no Lower or Higher tag groups then the Higher/Lower tags in the Images:[im]: group will be empty BUT STILL EXIST
			// The loaded groups (LowerImage/HigherImage) will report as invalid if this is the case.
			// Previous version code used the DoesTagExist() function instead, but this was not correct.
			if(HigherImage.TagGroupIsValid() == true){
				if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
					result("\n\n Break signal recieved. Ending Darkfield imaging thread.")
					return 0;
				}
				HigherDFImage := self.takeDFImage (ImageSet, im, "Higher", HigherImageTags);
			}
			if(LowerImage.TagGroupIsValid() == true){
				if(GetScriptObjectFromID(ProgressBarDialogID).getDoBreak() == true){
					result("\n\n Break signal recieved. Ending Darkfield imaging thread.")
					return 0;
				}
				LowerDFImage := self.takeDFImage (ImageSet, im, "Lower", LowerImageTags);
			}
			
			if(debugMode==true){result("\n\t Saving images for image group " + im);}
			if(saveImages == true){
				if((integration == 0) || (saveNonIntegrated == 1)){ // Saves each image. Integrations must be done seperately.
					GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(MiddleDFImage);
					if(HigherImage.TagGroupIsValid() == true){
						GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(HigherDFImage);
					}
					if(LowerImage.TagGroupIsValid() == true){
						GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(LowerDFImage);
					}
				}
			} else { // If not saving the image...
				MiddleImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
				if(HigherImage.TagGroupIsValid() == true){
					HigherImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
				if(LowerImage.TagGroupIsValid() == true){
					LowerImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
			}
			
			if(debugMode==true){result("\n\t Displaying images for spot " + im);}
			if(displayImages == true) // If displaying the images...
			{
				if((integration == 0) || (displayNonIntegrated == 1)){ // Does not show the integrated images. These must be done seperately.
					showImage(MiddleDFImage);
					GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(MiddleDFImage);
					if(HigherImage.TagGroupIsValid() == true){
						showImage(HigherDFImage);
						GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(HigherDFImage);
					}
					if(LowerImage.TagGroupIsValid() == true){
						showImage(LowerDFImage);
						GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(LowerDFImage);
					}
				}
			}
			
			if(debugMode==true){result("\n\t Integrating images for spot " + im);}
			// If in Integrated image mode add it to the current integration image and display any completed integrated images.
			if(integration==true){
				if(debugMode==true){result("\n\t\t Middle ");}
				middleIntegratedImage = middleIntegratedImage + MiddleDFImage;
				if(debugMode==true){result(" integrated.");}
				if(shadowMode == true){
					if(debugMode==true){result("\n\t\t Higher ");}
					higherIntegratedImage = higherIntegratedImage + HigherDFImage;
					if(debugMode==true){result(" integrated.");}
					if(debugMode==true){result("\n\t\t Lower ");}
					lowerIntegratedImage = lowerIntegratedImage + LowerDFImage;
					if(debugMode==true){result(" integrated.");}
				}
				
				if(remainder(im, NumberOfIntegrations) == 0){ // save this integrated image and start a new one.
					if(debugMode==true){result("\nNumberOfIntegrations reached.");}
					middleSumImage = middleSumImage + middleIntegratedImage;
					middleIntegratedImage.ImageSetName( "Integrated Image " + im + " Middle" );
					if(displayImages == true){
						image toShow = middleIntegratedImage.ImageClone();
						copyTags(toShow, MiddleDFImage); // Put the image tags from the individual exposure onto the integrated image
						showImage( toShow );
					}
					if(saveImages == true){
						fileName = "Integrated_Image_" + im + "_Middle";
						string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
						copyTags(middleIntegratedImage, MiddleDFImage); // Put the image tags from the individual exposure onto the integrated image
						SaveAsGatan(middleIntegratedImage, filePath);
					}
					result("\nIntegrated " + NumberOfIntegrations + " exposures into Integrated Image " + im);
					middleIntegratedImage = middleIntegratedImage * 0; // Set old image to 0 for next integration sequence.
										
					if(HigherImage.TagGroupIsValid() == true){
						higherSumImage = higherSumImage + higherIntegratedImage;
						higherIntegratedImage.ImageSetName( "Integrated Image " + im + " Higher" );
						if(displayImages == true){
							image toShow = higherIntegratedImage.ImageClone();
							copyTags(toShow, HigherDFImage); // Put the image tags from the individual exposure onto the integrated image
							showImage( toShow );
						}
						if(saveImages == true){
							fileName = "Integrated_Image_" + im + "_Higher";
							string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
							copyTags(higherIntegratedImage, HigherDFImage); // Put the image tags from the individual exposure onto the integrated image
							SaveAsGatan(higherIntegratedImage, filePath);
						}
						higherIntegratedImage = higherIntegratedImage * 0; // Set old image to 0 for next integration sequence.
					}
					if(LowerImage.TagGroupIsValid() == true){
						lowerSumImage = lowerSumImage + lowerIntegratedImage;
						lowerIntegratedImage.ImageSetName( "Integrated Image " + im + " Lower" );
						if(displayImages == true){
							image toShow = lowerIntegratedImage.ImageClone();
							copyTags(toShow, lowerDFImage); // Put the image tags from the individual exposure onto the integrated image
							showImage( toShow );
						}
						if(saveImages == true){
							fileName = "Integrated_Image_" + im + "_Lower";
							string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
							copyTags(lowerIntegratedImage, lowerDFImage); // Put the image tags from the individual exposure onto the integrated image
							SaveAsGatan(lowerIntegratedImage, filePath);
						}
						lowerIntegratedImage = lowerIntegratedImage * 0; // Set old image to 0 for next integration sequence.
					}
				}
			} // end of integration section
			if(debugMode==true){result("\n\t Completed operations for spot " + im);}
		} // end of for loop
		
		// Create the final BF image to compare to the start. This can track drift.
		if(debugMode==true){result("\n Taking Final BF Image...");}
		image endBFImage;
		TagGroup EndBFImageTags;
		GetScriptObjectFromID(CameraControlObjectID).beamCentre();
		endBFImage := self.takeBFImage(ImageSet, EndBFImageTags);
		
		GetScriptObjectFromID(ProgressBarDialogID).setProgressPercent(1);
		
		if(saveImages == 1){
			GetScriptObjectFromID(ImageSetToolsID).saveImageInImageSet(endBFImage);
		} else { // If not saving the image...
			EndBFImageTags.TagGroupSetTagAsNumber("SavedAsFile", 0);
		}
		
		if(displayImages == true) // If displaying the image...
		{
			showImage(endBFImage);
			GetScriptObjectFromID(ImageSetToolsID).nameDisplayedImageInImageSet(endBFImage);
		}
		if(debugMode==true){result("\n BF Image operations complete.");}
		
		// Find the image drift.
		if(debugMode==true){result("\n Calculating image drift during exposures...");}
		number xShiftBF, yShiftBF;
		findImageShift(startBFImage, endBFImage, xShiftBF, yShiftBF, debugMode);
		result("\nDuring the exposures the image drifted by (" + xShiftBF + ", " + yShiftBF + ") pixels")
		
		if(integration==true){ //show or save the sum images
			if(saveImages){
				fileName = "Sum_Of_Integrated_Images_Middle"
				string fileDirectory = GetApplicationDirectory("auto_save", 0);
				string filePath = PathConcatenate(fileDirectory, fileName);
				SaveAsGatan( middleSumImage, filePath );
				result("\nSaved sum of integration images as " + filePath);
				if(shadowMode == true){
					fileName = "Sum_Of_Integrated_Images_Higher"
					filePath = PathConcatenate(fileDirectory, fileName);
					SaveAsGatan( higherSumImage, filePath );

					fileName = "Sum_Of_Integrated_Images_Lower"
					filePath = PathConcatenate(fileDirectory, fileName);
					SaveAsGatan( lowerSumImage, filePath );
				}
			}
			if(displayImages == true){
				showImage(middleSumImage);
				if(shadowMode == true){
					showImage(higherSumImage);
					showImage(lowerSumImage);
				}
			}
		}

		GetScriptObjectFromID(CameraControlObjectID).positionViewWindow(); //Return View Window to the front if it is not all ready
		
		GetScriptObjectFromID(ImageSetToolsID).exportImageSetAsGTG(ImageSet); // Save the image set tag group as its own file.
		GetScriptObjectFromID(ProgressBarDialogID).EndProgress();
		Result("\n------------- Ending Dark Field Imaging Process ---------------\n");
		return 1;
	}
	
	/* 	Function that performs the Calibration process
			Take image of the DP for reference when storing.
			// Store the central beam as the first data point. Do we still do this with the new tags?
			Calibrate the Tilt Vectors (pixels per tilt unit)
			Returns 0 if calibration is complete, 0 if it is cancelled or fails.
	 */
	 
	 number startDPStoring(object self){
		// Load data from dataObject
		// Not Reference DP. That is set later.
		number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		GetScriptObjectFromID(dataObjectID).getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		if(debugMode==true){result("\nstartDPStoring()");}
		
		number refScaleX, refScaleY;
		refScaleX = GetScriptObjectFromID(dataObjectID).getRefScale();
		if(debugMode==true){result("\nrefScaleX: " + refScaleX);}
		if(refScaleX == 0){
			throw("Please set Camera Length");
		}		
		
		// Update the camera values: binningMultiplier, and Reference DP image.
		GetScriptObjectFromID(CameraControlObjectID).storeCameraDetails();
		
		image viewImage;
		if(GetScriptObjectFromID(CameraControlObjectID).returnViewImage(viewImage) == false){
			result("\nNo view Image detected. This error should not be possible, but here we are.");
		}	

		// Set central Tilt values
		GetScriptObjectFromID(dataObjectID).setCentreTiltHere();
		
		number xTilt, yTilt;
		EMGetBeamTilt(xTilt, yTilt);
		number xTiltRelative = 0;
		number yTiltRelative = 0;

		if(xTiltVectorX != 0){
			result("\nCurrent Tilt Vector settings are:");
			result("\n\txTilt(X): " + xTiltVectorX);
			result("\n\txTilt(Y): " + xTiltVectorY);
			result("\n\tyTilt(X): " + yTiltVectorX);
			result("\n\tyTilt(Y): " + yTiltVectorY);
			/*Boolean TwoButtonDialog( String prompt, String acceptLabel, String rejectLabel )*/
			if(TwoButtonDialog("Use existing tilt vector values?", "Yes", "No")){
				return 1; // system is calibrated.
			}
		}
		
		number centreXTilt = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number centreYTilt = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
		/* This part gets the tilt vectors. */
		// X TILT
		result("\n\n\tPlease move the pattern to the approximate d-spacing you will be imaging using the X-TILT control.");
		if (!ContinueCancelDialog( "Please move the pattern to the approximate d-spacing you will be imaging using the X-TILT control." )){
			return 0; // system is not calibrated.
		}
		result("\nStoring X-Tilt pattern...");
		image xTiltDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
		number xTiltPixelShiftX, xTiltPixelShiftY, xTiltShiftX, xTiltShiftY;
		EMGetBeamTilt(xTiltShiftX,xTiltShiftY);
		xTiltShiftX = xTiltShiftX - centreXTilt;
		findImageShift(GetScriptObjectFromID(dataObjectID).getReferenceDP(), xTiltDP, xTiltPixelShiftX, xTiltPixelShiftY, debugMode);
		xTiltVectorX = xTiltPixelShiftX / xTiltShiftX;
		if(isNaN(xTiltVectorX)||isInfinite(xTiltVectorX)){
			xTiltVectorX = 0;
		}
		xTiltVectorY = xTiltPixelShiftY / xTiltShiftX;
		if(isNaN(xTiltVectorY)||isInfinite(xTiltVectorY)){
			xTiltVectorY = 0;
		}
		if(debugMode==true){
			result("\nxTiltShiftX was " + xTiltShiftX);
			result("\nxTiltPixelShiftX was " + xTiltPixelShiftX + " and xTiltPixelShiftY was " + xTiltPixelShiftY);
			result("\nxTiltVectorX was " + xTiltVectorX + " and xTiltVectorY was " + xTiltVectorY);
		}
		closeImage(xTiltDP);
		
		GetScriptObjectFromID(CameraControlObjectID).beamCentre();
		
		// Y TILT
		Result("\n\n\tPlease move the pattern to the approximate d-spacing you will be imaging using the Y-TILT control.")
		if (!ContinueCancelDialog( "Please move the pattern to the approximate d-spacing you will be imaging using the Y-TILT control." )){
			return 0; // system is not calibrated
		}
		result("\nStoring Y-Tilt pattern...");
		image yTiltDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
		number yTiltPixelShiftX, yTiltPixelShiftY, yTiltShiftX, yTiltShiftY;
		EMGetBeamTilt(yTiltShiftX,yTiltShiftY);
		yTiltShiftY = yTiltShiftY - centreYTilt;
		findImageShift(GetScriptObjectFromID(dataObjectID).getReferenceDP(), yTiltDP, yTiltPixelShiftX, yTiltPixelShiftY, debugMode);
		yTiltVectorX = yTiltPixelShiftX / yTiltShiftY;
		yTiltVectorY = yTiltPixelShiftY / yTiltShiftY;
		if(isNaN(yTiltVectorX)||isInfinite(yTiltVectorX)){
			yTiltVectorX = 0;
		}
		yTiltVectorY = yTiltPixelShiftY / yTiltShiftY;
		if(isNaN(yTiltVectorY)||isInfinite(yTiltVectorY)){
			yTiltVectorY = 0;
		}
		if(debugMode==true){
			result("\nyTiltShiftY was " + yTiltShiftY);
			result("\nyTiltPixelShiftX was " + yTiltPixelShiftX + " and yTiltPixelShiftY was " + yTiltPixelShiftY);
			result("\nyTiltVectorX was " + yTiltVectorX + " and yTiltVectorY was " + yTiltVectorY);
		}
		closeImage(yTiltDP);
		GetScriptObjectFromID(CameraControlObjectID).beamCentre();
		TagGroup vectors = NewTagGroup();
		vectors.TagGroupCreateNewLabeledTag("xTiltx");
		vectors.TagGroupCreateNewLabeledTag("xTilty");
		vectors.TagGroupCreateNewLabeledTag("yTiltx");
		vectors.TagGroupCreateNewLabeledTag("yTilty");
		vectors.TagGroupSetTagAsNumber("xTiltx", xTiltVectorX);
		vectors.TagGroupSetTagAsNumber("xTilty", xTiltVectorY);
		vectors.TagGroupSetTagAsNumber("yTiltx", yTiltVectorX);
		vectors.TagGroupSetTagAsNumber("yTilty", yTiltVectorY);
		GetScriptObjectFromID(dataObjectID).setTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		GetScriptObjectFromID(dataObjectID).setTiltVectorCalibrations(GetScriptObjectFromID(dataObjectID).getCameraLength(), vectors);
		
		// What do we do about generating / updating ImageSets?

		result("\nCalibration Complete.");
		return 1; // system is calibrated.
	}

	/* Function to take a pixel radius and load the calculated tilt coordinates into the data array */
	
	void loadRingPoints (object self, number radiusPX, number shadowDistanceNM, number numberOfPoints )
	{
		// Load data from dataObject
		if(debugMode==true){result("\nStarting to create Ring Data Points.");}
		number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		number DFExposure = GetScriptObjectFromID(CameraControlObjectID).getDFExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		GetScriptObjectFromID(dataObjectID).getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number binning = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		number beamCentreX = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number beamCentreY = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
		
		TagGroup newImageSet = GetScriptObjectFromID(imageSetToolsID).createNewImageSet();
		newImageSet.TagGroupSetTagAsNumber("RingMode", 1);
		newImageSet.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
		newImageSet.TagGroupSetTagAsNumber("DSpacingAng", GetScriptObjectFromID(dataObjectID).convertPixelDistanceToNM(radiusPX, 0, binning));
		
		if(debugMode==true){result("\n\tData Object loaded into variables.");}

		// If not calibrated stop here!
		if((xTiltVectorX==0) && (xTiltVectorY==0) && (yTiltVectorX==0) && (yTiltVectorY==0)){
			throw("Please perform the tilt calibration first.")
		}
		
		if(debugMode==true){result("\n\tNumber of points is " + numberOfPoints);}
		if(numberOfPoints<=0){
			throw("Wrong number of points.");
		}
		number angleStep = 360 / numberOfPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
		newImageSet.TagGroupSetTagAsNumber("DegreeStep", angleStep); // record this to the image Set data
		// alpha is angle between X axis and TiltX axis in radians.
		number Px, Py, alpha;
		alpha = atan2(xTiltVectorY, xTiltVectorX);
		// tiltVectorX is the tilt needed to reach the target radius using only xTilt
		number tiltVectorX
		
		/* debug code for checking maths
		if(debugMode==true){result("\nTiltVectorX Calculation values:");}
		if(debugMode==true){result("\n\tRadiusPX: " + radiusPX);}
		if(debugMode==true){result("\n\tRadiusPX ^ 2: " + radiusPX**2);}
		if(debugMode==true){result("\n\txTiltVectorX: " + xTiltVectorX);}
		if(debugMode==true){result("\n\txTiltVectorX ^ 2: " + xTiltVectorX**2);}
		if(debugMode==true){result("\n\ttan(alpha): " + tan(alpha));}
		if(debugMode==true){result("\n\ttan(alpha) ^ 2: " + tan(alpha)**2);}
		if(debugMode==true){result("\n\tTiltVectorX ^ 2: " + radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ));}
		*/
		
		tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
		if(debugMode==true){
			result("\n\tAlpha for tiltVectorX: " + alpha );
			result("\n\ttan (alpha): " + tan(alpha) );
			result("\n\ttiltVectorX = " + tiltVectorX);
		}
		number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.
		
		number estimatedTime = numberOfPoints * DFExposure / 60;
		if (!ContinueCancelDialog( "Complete darkfield imaging of this ring will take approximately " + estimatedTime + " minutes. Would you like to target these points?" )){
			throw("Cancelled by User");
		}
		GetScriptObjectFromID(imageSetToolsID).addImageSet(newImageSet); // add image set to toolkit now that it is confirmed.
		result("\nGenerating Tilt coordinates...");

		number i, angleToMove, tiltX, tiltY;
		number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
		for(i=0; i < numberOfPoints; i++){
			angleToMove = i * angleStep; // This is in Degrees.
			angleToMove = angleToMove * pi() / 180; // converted to radians
			
			// work out change in tilt to get there.
			tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
			tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
			
			number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
			xTiltRelative = tiltX - beamCentreX
			yTiltRelative = tiltY - beamCentreY;
			
			/* debug code to check maths in detail
			if(debugMode==true){result("\n\ti: " + i);}
			if(debugMode==true){result("\n\tAngleToMove: " + angleToMove);}
			if(debugMode==true){result("\n\tsin(angle): " + sin(angleToMove));}
			if(debugMode==true){result("\n\tcos(angle): " + cos(angleToMove));}
			if(debugMode==true){result("\n\tAdditional TiltX: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\tAdditional TiltY: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\t---------");}
			*/
			
			TagGroup thisImage = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet();
			thisImage.TagGroupSetTagAsString("ImageType", "DP");
			thisImage.TagGroupSetTagAsNumber("ExposureTime", DPExposure);
			thisImage.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
			thisImage.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);		
			thisImage.TagGroupSetTagAsNumber("XTiltValue", tiltX);
			thisImage.TagGroupSetTagAsNumber("YTiltValue", tiltY);
			thisImage.TagGroupSetTagAsNumber("ShadowValue", 1);
			thisImage.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM);
			thisImage.TagGroupSetTagAsNumber("DSpacingAng", GetScriptObjectFromID(dataObjectID).convertPixelDistanceToNM(radiusPX, 0, binning));

			if(remainder(i,60)==0){ //This part just puts a '.' every calculations as a crude progress bar, and a line break every 60.
				result("\n");
			} else {
				result(".");
			}
		}
		result("\nTilt coordinates have been generated for darkfield imaging");
	 }

	/* Function to record a selection of diffraction patterns from a ring dataset.
		ImageSet - tag group generated by loadRingPoints
		numberOfDP - number of DPs to take. They will be distributed evenly around the ring.
		Note: saveImages and displayImages can both be set to 0 to skip this process entirely.
		
		Returns 1/0 to indicate failure or success.
	*/
	number imageRingDP (object self, TagGroup ImageSet, number numberOfDP)
	{
		number saveImages, displayImages
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", saveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", displayImages);
		
		if( saveImages == 0 && displayImages == 0 ){
			result("No diffraction patterns of the ring were taken because the save images and display images inputs were both 0");
			return 1;
		}
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		GetScriptObjectFromID(dataObjectID).getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number binning = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		number DPExposure = GetScriptObjectFromID(CameraControlObjectID).getDPExposure();
		number beamCentreX = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
		number beamCentreY = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
		
		TagGroup spots
		ImageSet.TagGroupGetTagAsTagGroup("Spots", spots);
		number TotalSpots = spots.TagGroupCountTags();
		
		number i
		for(i=0; i < numberOfDP; i++){
			number j = 1 + round(( TotalSpots / numberOfDP ) * i)
			// Load coordinates 
			TagGroup thisDP
			spots.TagGroupGetIndexedTagAsTagGroup(j, thisDP);
			number XTiltRelative, YTiltRelative;
			thisDP.TagGroupGetTagAsNumber("XTiltRelative", XTiltRelative);
			thisDP.TagGroupGetTagAsNumber("YTiltRelative", YTiltRelative);
			// Move there
			moveBeamTilt( XTiltRelative + beamCentreX, YTiltRelative + beamCentreY );
			// Take image
			image DPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
			string angleName = " ";
			angleName = angleName + round (360 / (numberOfDP * (i+1) ));
			string fileName = "Ring at " + angleName + " deg"
			DPImage.ImageSetName(fileName);
			showImage(DPImage);
			number refScaleX = GetScriptObjectFromID(dataObjectID).getRefScale(); // Fix the image's scale for future use.
			ImageSetDimensionScale(DPImage, 0, refScaleX)
			ImageSetDimensionUnitString(DPImage, 0, "1/nm" )
			ImageSetDimensionScale(DPImage, 1, refScaleX)
			ImageSetDimensionUnitString(DPImage, 1, "1/nm" )
			
			self.drawReticle(DPImage, 1); // add the reticle so that the exact spot targetted can be seen
			
			DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // Image can be closed without saving warning.
			if(saveImages == true){
				string fileDirectory = GetApplicationDirectory("auto_save", 0);
				string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
				SaveAsGatan( DPImage, filePath );
			}
			if(displayImages == false){
				DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // just added
				closeImage( DPImage );
			}
		}
		GetScriptObjectFromID(CameraControlObjectID).beamCentre();
		return 1;
	} 
	
	// This function saves the current tilt setting for the current ImageSet with the storeTiltCoord() function.
	// Does not create any images or move the beam.
	number StoreDP (object self)
	{
		// Is there an open imageSet?
		TagGroup targetImageSet
		number isCurrent = GetScriptObjectFromID(imageSetToolsID).getCurrentImageSet(targetImageSet)
		if(isCurrent == 0){
			Throw("There is no Image set to save this point inside. Please create one.");
		}
		// Has the imageSet been finalized, and so does not accept new points.
		// Boolean TagGroupGetTagAsNumber( TagGroup tagGroup, String tagPath, NumberVariable number )
		number DPsTaken
		if(targetImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken) == 0){
			result("\n\tImage Set does not have the DPSTaken tag. This is an error.");
			Throw("Image Set Error: No DPsTaken flag.");
		} 
		if(DPsTaken == 1){
			result("\n\tImage Set has been finalized and cannot have any more spots added.");
			throw("Image Set has been finalized.");
		}
		number xTilt, yTilt
		EMGetBeamTilt(xTilt, yTilt);
		number shadowDistanceNM, shadowMode;
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode) == 0){
			result("\n\tImage Set does not have the ShadowMode tag. This is an error.");
			Throw("Image Set Error: No ShadowMode flag.");
			if(targetImageSet.TagGroupGetTagAsNumber("ShadowDistance", shadowDistanceNM) == 0){
				result("\n\tImage Set does not have the ShadpwDistance tag. This is an error.");
				Throw("Image Set Error: No ShadowDistance flag.");
			}
		}
		if(ShadowMode == 0){ // the shadow distance can be a non-0 value, yet not be used.
			shadowDistanceNM = 0;
		}
		// void storeTiltCoord (object self, number xTilt, number yTilt, number shadowDistance)
		self.storeTiltCoord ( xTilt, yTilt, shadowDistanceNM );
		return 1;
	}
	
	
	/* Function called on to store the data for ROI points on the live view screen.
		returns 0 if there is a problem, 1 on success.
	*/
	number storeAllROI (object self)
	{
		// Get the total number of ROI on the screen
		ImageDisplay viewDisplay
		if(GetScriptObjectFromID(CameraControlObjectID).returnViewImageDisplay(viewDisplay) == false){
			result("\n\n No Live View window found");
			return 0;
		}
		// Is there an open imageSet?
		TagGroup targetImageSet
		number isCurrent = GetScriptObjectFromID(imageSetToolsID).getCurrentImageSet(targetImageSet)
		if(isCurrent == 0){
			result("\n\n There is no Image Set to save this point inside. Please create one.");
			return 0;
		}
		// Has the imageSet been finalized, and so does not accept new points?
		// Boolean TagGroupGetTagAsNumber( TagGroup tagGroup, String tagPath, NumberVariable number )
		number DPsTaken
		if(targetImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken) == 0){
			result("\n\tImage Set does not have the DPSTaken tag. This is an error.");
			return 0;
		} 
		if(DPsTaken == 1){
			result("\n\tImage Set has been finalized and cannot have any more spots added.");
			result("\n\tPlease create a new image set.");
			return 0;
		}
					
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==true){result("\nThere are " + totalROI + " ROI highlighted on the View Window before any shadowing.");}
		if(totalROI < 1)
		{ 
			result("No ROI are present.")
			return 0;
		}
		
		number shadowDistanceNM, shadowMode;
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowMode", shadowMode) == 0){
			result("\n\tImage Set does not have the ShadowMode tag. This is an error.");
			return 0;
		}
		if(targetImageSet.TagGroupGetTagAsNumber("ShadowDistance", shadowDistanceNM) == 0){
			result("\n\tImage Set does not have the ShadpwDistance tag. This is an error.");
			return 0;
		}
		if(ShadowMode == 0){ // the shadow distance can be a non-0 value, yet not be used.
			shadowDistanceNM = 0;
		}
		if(ShadowMode==1 && shadowDistanceNM==0){
			result("\n\tImage Set shadowing distance is set to 0, but the shadow mode option is On.");
			return 0;
		}
		
		if(debugMode==true){result("\nCreating ROI List...");}
		if(debugMode==true){result("\n\tROIs present: " + totalROI);}
		// use an image to store ROI data, since this is an easy way to make an array of numbers.
		image ROIData := IntegerImage("ROI ID List", 4, 0, totalROI, 2);
		number i
		for(i=0;i<totalROI;i++){
			if(debugMode==true){result("\n\t\tROI " + i);}
			ROI targetROI = viewDisplay.ImageDisplayGetROI(i)
			number ROIID = targetROI.ROIGetID();
			if(debugMode==true){result(" has ID " + ROIID);}
			setPixel(ROIData, i , 0, ROIID);
			setPixel(ROIData, i , 1, i);
		}
		if(debugMode==true){result("\nROI List created.");}
		
		if(debugMode==true){result("\nGenerating tilt coordinates for these ROIs...");}
		for(i=0; i < totalROI; i++)
		{
			result("\n\tROI " + (i+1) + " of " + totalROI);
			if(debugMode==true){result("\nROI " + (i+1) + " of " + totalROI +  " has index ");}
			number indexValue = getPixel(ROIData, i, 1);
			if(debugMode==true){result(indexValue);}
			GetScriptObjectFromID(dataObjectID).setROITracker(indexValue); // Set ROI tracker number
			
			ROI ROItoMoveTo = viewDisplay.ImageDisplayGetROI( indexValue );
			number xPixel, yPixel, xTiltTarget, yTiltTarget;
			if(ROItoMoveTo.ROIIsPoint() != 1){
				if(debugMode==true){result("\n\tROI #" + indexValue + " is not a point. Skipping over it.");}
				continue;
			}

			ROItoMoveTo.ROIGetPoint(xPixel, yPixel);
			if(debugMode==1){result("\n\txPixel = " + xPixel + " yPixel = " + yPixel);}
			// void pixelToTilt(object dataObject, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,
			//			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly, number binningMultiplier)
			number binningMultiplier = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
			GetScriptObjectFromID(dataObjectID).pixelToTilt(xPixel, yPixel, xTiltTarget, yTiltTarget, 1, 0, 0, binningMultiplier);
			if(debugMode==1){result("\n\txTiltTarget = " + xTiltTarget + " yTiltTarget = " + yTiltTarget);}

			self.storeTiltCoord(xTiltTarget, yTiltTarget, shadowDistanceNM); // Store it in the system + Shadow.
		}
		if(debugMode==true){result("\nAll ROIs stored.");}
		return 1;
	}
	
	/* Function to change the Tilt to centre on a marked ROI point */
	// Number ImageDisplayCountROIs( ImageDisplay imgDisp )
	// ROI ImageDisplayGetROI( ImageDisplay imgDisp, Number index )
	void moveToROI (object self){
		if(debugMode==1){result("\nStart moveToCurrentROI function.");}
		if(isCalibrated == false){
			throw("The toolkit must be calibrated to use this function");
		}
		number ROITracker = GetScriptObjectFromID(dataObjectID).getROITracker(); // This value determines which ROI to go to.
		if(debugMode==1){result("\n\tROITracker = " + ROITracker);}
		ImageDisplay viewDisplay;
		if(GetScriptObjectFromID(CameraControlObjectID).returnViewImageDisplay(viewDisplay) == false){
			result("\nNo active View Window detected. This should never happen.");
			return;
		}
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==1){result("\n\tTotal ROIs = " + totalROI);}
		if( totalROI==0 ){
			if(debugMode == true){result("\nNo ROI to go to.");}
			return;
		}
		if ( totalROI <= ROITracker){ // The tracker is higher than the highest ROI (which starts at 0) .
			//Resets the count to 0 to avoid out-of-bounds errors and goes to Beam Centre instead.
			if(debugMode==1){result("\nCycled through the available ROI. Returning to centre.");}
			GetScriptObjectFromID(dataObjectID).setROITracker(0);
			if(debugMode==1){result("\nSet ROITracker to 0. Returning to Beam Centre");}
			GetScriptObjectFromID(CameraControlObjectID).beamCentre();
			return;
		}
		ROI ROItoMoveTo = viewDisplay.ImageDisplayGetROI( ROITracker );
		number xPixel, yPixel, xTiltTarget, yTiltTarget;
		if(ROItoMoveTo.ROIIsPoint() != 1){
			if(debugMode == 1){result("\n\tROI #" + ROITracker + " is not a point. Skipping over it.");}
			GetScriptObjectFromID(dataObjectID).setROITracker(ROITracker + 1);
		} else
		{
			ROItoMoveTo.ROIGetPoint(xPixel, yPixel);
			if(debugMode==1){result("\n\txPixel = " + xPixel + " yPixel = " + yPixel);}
			// void pixelToTilt(object dataObject, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,
			//			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly)
			number binningMultiplier = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
			GetScriptObjectFromID(dataObjectID).pixelToTilt(xPixel, yPixel, xTiltTarget, yTiltTarget, 1, 0, 0, binningMultiplier);
			if(debugMode==1){result("\n\txTiltTarget = " + xTiltTarget + " yTiltTarget = " + yTiltTarget);}
			moveBeamTilt(xTiltTarget, yTiltTarget);
			GetScriptObjectFromID(dataObjectID).setROITracker(ROITracker + 1);
		}
	}
	
	// The constructor
	ImagingFunctions(object self)
	{
		ImagingFunctionsID = self.ScriptObjectGetID(); // This stores the dialog's object ID.
	}

	// The destructor (does nothing)
	~ImagingFunctions(object self)
	{
		result("\n Imaging Functions Object with ID: "+self.ScriptObjectGetID()+" closed.");
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Imaging Functions Object");}
	}
}

