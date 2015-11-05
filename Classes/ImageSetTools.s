// ********************************************************************************
//  Class containing Functions to create and manipulate Image Sets and Image Tags
// ********************************************************************************

// Tools to create image & image set configuration tag groups.
// Tools to parse the tag groups it creates.
// Store tag groups as text files and data files.

class ImageSetTools
{
	number ToolkitID;
	number dataObjectID
	number ImageSetToolsID
	number debugMode
	TagGroup imageSets //tag list of image sets
	number currentImageSetIndex // index number of the currently open image set
	number currentSpotIndex; //index number of currently open spot number
	string currentImageTagName; // Middle, Lower or Higher, to show which image we are working on.
	
	void initialise(object self, number theToolkitID, number theDataObjectID){
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
	}
	
	// constructor
	ImageSetTools(object self){
		ImageSetToolsID = self.ScriptObjectGetID();
		imageSets = newTagList();
		currentImageSetIndex = -1; // no image sets are open yet, so use -1
		currentSpotIndex = -1; // no image sets are open yet, so use -1
		currentImageTagName = "None"; // no image sets are open yet, so use -None
	}
	
	// destructor
	~ImageSetTools(object self){
		if(debugMode == 1){result("\nImageSetTools object deleted.");}
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in ImageSetTools object");}
	}

	/* Opens the ImageSets tag list in a window in DM. Used for debugging. */
	void showImageSets(object self){
		TagGroupOpenBrowserWindow(imageSets, 0);
	}
	
	/* Function used to generate a 10 digit random number string for use in imageSet naming */
	string getRandomTenDigits(object self){
		string randomString = "i";
		number i;
		for(i=0; i<9; i++){
			number digit = floor(random() * 10);
			randomString = randomString + digit;
		}
		return randomString;
	}
	
