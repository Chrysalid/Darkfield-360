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
	// Used in 1/2 functions. Phase this out.
	
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
	
	/* Prints out the stored variables in the objct and shows the ImageSet Tag List */
	void printAll(object self)
	{
		self.showImageSets();
		result("\n\nImageSetTools Debug Values")
		result("\n------------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ImageSetToolsID +\
			"\n DebugMode: " + debugMode +\
			"\n ToolkitID: " + ToolkitID +\
			"\n DataObjectID: " + DataObjectID +\
			"\n currentImageSetIndex: " + currentImageSetIndex +\
			"\n currentSpotIndex: " + currentSpotIndex +\
			"\n currentImageTagName: " + currentImageTagName;
		result(textstring);
		result("\n-------End----------------")
	}
	
	/* Returns the image set id string for a given image set tag group. Used to simplify using image sets in external functions.*/
	number getImageSetID(object self, TagGroup ImageSet, string &ImageSetIDvariable){
		string value;
		if (ImageSet.TagGroupGetTagAsString( "ImageSetID", ImageSetIDvariable ) == 0){
			result("\nNo ImageSetID found in tag group");
			return 0;
		}
		if(debugMode == true){result("\n\tgetImageSetID() reports the image set ID is " + ImageSetIDvariable);}
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
		
		imageSetData.TagGroupCreateNewLabeledTag("SetName") // A name for the image set provided by the user
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
	
	/* Add an imageSet to the ImageSets list and select it as the current open imageSet
		if the image set all ready exists then it will update the existing tag group rather than add a new one.
		return 1 on success, 0 on fail.
	*/
	number addImageSet(object self, TagGroup imageSet){
		TagGroup ExistingImageSet
		string imageSetID
		if(debugMode == true){result("\nRunning addImageSet() function...");}
		if (self.getImageSetID(imageSet, imageSetID) == 1) { // get the new imageset ID
			if(debugMode == true){result("\n\tgetImageSetID() succeded: " + imageSetID);}
			if( self.getImageSetByID(imageSetID, ExistingImageSet) == 1 ){
				if(debugMode == true){result("\n\tLoaded Existing Image Set...");}
				ExistingImageSet.TagGroupReplaceTagsWithCopy(imageSet); // over-writing the old image set with the new one.
				//ImageSet.TagGroupOpenBrowserWindow(0); // for debugging.
				//ExistingImageSet.TagGroupOpenBrowserWindow(0); // for debugging.
				if(debugMode == true){result(" Image Set configuration updated");}
				return 1;
			} else {
				// image set does not exist all ready...
				if(debugMode == true){result("\nAdding an image set to the imageSet store.");}
				imageSets.TagGroupAddTagGroupAtEnd(imageSet)
				currentImageSetIndex = (imageSets.TagGroupCountTags() - 1); // Set this image set as the current image set.
				if(debugMode == true){result("\ncurrentImageSetIndex is now " + currentImageSetIndex);}
				return 1;
			}
		} else {
			result("\nERROR: No image set ID found when adding the image set to list (or updating one).")
			return 0;
		}
		
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
		imageData.TagGroupCreateNewLabeledTag("XTiltValue");
		imageData.TagGroupCreateNewLabeledTag("YTiltValue");
		imageData.TagGroupCreateNewLabeledTag("XTiltRelative");
		imageData.TagGroupCreateNewLabeledTag("YTiltRelative");
		imageData.TagGroupCreateNewLabeledTag("XShift");
		imageData.TagGroupCreateNewLabeledTag("YShift");
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
	
	/* Function to create a new set of image tags for the imageSet records (NOT PERSISTANT IMAGE TAGS)
		This version is for images taken from a dataset (either DP or DF)
			ImageTags is a set of tags structured as defined in the persistent Tags for Images, under Darkfield360.
	*/
	TagGroup createNewImageForImageSet(object self, TagGroup imageTags){
		TagGroup imageData = newTagGroup(); // make blank labels
		imageData.TagGroupCreateNewLabeledTag("ImageID"); // Unique imageID number
		imageData.TagGroupCreateNewLabeledTag("FileName"); // Name of saved file if present.
		imageData.TagGroupCreateNewLabeledTag("ImageMode");
		imageData.TagGroupCreateNewLabeledTag("ImageType"); // Options are DP, DF, BF, Bin
		imageData.TagGroupCreateNewLabeledTag("ExposureTime");
		imageData.TagGroupCreateNewLabeledTag("XTiltValue");
		imageData.TagGroupCreateNewLabeledTag("YTiltValue");
		imageData.TagGroupCreateNewLabeledTag("XTiltRelative");
		imageData.TagGroupCreateNewLabeledTag("YTiltRelative");
		imageData.TagGroupCreateNewLabeledTag("XShift");
		imageData.TagGroupCreateNewLabeledTag("YShift");
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
		
		string ImageID, ImageMode, ImageType;
		number ExposureTime, xTiltValue, yTiltValue, xTiltRelative, yTiltRelative, xShift, yShift, DSpacingAng, ShadowValue, ShadowDistance;
		
		imageTags.TagGroupGetTagAsString("ImageID", ImageID);
		imageTags.TagGroupGetTagAsString("ImageMode", ImageMode);
		imageTags.TagGroupGetTagAsString("ImageType", ImageType);
		imageTags.TagGroupGetTagAsNumber("ExposureTime", ExposureTime);
		imageTags.TagGroupGetTagAsNumber("XTiltValue", xTiltValue);
		imageTags.TagGroupGetTagAsNumber("YTiltValue", yTiltValue);
		imageTags.TagGroupGetTagAsNumber("XTiltRelative", xTiltRelative);
		imageTags.TagGroupGetTagAsNumber("YTiltRelative", yTiltRelative);
		imageTags.TagGroupGetTagAsNumber("XShift", xShift);
		imageTags.TagGroupGetTagAsNumber("YShift", yShift);
		imageTags.TagGroupGetTagAsNumber("DSpacingAng", DSpacingAng);
		imageTags.TagGroupGetTagAsNumber("ShadowValue", ShadowValue);
		imageTags.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		
		imageData.TagGroupSetTagAsString("ImageID", ImageID);
		imageData.TagGroupSetTagAsString("ImageMode", ImageMode);
		imageData.TagGroupSetTagAsString("ImageType", ImageType);
		imageData.TagGroupSetTagAsNumber("ExposureTime", ExposureTime);
		imageData.TagGroupSetTagAsNumber("XTiltValue", xTiltValue);
		imageData.TagGroupSetTagAsNumber("YTiltValue", yTiltValue);
		imageData.TagGroupSetTagAsNumber("XTiltRelative", xTiltRelative);
		imageData.TagGroupSetTagAsNumber("YTiltRelative", yTiltRelative);
		imageData.TagGroupSetTagAsNumber("XShift", xShift);
		imageData.TagGroupSetTagAsNumber("YShift", yShift);
		imageData.TagGroupSetTagAsNumber("DSpacingAng", DSpacingAng);
		imageData.TagGroupSetTagAsNumber("ShadowValue", ShadowValue);
		imageData.TagGroupSetTagAsNumber("ShadowDistance", ShadowDistance);
		
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
				result("\nWhen attempting to create an imageSet ID list there was an error returning Image Set with index " + i);
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
			if(debugMode==1){result("\nDarkfield 360 image tag group not found.");}
			return 0;
		}
		if(debugMode==1){result("\nDarkfield 360 image tag group found.");}
		return 1;
	}
	
	/* Function to read the **image's persistent tags** and extract the information needed to find the image in an imageSet
		returns 0/1 for fail/pass
		Passes on values for ImageSetID, ImageType (BF/DF/DP), Spot number, ShadowValue (0/1/2/3)
		Does not do ANYTHING with currently active image sets in memory.
	*/
	number identifyImageInImageSet(object self, image &theImage, string &ImageSetID, string &ImageType, number &SpotNumber, number &ShadowValue)
	{
		number DoImageTagsExist = self.doImageTagsExist(theImage);
		if(DoImageTagsExist == false){
			return 0;
		}
		
		TagGroup ImageTags;
		TagGroup persistentTG = theImage.ImageGetTagGroup();
		persistentTG.TagGroupGetTagAsTagGroup("Darkfield360", ImageTags);
		
		if (self.getImageSetID(ImageTags, ImageSetID) == false) {
			return 0;
		}
		if( ImageTags.TagGroupDoesTagExist("ImageType") == false ){
			return 0;
		}
		if( ImageTags.TagGroupDoesTagExist("ImageSpotNumber") == false ){
			return 0;
		}
		if( ImageTags.TagGroupDoesTagExist("ShadowValue") == false ){
			return 0;
		}
		
		ImageTags.TagGroupGetTagAsString("ImageType", ImageType);
		ImageTags.TagGroupGetTagAsNumber("ImageSpotNumber", SpotNumber);
		ImageTags.TagGroupGetTagAsNumber("ShadowValue", ShadowValue);		
	
		if(ImageType == ""){
			return 0;
		}

		return 1;
	}
	
	/* Function to load a specific image/spot data from an ImageSet.
		Passes on the TagGroup of the image inside the ImageSet;
		Returns 0/1 for fail/pass;
	*/
	number getImageDataFromImageSet (object self, TagGroup ImageSet, String ImageType, Number SpotNumber, Number ShadowValue, TagGroup &ImageData)
	{
		if(ImageType != "BF" && ImageType != "DF" && ImageType != "DP"){
			result("\n Image data could not be retrieved: " + ImageType + " is not a valid Image Type (BF/DP/DF)");
			return 0;
		}
		number loaded;
		TagGroup Collection;
		if(ImageType == "DP"){
			loaded = ImageSet.TagGroupGetTagAsTagGroup("Spots", Collection);
		} else {
			loaded = ImageSet.TagGroupGetTagAsTagGroup("Images", Collection);
		}
		if(loaded == 0){
			result("\n Image data could not be retrieved: No Image/Spot Collection found in this ImageSet.");
			return 0;
		}
		
		number TotalImageGroups = Collection.TagGroupCountTags();
		if(SpotNumber >= TotalImageGroups){
			result("\n Image data could not be retrieved: " + SpotNumber + " is out of range.");
			return 0;
		}
		
		TagGroup ImageGroup
		loaded = Collection.TagGroupGetIndexedTagAsTagGroup(SpotNumber, ImageGroup);
		if(loaded == 0){
			result("\n Image data could not be retrieved: No Image Data found for this Spot Number");
			return 0;
		}
		
		if(ShadowValue == 0 || shadowValue == 1){
			loaded = ImageGroup.TagGroupGetTagAsTagGroup("Middle", ImageData);
		} else if (ShadowValue == 2){
			loaded = ImageGroup.TagGroupGetTagAsTagGroup("Higher", ImageData);
		} else if (ShadowValue == 3){
			loaded = ImageGroup.TagGroupGetTagAsTagGroup("Lower", ImageData);
		} else {
			result("\n Image data could not be retrieved: " + ShadowValue + " is not valid (0/1/2/3).");
			return 0;
		}
		if(loaded == 0){
			result("\n Image data could not be retrieved: No Image Data found for this Shadow Value");
			return 0;
		}
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
	
	/*	Save the taggroup as a .s or .txt file so it can be read more easily by a human.
		No text import function as yet.
	*/
	number exportImageSetAsTXT(object self, TagGroup ImageSet){
		String path;
		string defaultName, imageSetID;
		ImageSet.TagGroupGetTagAsString("SetName", defaultName);
		ImageSet.TagGroupGetTagAsString("ImageSetID", imageSetID);
		number SavePathSelected = SaveAsDialog( "Save Image Set to...", imageSetID, path );
		if(SavePathSelected == 0){
			return 0;
		}
		// Create a text editor window into which to save the values.

		string title="Image Set " + imageSetID;
		number top=100, left=100, bottom=400, right=600;
		documentwindow textwin = NewScriptWindow( title, top, left, bottom, right );
		
		// Write text with: textwin.EditorWindowAddText( "Indicated Magnification : "+tagvalue+"\n" )
		string textPart1 = defaultName + "\n" +\
			"Image Set ID:" + ImageSetID + "\n" +\
			"Put Data Here";
		
		textwin.EditorWindowAddText( textPart1 );
		editorwindowsavetofile(textwin,path);
		if(debugMode==true){
			result("\nImageSet saved to " + path);
		}
		// This closes the text file without any prompts. If you want the option to keep the file open
		// change the (0) to (1)
		textwin.windowclose(1)
		return 1;
	}
	
	/* Import an imageset file. Will ask for file, import the taggroup, check for a valid imageSet
		and then add the imageSet to the current list of image sets.
		return 0/1 for fail/pass.
	*/
	number importImageSetFile(object self){
		String path;
		TagGroup LoadedImageSet = NewTagGroup();
		number fileSelected =  OpenDialog( path );
		
		if(fileSelected == false){
			return 0;
		} else {
			result("\n Image Set loading from " + path);
		}
		
		number fileLoaded = TagGroupLoadFromFile( LoadedImageSet, path );
		if(fileLoaded == false){
			result("\nThere was an error opening the file.");
			return 0;
		} else {
			result("\n Image Set opened.");
		}
		
		number fileAdded = self.addImageSet( LoadedImageSet );
		if(fileAdded == false){
			result("\nThere was an error adding this Image Set to the current list of image sets.");
			return 0;
		}
		return 1;
	}
	
	
	/* Function to create the persistent image tags to store information. Returns a blank set of tags to be filled.

	*/
	TagGroup createImageTags(object self){
		if(debugMode==1){result("\nGenerating an image tag group...");}
		TagGroup persistentTG = NewTagGroup();
		persistentTG.TagGroupCreateNewLabeledTag("Toolkit Version");
		persistentTG.TagGroupSetTagAsNumber("Toolkit Version", versionNumber);
		
		TagGroup tiltCalibrationData = NewTagGroup();
		tiltCalibrationData.TagGroupCreateNewLabeledTag("xTiltx");
		tiltCalibrationData.TagGroupCreateNewLabeledTag("xTilty");
		tiltCalibrationData.TagGroupCreateNewLabeledTag("yTiltx");
		tiltCalibrationData.TagGroupCreateNewLabeledTag("yTilty");
		persistentTG.taggroupaddlabeledtaggroup("TiltCalibration", tiltCalibrationData);
		
		persistentTG.TagGroupCreateNewLabeledTag("CameraLength");
				
		persistentTG.TagGroupCreateNewLabeledTag("XTiltValue");
		persistentTG.TagGroupCreateNewLabeledTag("YTiltValue");
		
		persistentTG.TagGroupCreateNewLabeledTag("ImageSetID");
		persistentTG.TagGroupCreateNewLabeledTag("ImageSpotNumber");
		persistentTG.TagGroupCreateNewLabeledTag("ImageType");
		persistentTG.TagGroupCreateNewLabeledTag("ImageMode");
		
		persistentTG.TagGroupCreateNewLabeledTag("RingMode");
		persistentTG.TagGroupCreateNewLabeledTag("IntegratedImage");
		persistentTG.TagGroupCreateNewLabeledTag("NumberOfIntegrations");
		persistentTG.TagGroupCreateNewLabeledTag("DegreeStep");
		persistentTG.TagGroupCreateNewLabeledTag("ShadowDistance");
		persistentTG.TagGroupCreateNewLabeledTag("ShadowValue");
		persistentTG.TagGroupCreateNewLabeledTag("DSpacingAng");
		persistentTG.TagGroupCreateNewLabeledTag("ExposureTime");
		
		return persistentTG;
	}

	/*
	Function to generate the filename for an image in an ImageSet and then check if it can be saved without over-writting an existing image.
		Passes the filename to a variable.
		Passes the full filepath to a variable.
		Returns 1 if the file is safe to be saved, 0 if there is a problem.
		Will add _2 to the filename if there is an existing file, but will only go to _2, since anymore than one duplicate means something has gone wrong.
	*/

	number generateFileNameForImageInImageSet(object self, TagGroup ImageTags, string &fileName, string &filePath)
	{
		if(debugmode==true){result("\nGenerating the Image Filename and Path.");}
		string imageSetID
		ImageTags.TagGroupGetTagAsString("Darkfield360:ImageSetID", imageSetID);

		string saveDir = GetApplicationDirectory( 1100, 1 );
		// index 1100 = autosave
		string imageSetDir = PathConcatenate(saveDir, ImageSetID);
		number imageSetDirExists = DoesDirectoryExist( imageSetDir );
		if(imageSetDirExists == false){
			CreateDirectory( imageSetDir );
			imageSetDirExists = DoesDirectoryExist( imageSetDir );
			if(imageSetDirExists == false){
				result("\n\nCould not find or create a save directory when generating the folder for an image set!")
				return 0;
			}
		}
		number ImageSpotNumber, shadowValue;
		string ImageType, shadowName;
		ImageTags.TagGroupGetTagAsString("Darkfield360:ImageType", ImageType);
		ImageTags.TagGroupGetTagAsNumber("Darkfield360:ImageSpotNumber", ImageSpotNumber);
		ImageTags.TagGroupGetTagAsNumber("Darkfield360:ShadowValue", shadowValue);
		
		fileName = (ImageType == "BF") ? ("Brightfield_" + constructTimeStamp()) : fileName;
		fileName = (ImageType == "DF") ? ("Darkfield_" + constructTimeStamp() + "_spot_" + ImageSpotNumber) : fileName;
		fileName = (ImageType == "DP") ? ("Diffraction_" + constructTimeStamp() + "_spot_" + ImageSpotNumber) : fileName;
		fileName = (ImageType == "Bin") ? ("Binary_" + constructTimeStamp()) : fileName;
		
		shadowName = (shadowValue == 0) ? ("_middle") : shadowName;
		shadowName = (shadowValue == 1) ? ("_middle") : shadowName;
		shadowName = (shadowValue == 2) ? ("_higher") : shadowName;
		shadowName = (shadowValue == 3) ? ("_lower") : shadowName;
		
		fileName = fileName + shadowName;
	
		filePath = PathConcatenate(imageSetDir, fileName);
		
		if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
			result("\n" + filePath + " already exists. File name changed to ");
			fileName = fileName + "_2";
			filePath = PathConcatenate(imageSetDir, fileName);
			result(fileName);
			if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
				result("\n Multiple Versions of " + filename + " found.");
				return 0;
			}
		}
		return 1;
	}
	
	/*	Function to save an image using image set data and to feed those values into the image tags and imageset tags
		returns 0 on a failure/cancellation, 1 on success.
		Will save all images for an image set in a subfolder with the imageset ID
	*/
	number saveImageInImageSet(object self, image &theImage)
	{
		if(debugmode==true){result("\nSaving Image " + theImage.ImageGetID());}
		TagGroup PersistentTags = theImage.ImageGetTagGroup();
		string imageSetID
		PersistentTags.TagGroupGetTagAsString("Darkfield360:ImageSetID", imageSetID);
		if(debugMode==true){result("\n\t ImageSetID: " + imageSetID);}
		TagGroup ImageSet
		number imageSetFound = self.getImageSetByID(ImageSetID, ImageSet);
		if(imageSetFound == false){
			result("\n\nImage Set with ID " + ImageSetID + " not found when saving an image!")
			return 0;
		}
		
		// Load identifying data for this image in its imageSet
		//number identifyImageInImageSet(object self, image &theImage, string &ImageSetID, string &ImageType, number &SpotNumber, number &ShadowValue)
		string ImageType;
		number SpotNumber, ShadowValue;
		self.identifyImageInImageSet(theImage, ImageSetID, ImageType, SpotNumber, ShadowValue);
		
		string fileName, filePath;
		//number generateFileNameForImageInImageSet(object self, TagGroup ImageTags, string &filename, string &filePath)
		number FileSaveAllowed = self.generateFileNameForImageInImageSet( PersistentTags, fileName, filePath);
		if(FileSaveAllowed == false){
			result("\n\n File was not saved.");
			return 0;
		}
		
		SaveAsGatan(theImage, filePath);
		
		if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
			result("\n" + filePath + " saved.")
			// Record the saved file name in the ImageSet for future recall.
			//number getImageDataFromImageSet (object self, TagGroup ImageSet, String ImageType, Number SpotNumber, Number ShadowValue, TagGroup &ImageData)
			TagGroup ImageData;
			self.getImageDataFromImageSet(ImageSet, ImageType, SpotNumber, ShadowValue, ImageData);
			
			ImageData.TagGroupSetTagAsString("FileName", fileName);
			ImageData.TagGroupSetTagAsNumber("SavedAsFile", 1);
			result("\n ImageSet " + ImageSetID + " updated with file name " + fileName);
			return 1;
		} else {
			result("\n\nFinal save check indicates the file " + filePath + " did not save. \nIt may still have saved, but you should check.")
			return 0;
		}
	}
	
	/* Make a tagList of the names of all image files inside an imageSet 
		Return 0 on failure.
	*/
	Number listAllImageFilesInImageSet(object self, TagGroup ImageSet, TagGroup &ImageList){
		TagGroup filesToSearchFor = NewTagList();
		// Create a tagList of the the image filenames in the image set. Each one will be a single indexed entry with a labelled tag called Name inside it. Store the name without a directory, just like the file list tag group.
		
		
		number DPsTaken; // If the diffraction patterns have been taken.
		ImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken);
		number ImagesTaken; // If the darkfield images have been taken.
		ImageSet.TagGroupGetTagAsNumber("ImagesTaken", ImagesTaken);
		
		if(DPsTaken == false){
			result("Diffraction Patterns have not been taken for this Image Set");
			return 0;
		}
		
		number ShadowMode;
		ImageSet.TagGroupGetTagAsNumber("ShadowMode", ShadowMode);
		
		TagGroup images, spots;
		ImageSet.TagGroupGetTagAsTagGroup("Spots", spots);
		if(spots.TagGroupIsValid() == false){
			result("Error loading spots list");
			return 0;
		}
		
		number numberOfSpots = spots.TagGroupCountTags();
		number i;
		for(i=0; i < numberOfSpots; i++){
			// For each diffraction pattern (spot) that was taken, save its name into the filesToSearchFor taglist
			TagGroup ImageData;
			self.getImageDataFromImageSet (ImageSet, "DP", i, 1, ImageData);
			string fileName;
			ImageData.TagGroupGetTagAsString("FileName", fileName);
			
			TagGroup thisGroup;
			thisGroup.TagGroupCreateNewLabeledTag("Name")
			thisGroup.TagGroupSetTagAsString( "Name", fileName );
			filesToSearchFor.TagGroupAddTagGroupAtEnd(thisGroup);
			
			if(ShadowMode == true){
				TagGroup higherGroup, lowerGroup;
				self.getImageDataFromImageSet (ImageSet, "DP", i, 2, ImageData);
				ImageData.TagGroupGetTagAsString("FileName", fileName);
				higherGroup.TagGroupCreateNewLabeledTag("Name")
				higherGroup.TagGroupSetTagAsString( "Name", fileName );
				filesToSearchFor.TagGroupAddTagGroupAtEnd(higherGroup);
				
				self.getImageDataFromImageSet (ImageSet, "DP", i, 3, ImageData);
				ImageData.TagGroupGetTagAsString("FileName", fileName);
				lowerGroup.TagGroupCreateNewLabeledTag("Name")
				lowerGroup.TagGroupSetTagAsString("Name" , fileName );
				filesToSearchFor.TagGroupAddTagGroupAtEnd(lowerGroup);
			}
		} // end of loop to record DP images (spots)
		
		// end here if DF images not taken.
		if(ImagesTaken == false){
			result("\n No Dark field images taken in Image Set.");
			ImageList.TagGroupCopyTagsFrom(filesToSearchFor);
			result("\n List of image set files complete");
			return 1;
		}
		
		// Record Darkfield/BF Images
		ImageSet.TagGroupGetTagAsTagGroup("Images", images);
		if(images.TagGroupIsValid() == false){
			result("Error loading Images list. Diffraction Pattern list discarded.");
			return 0;
		}
		
		numberOfSpots = images.TagGroupCountTags();
		for(i=0; i < numberOfSpots; i++){
			// For each darkfield image (DF) that was taken, save its name into the filesToSearchFor taglist
			TagGroup ImageData;
			if(i == 0){ // first image is the Brightfield image, not a darkfield image.
				self.getImageDataFromImageSet (ImageSet, "BF", i, 0, ImageData);
			} else {
				self.getImageDataFromImageSet (ImageSet, "DF", i, 1, ImageData);
			}
			string fileName;
			ImageData.TagGroupGetTagAsString("FileName", fileName);
			
			TagGroup thisGroup;
			thisGroup.TagGroupCreateNewLabeledTag("Name")
			thisGroup.TagGroupSetTagAsString("Name" , fileName );
			filesToSearchFor.TagGroupAddTagGroupAtEnd(thisGroup);
			
			if(ShadowMode == true){
				self.getImageDataFromImageSet (ImageSet, "DF", i, 2, ImageData);
				TagGroup higherGroup = NewTagGroup();
				ImageData.TagGroupGetTagAsString("FileName", fileName);
				higherGroup.TagGroupCreateNewLabeledTag("Name")
				higherGroup.TagGroupSetTagAsString( "Name", fileName );
				filesToSearchFor.TagGroupAddTagGroupAtEnd(higherGroup);
				
				self.getImageDataFromImageSet (ImageSet, "DF", i, 3, ImageData);
				TagGroup lowerGroup = NewTagGroup();
				ImageData.TagGroupGetTagAsString("FileName", fileName);
				lowerGroup.TagGroupCreateNewLabeledTag("Name")
				lowerGroup.TagGroupSetTagAsString("Name" , fileName );
				filesToSearchFor.TagGroupAddTagGroupAtEnd(lowerGroup);
			}
		} // end of loop to record DF images (images)
		
		result("\n List of image set files complete");
		ImageList.TagGroupCopyTagsFrom(filesToSearchFor);
		return 1;
	}
	
	
	
	/* Check to see if all the images in an imageSet are present in the imageset directory
		passes on a list of found files, a list of missing files .
		returns 1 if all files found, 0 if there are any missing files.
	*/
	number allFilesPresent(object self, TagGroup ImageSet, String ImageSetDir, TagGroup &missingFiles, TagGroup &foundFiles)
	{
		result("\nChecking to see if all files are in the image set directory.");
		result("\n Loading file names from Directory");
		TagGroup filesInImageSetDir = GetFilesInDirectory( ImageSetDir, 1 );
		// Format of file list is an indexed TagList. Each file is an entry on the TagList.
		// Each TagList entry has a labelled tag called Name, which contains the file name with extension but *not* the full directory path.

		result("\n Loading file names from Image Set");
		TagGroup filesInImageSet;
		number ImageSetListCreated = self.listAllImageFilesInImageSet(ImageSet, filesInImageSet);
		if(ImageSetListCreated == false){
			result("\n Error loading file names from Image Set Data. Ending function");
			return 0;
		}
		
		number NumberOfFiles = filesInImageSetDir.taggroupcounttags();
		number NumberOfFilesInImageSet = filesInImageSet.taggroupcounttags();
		
		// For each image in the ImageSet look for it in the imageSetDir list. If it is missing then add it to the missingFiles list.
		number i, j;
		string thisFileName, thatFileName;
		missingFiles = NewTagList();
		foundFiles = NewTagList();
		
		for(i=0; i < NumberOfFilesInImageSet; i++)
		{
			TagGroup thisImage;
			filesInImageSet.TagGroupGetIndexedTagAsTagGroup(i, thisImage);
			thisImage.TagGroupGetTagAsString("Name", thisFileName);
			number fileFoundFlag = 0;
			for(j = 0; j < NumberOfFiles; j++){
				TagGroup thatImage;
				filesInImageSetDir.TagGroupGetIndexedTagAsTagGroup(j, thatImage);
				thatImage.TagGroupGetTagAsString("Name", thatFileName);
				if(thisFileName == thatFileName){
					fileFoundFlag = 1;
					TagGroup temp = NewTagGroup();
					temp.TagGroupCreateNewLabeledTag("Name")
					temp.TagGroupSetTagAsString("Name" , thisFileName );
					foundFiles.TagGroupAddTagGroupAtEnd(temp);
					break;
				}
			} // end of matching filename loop
			if (fileFoundFlag == false) {
				// add file to missingFiles list
				TagGroup temp = NewTagGroup();
				temp.TagGroupCreateNewLabeledTag("Name")
				temp.TagGroupSetTagAsString("Name" , thisFileName );
				missingFiles.TagGroupAddTagGroupAtEnd(temp);
			}
		} // end loop going through files.
		
		if(missingFiles.TagGroupCountTags() == 0){
			result("\n All files are accounted for.");
			return 1;
		} else {
			result("\n There are " + missingFiles.TagGroupCountTags() + " files missing.");
			return 0;
		}
	}
	
}

