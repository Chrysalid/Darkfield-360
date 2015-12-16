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
	*/
	void addImageSet(object self, TagGroup imageSet){
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
			} else {
				// image set does not exist all ready...
				if(debugMode == true){result("\nAdding an image set to the imageSet store.");}
				imageSets.TagGroupAddTagGroupAtEnd(imageSet)
				currentImageSetIndex = (imageSets.TagGroupCountTags() - 1); // Set this image set as the current image set.
				if(debugMode == true){result("\ncurrentImageSetIndex is now " + currentImageSetIndex);}
			}
		} else {
			result("\nERROR: No image set ID found when adding the image set to list (or updating one).")
			return;
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
	
	/* Save the taggroup as a .s or .txt file so it can be read more easily by a human.
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

}