	/* Create a new ImageSet tag group and populate some initial values from the dataObject. Returns the created ImageSet */
	TagGroup createNewImageSet(object self){
		string imageSetID = self.getRandomTenDigits();
		if(debugMode == true){result("\nCreating Image Set Tag Group for set " + imageSetID + "... ");}
		TagGroup imageSetData = newTagGroup(); // make blank labels
		imageSetData.TagGroupCreateNewLabeledTag("ImageSetID");
		imageSetData.TagGroupSetTagAsString("ImageSetID", imageSetID);
		
		imageSetData.TagGroupCreateNewLabeledTag("ImageSetName") // A name for the image set provided by the user
		imageSetData.TagGroupCreateNewLabeledTag("CreationTime") //<time in milliseconds image set tag was created>
		imageSetData.TagGroupCreateNewLabeledTag("ImagesTaken") // 0/1; // if the image set has been taken (1) or if it is waiting to be taken.
		imageSetData.TagGroupCreateNewLabeledTag("DPsTaken"); // 0/1; // if the diffraction patterns for each point have been taken.
		
		imageSetData.TagGroupCreateNewLabeledTag("DiffractionScale") //<value used>
		imageSetData.TagGroupCreateNewLabeledTag("CameraLength");
		
		imageSetData.TagGroupCreateNewLabeledTag("RingMode");
		imageSetData.TagGroupCreateNewLabeledTag("DegreeStep"); // if ring mode is used each 'step' is a certain number of degrees apart.
		imageSetData.TagGroupCreateNewLabeledTag("NumberOfRingPoints"); // # of points to generate and image
		imageSetData.TagGroupCreateNewLabeledTag("RingDSpacing"); // the D-spacing being examined in Angstroms
		
		imageSetData.TagGroupCreateNewLabeledTag("IntegratedImage"); // 0/1
		imageSetData.TagGroupCreateNewLabeledTag("NumberOfIntegrations") // 0/value
		imageSetData.TagGroupCreateNewLabeledTag("AutoSaveNonInt"); // 0/1 : If all images will be saved, not just integrated images.
		imageSetData.TagGroupCreateNewLabeledTag("AutoDisplayNonInt") // 0/1 : If all images will be displayed, not just integrated images.
		
		imageSetData.TagGroupCreateNewLabeledTag("ShadowMode"); // 0/1
		imageSetData.TagGroupCreateNewLabeledTag("ShadowDistance"); // 0/value
		
		imageSetData.TagGroupCreateNewLabeledTag("AutoSaveImages"); // 0/1 : If the images will be saved to harddisk as they are taken
		imageSetData.TagGroupCreateNewLabeledTag("AutoDisplayImages"); // 0/1 If the images will be displayed when they are taken
		
		imageSetData.TagGroupCreateNewLabeledTag("ImageNotes"); // String to record information about the imageSet
		
		number time = GetCurrentTime();
		number dateFormat = 2
		number timeFormat = 2
		number format = dateFormat + 16 * timeFormat
		string theTime = FormatTimeString( time, format );
		imageSetData.TagGroupSetTagAsString("CreationTime", theTime );
		
		imageSetData.TagGroupSetTagAsNumber("ImagesTaken", 0 );
		imageSetData.TagGroupSetTagAsNumber("DiffractionScale", GetScriptObjectFromID(dataObjectID).getRefScale() );
		imageSetData.TagGroupSetTagAsString("CameraLength", GetScriptObjectFromID(dataObjectID).getCameraLength() );
		imageSetData.TagGroupSetTagAsNumber("RingMode", 0 );
		imageSetData.TagGroupSetTagAsNumber("IntegratedImage", 0 );
		imageSetData.TagGroupSetTagAsNumber("NumberOfIntegrations", 0 );
		imageSetData.TagGroupSetTagAsNumber("DegreeStep", 0 );
		imageSetData.TagGroupSetTagAsNumber("ShadowMode", 0 );
		imageSetData.TagGroupSetTagAsNumber("ShadowDistance", 0 );
		
		imageSetData.TagGroupCreateNewLabeledTag("TiltXCenter");
		imageSetData.TagGroupSetTagAsNumber("TiltXCenter", GetScriptObjectFromID(dataObjectID).getCentreXTilt() );
		imageSetData.TagGroupCreateNewLabeledTag("TiltYCenter");
		imageSetData.TagGroupSetTagAsNumber("TiltYCenter", GetScriptObjectFromID(dataObjectID).getCentreYTilt() );
		imageSetData.TagGroupCreateNewLabeledTag("TiltCalibration");
		number xTVx, xTVy, yTVx, yTVy;
		GetScriptObjectFromID(dataObjectID).getTiltVectors(xTVx, xTVy, yTVx, yTVy);
		TagGroup tiltVectors = NewTagGroup();
		tiltVectors.TagGroupCreateNewLabeledTag("xTiltx");
		tiltVectors.TagGroupSetTagAsNumber("xTiltx", xTVx);
		tiltVectors.TagGroupCreateNewLabeledTag("xTilty");
		tiltVectors.TagGroupSetTagAsNumber("xTilty", xTVy);
		tiltVectors.TagGroupCreateNewLabeledTag("yTiltx");
		tiltVectors.TagGroupSetTagAsNumber("yTiltx", yTVx);
		tiltVectors.TagGroupCreateNewLabeledTag("yTilty");
		tiltVectors.TagGroupSetTagAsNumber("yTilty", yTVy);
		imageSetData.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectors);
		
		TagGroup Spots = NewTagList()
		imageSetData.TagGroupSetTagAsTagGroup("Spots", Spots);
		
		TagGroup Images = NewTagList()
		imageSetData.TagGroupSetTagAsTagGroup("Images", Images);

		if(debugMode == true){result("\nImage Set " + imageSetID + " created.");}
		return imageSetData;
	}
	
	number getCurrentSpotIndex(object self){
		return currentSpotIndex;
	}
	
	void setCurrentSpotIndex(object self, number value){
		currentSpotIndex = value;
	}
	
	/* Add an imageSet to the ImageSets list and select it as the current open imageSet */
	void addImageSet(object self, TagGroup imageSet){
		if(debugMode == true){result("\nAdding an image set to the imageSet store.");}
		imageSets.TagGroupAddTagGroupAtEnd(imageSet)
		currentImageSetIndex = (imageSets.TagGroupCountTags() - 1);
		if(debugMode == true){result("\ncurrentImageSetIndex is now " + currentImageSetIndex);}
	}
	
	/* Adds a new spot to the current image set at the end of the Spots taglist and returns the Spot Tag group. */
	TagGroup addSpotToCurrentImageSet(object self){		
		if(debugMode == true){result("\nAdding a spot set to the current image set.");}
		TagGroup CurrentImageSet;
		imageSets.TagGroupGetIndexedTagAsTagGroup(currentImageSetIndex, CurrentImageSet);
		
		TagGroup SpotsList;
		CurrentImageSet.TagGroupGetTagAsTagGroup("Spots", SpotsList);
		
		TagGroup Spot = NewTagGroup();
		Spot.TagGroupCreateNewLabeledTag("Middle");
		Spot.TagGroupCreateNewLabeledTag("Higher");
		Spot.TagGroupCreateNewLabeledTag("Lower");
		SpotsList.TagGroupAddTagGroupAtEnd(Spot);
		currentSpotIndex = (SpotsList.TagGroupCountTags() - 1); // update the spot index number in memory
		if(debugMode == true){result("\nNew spot index is " + currentSpotIndex);}
		
		return Spot;
	}
	
	/* Adds a new DF/BF image to the current image set at the end of the Images taglist and returns the Image Tag group. */
	TagGroup addImageToCurrentImageSet(object self){		
		if(debugMode == true){result("\nAdding a DF image set to the current image set.");}
		TagGroup CurrentImageSet;
		imageSets.TagGroupGetIndexedTagAsTagGroup(currentImageSetIndex, CurrentImageSet);
		
		TagGroup SpotsList;
		CurrentImageSet.TagGroupGetTagAsTagGroup("Images", SpotsList);
		
		TagGroup Spot = NewTagGroup();
		Spot.TagGroupCreateNewLabeledTag("Middle");
		Spot.TagGroupCreateNewLabeledTag("Higher");
		Spot.TagGroupCreateNewLabeledTag("Lower");
		SpotsList.TagGroupAddTagGroupAtEnd(Spot);
		currentSpotIndex = (SpotsList.TagGroupCountTags() - 1); // update the spot index number in memory
		if(debugMode == true){result("\nNew spot index is " + currentSpotIndex);}
		
		return Spot;
	}
	
	/* Function to create a new set of image tags for the imageSet records
		This version is for blank images.
	*/
	TagGroup createNewImageForImageSet(object self){
		TagGroup imageData = newTagGroup(); // make blank labels
		imageData.TagGroupCreateNewLabeledTag("ImageID"); // Unique imageID number
		imageData.TagGroupCreateNewLabeledTag("FileName"); // Name of saved file if present.
		imageData.TagGroupCreateNewLabeledTag("ImageMode");
		imageData.TagGroupCreateNewLabeledTag("ImageType"); // Options are DP, DF, BF, Bin
		imageData.TagGroupCreateNewLabeledTag("ExposureTime");
		imageData.TagGroupCreateNewLabeledTag("xTiltValue");
		imageData.TagGroupCreateNewLabeledTag("yTiltValue");
		imageData.TagGroupCreateNewLabeledTag("xTiltRelative");
		imageData.TagGroupCreateNewLabeledTag("yTiltRelative");
		imageData.TagGroupCreateNewLabeledTag("xShift");
		imageData.TagGroupCreateNewLabeledTag("yShift");
		imageData.TagGroupCreateNewLabeledTag("DSpacingAng");
		imageData.TagGroupCreateNewLabeledTag("ShadowValue");
		imageData.TagGroupCreateNewLabeledTag("ShadowDistance");
		
		imageData.TagGroupCreateNewLabeledTag("SavedAsFile") //<Has image been saved as a file? 0/1>
		imageData.TagGroupSetTagAsNumber("SavedAsFile", 0 );

		imageData.TagGroupCreateNewLabeledTag("CreationTime") //<time image was created>
		number time = GetCurrentTime();
		number dateFormat = 2
		number timeFormat = 2
		number format = dateFormat + 16 * timeFormat
		string theTime = FormatTimeString( time, format );
		imageData.TagGroupSetTagAsString("CreationTime", theTime );
		
		return imageData;
	}	
	
	/* Get the currently open imageSet Taggroup. Returns 1/0 for success/fail */
	number getCurrentImageSet(object self, TagGroup &targetImageSet){
		TagGroup currentImageSet = NewTagGroup();
		if(currentImageSetIndex < 0){
			result("\nThe current image set has been requested but currentImageSetIndex < 0");
			return 0;
		}
		number gotImageSet = ImageSets.TagGroupGetIndexedTagAsTagGroup(currentImageSetIndex, currentImageSet);
		if(gotImageSet==0){
			result("\nThe current image set has been requested but an error occured when attempting to retrive currentImageSetIndex = " + currentImageSetIndex);
			return 0;
		}
		targetImageSet = currentImageSet;
		return 1;	
	}
	
	/* Get the current spot tag group. Returns 1/0 for success/fail */
	number getCurrentSpot(object self, TagGroup &targetSpotSet){
		TagGroup currentSpotSet = NewTagGroup();
		if(currentSpotIndex < 0){
			result("\nThe current spot group has been requested but currentSpotIndex < 0");
			return 0;
		}
		TagGroup currentImageSet;
		if(self.getCurrentImageSet(currentImageSet) == 0){
			result("\nThe current spot group has been requested but there was a problem returning the current image set");
			return 0;
		}
		TagGroup currentSpotList;
		if(currentImageSet.TagGroupGetTagAsTagGroup("Spots", currentSpotList) == 0){
			result("\nThe current spot set has been requested but an error occured when attempting to retrive the Spot List from currentImageSetIndex = " + currentImageSetIndex);
			return 0;
		}
		
		number gotSpotSet = currentSpotList.TagGroupGetIndexedTagAsTagGroup(currentSpotIndex, currentSpotSet);
		if(gotSpotSet==0){
			result("\nThe current spot set has been requested but an error occured when attempting to retrive currentSpotIndex = " + currentSpotIndex + " from currentImageSetIndex = " + currentImageSetIndex);
			return 0;
		}
		targetSpotSet = currentSpotSet;
		return 1;
	}
	
	/* Get the current (DF image) spot tag group. Returns 1/0 for success/fail */
	number getCurrentImageSpot(object self, TagGroup &targetSpotSet){
		TagGroup currentSpotSet = NewTagGroup();
		if(currentSpotIndex < 0){
			result("\nThe current DF Image spot group has been requested but currentSpotIndex < 0");
			return 0;
		}
		TagGroup currentImageSet;
		if(self.getCurrentImageSet(currentImageSet) == 0){
			result("\nThe current DF Image spot group has been requested but there was a problem returning the current image set");
			return 0;
		}
		TagGroup currentSpotList; // This part is the only difference between this and the getCurrentSpot() method.
		if(currentImageSet.TagGroupGetTagAsTagGroup("Images", currentSpotList) == 0){
			result("\nThe current DF Image spot set has been requested but an error occured when attempting to retrive the Spot List from currentImageSetIndex = " + currentImageSetIndex);
			return 0;
		}
		
		number gotSpotSet = currentSpotList.TagGroupGetIndexedTagAsTagGroup(currentSpotIndex, currentSpotSet);
		if(gotSpotSet==0){
			result("\nThe current DF Image spot set has been requested but an error occured when attempting to retrive currentSpotIndex = " + currentSpotIndex + " from currentImageSetIndex = " + currentImageSetIndex);
			return 0;
		}
		targetSpotSet = currentSpotSet;
		return 1;
	}
	
	/* Add a given image data set to the current spot group in the given image slot. */
	number addImageDataToCurrentSpot(object self, TagGroup imageData, string higherOrLowerOrMiddle){
		if((higherOrLowerOrMiddle != "Higher") && (higherOrLowerOrMiddle != "Lower") && (higherOrLowerOrMiddle != "Middle") ){
			result("\nWhen adding an image to the current spot the higherOrLowerOrMiddle value was not higherOrLowerOrMiddle.\n\tImage not added.");
			return 0;
		}
		currentImageTagName = higherOrLowerOrMiddle;
		TagGroup targetSpot
		if(self.getCurrentSpot(targetSpot) == 0){
			result("\nThere was an error when retrieving the Current Spot Tag group when attempting to add an image to it.")
			return 0;
		}
		targetSpot.TagGroupSetTagAsTagGroup(currentImageTagName, imageData);
		return 1;
	}	
	
	/* Add a given image data set to the current spot group in the given image slot. */
	number addImageDataToCurrentImageSet(object self, TagGroup imageData, string higherOrLowerOrMiddle){
		if((higherOrLowerOrMiddle != "Higher") && (higherOrLowerOrMiddle != "Lower") && (higherOrLowerOrMiddle != "Middle") ){
			result("\nWhen adding an image to the current DF image set the higherOrLowerOrMiddle value was not higherOrLowerOrMiddle.\n\tImage not added.");
			return 0;
		}
		currentImageTagName = higherOrLowerOrMiddle;
		TagGroup targetSpot
		if(self.getCurrentImageSpot(targetSpot) == 0){
			result("\nThere was an error when retrieving the Current DF Image Spot Tag group when attempting to add an image to it.")
			return 0;
		}
		targetSpot.TagGroupSetTagAsTagGroup(currentImageTagName, imageData);
		return 1;
	}
	
	/* Get ImageSet tag group based on the ID of the set. Returns 1/0 for success/fail */
	number getImageSetByID(object self, string theImageSetID, TagGroup &targetImageSet){
		number totalImageSets = imageSets.TagGroupCountTags();
		if(totalImageSets <= 0){
			result("\nWhen attempting to get Image Set " + theImageSetID + " no image sets were found at all.")
			return 0;
		}
		number i
		for(i=0; i < totalImageSets; i++){
			TagGroup ThisImageSet;
			if (ImageSets.TagGroupGetIndexedTagAsTagGroup(i, ThisImageSet) == 0){
				result("\nWhen attempting to get Image Set " + theImageSetID + " there was an error returning Image Set index " + i);
				return 0;
			}
			string ThisImageSetID;
			if(ThisImageSet.TagGroupGetTagAsString("ImageSetID", ThisImageSetID) == 0){
				result("\nWhen attempting to get Image Set " + theImageSetID + " there was an error returning the Image Set index " + i + " ID string");
				return 0;
			}
			if(ThisImageSetID == theImageSetID){ // match found
				targetImageSet = ThisImageSet;
				return 1;
			}
		}
		result("\nWhen attempting to get Image Set " + theImageSetID + " no matching IDs were found.");
		return 0;
	}
	
	/* Get a TagList containing all of the stored ImageSets ID strings */
	number getImageSetIDList(object self, TagGroup &targetList){
		TagGroup imageSetIDList = NewTagList();
		number totalImageSets = imageSets.TagGroupCountTags();
		if(totalImageSets <= 0){
			result("\nWhen attempting to create a list of ImageSet IDs no image sets were found at all.")
			return 0;
		}
		number i
		for(i=0; i < totalImageSets; i++){
			TagGroup ThisImageSet;
			if (ImageSets.TagGroupGetIndexedTagAsTagGroup(i, ThisImageSet) == 0){
				result("\nWhen attempting to create an imageSet ID list there was an error returning Image Set index " + i);
				return 0;
			}
			string ThisImageSetID;
			if(ThisImageSet.TagGroupGetTagAsString("ImageSetID", ThisImageSetID) == 0){
				result("\nWhen attempting to create an imageSet ID list there was an error returning the Image Set index " + i + " ID string");
				return 0;
			}
			imageSetIDList.TagGroupInsertTagAsString( infinity(), ThisImageSetID );
		}
		targetList = imageSetIDList;
		return 1;
	}
	
	
	/* Function to check if an image has the toolkit tags */
	number doImageTagsExist (object self, image &theImage){
		TagGroup persistentTG = theImage.ImageGetTagGroup();
		if(persistentTG.TagGroupCountTags() == 0){
				if(debugMode==1){result("\nNo Persistent image tags detected.");}
				return -1;
		}
		string tagPath = "Darkfield360";
		number doesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(doesExist == 0){
			if(debugMode==1){result("\nDarkfield image tag group not found.");}
			return 0;
		}
		if(debugMode==1){result("\nDarkfield image tag group found.");}
		return 1;
	}
	
	/* Save the taggroup as a gtg file used natively by DM. Function will ask for file path etc. */
	number exportImageSetAsGTG(object self, TagGroup ImageSet){
		String path;
		string defaultName;
		ImageSet.TagGroupGetTagAsString("SetName", defaultName);
		number SavePathSelected = SaveAsDialog( "Save Image Set to...", defaultName, path );
		if(SavePathSelected == 0){
			return 0;
		}
		ImageSet.TagGroupSaveToFile( path );
		if(debugMode==true){
			result("\nImageSet saved to " + path);
		}
		return 1;
	}
	
	/* Import an imageset file. Will ask for file, pass the taggroup and return 0/1 for fail/pass. */
	number importImageSet(object self, TagGroup &LoadedImageSet){
		String path;
		number fileSelected =  OpenDialog( path );
		
		if(fileSelected == 0){
			return 0;
		}
		
		number fileLoaded = TagGroupLoadFromFile( LoadedImageSet, path );
		if(fileLoaded == 0){
			return 0;
		}
		return 1;
	}
	
	/* Returns the image set id string for a given image set tag group. Used to simplify using image sets in external functions.*/
	number getImageSetID(object self, TagGroup ImageSet, string &ImageSetIDvariable){
		string value;
		if (ImageSet.TagGroupGetTagAsString( "ImageSetID", ImageSetIDvariable ) == 0){
			result("\nNo ImageSetID found in tag group");
			return 0;
		}
		return 1;
	}
	
	
	/* Function to create the persistent image tags to store information. Requires a lot of inputs.
		createImageTags( imageSetID, imageSpotID, ImageType, ImageMode,	ringMode, integratedImage, NumberOfIntegrations,\
		DegreeStep, shadowDistance,	shadowValue, DSpacingAng, xTilt, yTilt, exposureTime )
	*/
	/*
	TagGroup createImageTags(object self, number imageSetID, number imageSpotID, string ImageType, string ImageMode,\
	number ringMode, number integratedImage, number NumberOfIntegrations, number DegreeStep, number shadowDistance,\
	number shadowValue, number DSpacingAng, number xTilt, number yTilt, number exposureTime ){
		if(debugMode==1){result("\nGenerating an image tag group...");}
		TagGroup persistentTG = NewTagGroup();
		persistentTG.TagGroupCreateNewLabeledTag("Toolkit Version");
		persistentTG.TagGroupSetTagAsNumber("Toolkit Version", versionNumber);
		
		TagGroup tiltCalibrationData = NewTagGroup();
		tiltCalibrationData.TagGroupCreateNewLabeledTag("xTiltx");
		tiltCalibrationData.TagGroupSetTagAsNumber("xTiltx", xTiltVectorX);
		tiltCalibrationData.TagGroupCreateNewLabeledTag("xTilty");
		tiltCalibrationData.TagGroupSetTagAsNumber("xTilty", xTiltVectorY);
		tiltCalibrationData.TagGroupCreateNewLabeledTag("yTiltx");
		tiltCalibrationData.TagGroupSetTagAsNumber("yTiltx", yTiltVectorX);
		tiltCalibrationData.TagGroupCreateNewLabeledTag("yTilty");
		tiltCalibrationData.TagGroupSetTagAsNumber("yTilty", yTiltVectorX);
		persistentTG.taggroupaddlabeledtaggroup("TiltCalibration", tiltCalibrationData);
		
		persistentTG.TagGroupCreateNewLabeledTag("CameraLength");
		persistentTG.TagGroupSetTagAsString("CameraLength", cameraLength);
				
		persistentTG.TagGroupCreateNewLabeledTag("XTiltValue");
		persistentTG.TagGroupCreateNewLabeledTag("YTiltValue");
		persistentTG.TagGroupSetTagAsNumber("XTiltValue", xTilt);
		persistentTG.TagGroupSetTagAsNumber("YTiltValue", yTilt);
		
		persistentTG.TagGroupCreateNewLabeledTag("ImageSetID");
		persistentTG.TagGroupCreateNewLabeledTag("ImageSpotID");
		persistentTG.TagGroupCreateNewLabeledTag("ImageType");
		persistentTG.TagGroupCreateNewLabeledTag("ImageMode");
		persistentTG.TagGroupSetTagAsNumber("ImageSetID", imageSetID);
		persistentTG.TagGroupSetTagAsNumber("ImageSpotID", imageSpotID);
		persistentTG.TagGroupSetTagAsString("ImageType", imageType);
		persistentTG.TagGroupSetTagAsString("ImageMode", imageMode);
		
		persistentTG.TagGroupCreateNewLabeledTag("RingMode");
		persistentTG.TagGroupCreateNewLabeledTag("IntegratedImage");
		persistentTG.TagGroupCreateNewLabeledTag("NumberOfIntegrations");
		persistentTG.TagGroupCreateNewLabeledTag("DegreeStep");
		persistentTG.TagGroupCreateNewLabeledTag("ShadowDistance");
		persistentTG.TagGroupCreateNewLabeledTag("ShadowValue");
		persistentTG.TagGroupCreateNewLabeledTag("DSpacingAng");
		persistentTG.TagGroupCreateNewLabeledTag("ExposureTime");
		
		persistentTG.TagGroupSetTagAsNumber("RingMode", ringMode);
		persistentTG.TagGroupSetTagAsNumber("IntegratedImage", integratedImage);
		persistentTG.TagGroupSetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		persistentTG.TagGroupSetTagAsNumber("DegreeStep", DegreeStep);
		persistentTG.TagGroupSetTagAsNumber("ShadowDistance", ShadowDistance);
		persistentTG.TagGroupSetTagAsNumber("ShadowValue", shadowValue);
		persistentTG.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		persistentTG.TagGroupSetTagAsNumber("ExposureTime", ExposureTime);
		
		return persistentTG;
	}
	*/
}

