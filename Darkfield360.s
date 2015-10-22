// Updates to make
// Allow colour selection in createMap()

// Bugs to test:
// Save images sometimes makes tiffs instead of gatan?
// Check integrated images are functional.


//*******************************
// 	TOOLKIT BUTTON ICONS
//*******************************
rgbimage calibrateButton;
rgbimage microscopeButton;
rgbimage targetButton;
rgbimage ringButton;
rgbimage xButton;
rgbimage helpButton;
rgbimage optionButton;
rgbimage cameraButton;

/* Button icons. comment-fold */

calibrateButton := [32, 32]:
{
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,193,195,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,195,195,194,195,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,194,195},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,195,193},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194},
{194,194,194,194,194,194,194,194,194,194,194,194,195,193,193,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,190,132,79,36,18,4,5,20,49,88,145,193,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,117,23,0,0,0,0,0,0,0,0,0,0,25,109,194,194,194,194,194,194,194},
{195,194,194,194,195,194,194,194,194,186,65,0,0,0,0,0,0,1,1,0,0,1,0,0,0,194,194,194,194,194,194,193},
{193,194,194,194,194,194,194,194,194,65,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,195,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,115,0,0,0,0,0,11,92,154,184,189,161,97,13,0,0,0,194,194,195,194,194,194,194},
{194,193,194,194,194,195,194,188,20,0,0,0,0,30,171,194,194,194,195,194,194,186,84,1,0,194,194,193,194,194,194,194},
{194,194,194,194,194,194,194,126,0,1,0,0,7,169,194,194,194,194,194,194,194,194,194,136,11,194,194,194,194,194,194,194},
{195,194,194,194,194,194,194,73,0,0,0,0,85,194,194,194,194,194,195,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,32,0,0,0,0,147,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,195,194,194,194,194,15,0,0,0,0,179,194,194,194,193,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,195,194,194,194,3,0,0,0,0,190,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,194},
{194,194,194,195,194,194,194,14,0,0,0,0,179,194,194,195,194,194,194,195,193,194,194,194,194,194,194,194,194,194,194,194},
{194,193,195,194,194,194,194,30,0,0,0,0,151,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,193,194,194,194,66,0,0,0,0,89,194,194,194,194,194,193,194,194,194,194,194,194,194,194,194,195,194,194,194},
{194,194,194,194,194,194,195,119,0,0,0,0,8,172,194,194,194,194,194,195,194,194,194,148,13,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,182,11,0,0,0,0,33,173,194,194,194,194,194,194,189,100,3,0,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,100,0,0,0,0,0,11,94,154,185,189,166,107,21,0,0,0,194,194,195,194,194,194,194},
{194,194,194,194,193,194,195,194,191,50,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,194,194,194,195,194,194,195},
{194,194,194,194,194,194,194,194,194,182,49,0,0,1,0,0,0,0,0,0,0,0,0,0,0,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,192,103,14,0,0,0,0,0,0,0,0,0,0,36,120,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,186,122,73,33,15,2,4,18,49,97,157,194,195,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,195,194,193,194,194,194,194,194,195,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194}
}

microscopeButton := [32, 32]:
{
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,65,22,73,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,10,0,2,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,41,0,1,56,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,22,0,0,1,20,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,53,0,0,1,1,51,84,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,82,1,0,1,1,1,11,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,31,0,1,1,1,0,36,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,68,0,1,1,1,0,6,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,12,1,1,1,0,0,2,20,66,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,84,46,1,1,1,0,0,1,1,1,0,61,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,76,0,1,1,0,0,1,1,1,0,0,4,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,25,1,1,0,0,1,1,1,0,0,1,1,69,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,84,194,63,1,1,0,0,1,1,1,0,0,1,1,1,69,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,84,57,74,8,1,0,0,1,1,1,0,0,1,1,1,0,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,76,0,1,1,0,0,1,1,27,13,0,1,1,1,0,0,50,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,22,1,1,0,0,1,1,0,77,81,32,0,0,0,0,1,3,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,83,66,11,0,0,1,1,1,48,84,194,194,194,194,47,1,1,1,62,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,42,0,1,1,0,0,70,194,194,194,194,194,1,1,0,40,83,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,84,75,23,0,0,19,194,194,194,194,194,194,16,0,0,28,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,62,5,71,194,194,194,194,194,194,18,0,1,26,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,0,1,1,35,194,194,194,194,194,194},
{194,194,194,194,82,77,77,77,76,77,77,77,77,76,77,79,194,194,194,194,194,60,1,1,1,55,194,194,194,194,194,194},
{194,194,194,194,58,0,1,1,1,0,0,1,1,1,0,34,84,194,194,194,194,7,1,1,0,194,194,194,194,194,194,194},
{194,194,194,194,57,1,1,1,0,0,1,1,1,0,0,33,83,194,194,73,13,1,1,0,39,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,29,1,1,0,0,20,49,61,54,30,0,1,1,0,9,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,20,0,0,1,1,1,0,0,1,1,1,0,4,72,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,38,1,1,1,0,0,1,1,1,0,20,76,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,78,45,44,45,45,44,46,37,2,0,0,1,1,1,0,24,48,43,45,45,43,64,194,194,194,194,194},
{194,194,194,194,194,21,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,0,67,194,194,194,194},
{194,194,194,194,194,14,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,59,194,194,194,194},
{194,194,194,194,194,15,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,60,194,194,194,194},
{194,194,194,194,194,52,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,17,80,194,194,194,194}
}

targetButton := [32, 32]:
{
{194,194,194,194,194,194,194,195,194,195,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,193,194,194,194,194,195},
{194,194,194,194,194,194,194,194,194,194,194,194,194,193,194,194,194,193,194,194,194,194,194,194,194,194,194,195,194,194,194,194},
{194,194,194,194,193,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,0,194,194},
{194,194,194,0,194,194,194,194,194,195,193,194,194,194,194,194,194,194,195,194,194,194,193,194,194,194,194,194,0,194,194,195},
{194,194,194,194,0,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,195,194,194,194,194,194,0,194,194,194,194},
{194,194,194,194,194,0,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,0,194,194,194,194,194},
{194,194,194,194,194,194,0,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,0,194,194,194,194,195},
{195,194,194,194,194,194,194,0,194,194,0,194,194,194,193,194,194,194,194,194,194,193,0,194,194,0,194,194,194,194,194,194},
{193,194,194,194,194,194,194,194,0,194,0,194,194,194,194,194,194,194,194,194,195,194,0,194,0,194,194,193,194,193,194,194},
{194,194,194,195,194,194,194,194,194,0,1,194,194,194,194,194,194,194,194,194,194,194,0,0,194,194,194,194,194,195,194,194},
{194,194,194,193,194,194,194,0,0,1,0,194,195,194,194,194,194,194,194,194,195,194,0,0,0,0,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,193,193,158,61,11,11,61,159,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,195,194,194,194,194,194,194,194,158,13,0,0,0,0,12,158,194,194,194,194,194,194,194,194,194,195,194,194},
{194,194,194,194,195,194,194,193,194,194,194,194,61,0,0,0,0,0,0,61,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,195,194,194,194,11,0,0,1,0,0,0,11,194,194,194,194,194,194,194,194,194,194,193,194},
{194,194,194,194,194,194,194,195,194,194,195,194,11,0,0,1,0,0,0,11,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,195,194,194,194,194,194,194,194,61,0,0,0,0,0,0,61,194,194,194,194,194,194,194,195,194,194,194,194},
{194,194,194,194,194,194,193,194,194,194,194,194,158,11,0,0,0,0,12,159,194,194,194,194,194,194,194,194,195,194,194,194},
{194,194,194,194,194,194,194,194,194,193,194,194,194,158,61,11,11,61,158,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,194,194,194,194,194,195,194,195,194,194,194,194,194,194,194,193},
{194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,195,194,194,194,194,194,194,194,194,193,194,194,195,194,194,194,194},
{194,194,194,194,194,195,0,0,0,1,194,194,193,194,194,194,194,194,194,194,194,0,0,0,0,194,194,194,193,194,194,194},
{194,194,194,194,194,194,194,194,0,0,194,195,194,194,194,194,194,194,194,194,194,0,0,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,0,194,0,194,194,194,194,194,195,194,194,194,194,194,0,194,0,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,0,194,194,0,194,194,194,193,194,194,194,194,194,194,193,0,194,194,0,194,194,194,194,194,194,194},
{194,195,194,194,194,0,194,194,194,195,194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,0,193,194,194,194,194,194},
{194,194,195,194,0,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,194,193,194,194,0,194,194,194,194,194},
{194,194,194,0,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,193,0,194,194,194,194},
{194,194,0,194,195,194,194,194,194,194,194,194,194,194,194,194,194,195,195,194,194,194,194,194,194,194,194,193,1,194,194,194},
{194,194,194,194,194,195,194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,194,195,194,194,194,194,194,195,195},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194,194,194}
}

ringButton := [32, 32]:
{
{194,194,194,194,194,194,194,194,194,194,193,194,195,194,194,194,194,194,194,194,194,195,194,194,194,194,194,195,194,194,194,194},
{194,194,194,194,194,194,194,193,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194},
{194,195,194,194,194,194,194,194,194,194,194,194,0,0,0,0,1,0,0,0,0,195,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,195,194,194,194,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,193,195,194,194,194,194,194,194},
{194,194,194,194,194,194,194,195,0,0,1,0,0,0,194,194,194,194,194,0,0,0,0,0,1,194,194,194,194,195,194,194},
{194,195,194,194,194,194,0,0,0,0,0,194,194,194,195,194,194,194,194,194,194,194,0,0,0,0,0,194,194,194,193,194},
{194,193,195,195,195,0,0,0,0,0,195,194,194,194,194,194,194,194,194,194,194,194,194,0,0,0,0,0,194,194,194,194},
{194,194,194,194,0,0,0,0,194,194,195,194,194,0,0,0,0,0,1,0,195,194,194,194,194,0,0,0,0,195,194,194},
{194,194,194,194,0,0,0,193,194,194,194,0,1,0,0,0,0,0,0,0,0,0,194,194,194,194,0,0,0,194,194,194},
{194,194,194,0,0,0,194,194,194,194,0,0,0,0,0,194,194,194,0,0,0,0,0,194,194,194,194,0,0,0,194,194},
{194,194,194,0,0,0,194,194,194,0,0,0,0,194,194,194,194,194,194,194,0,0,0,0,194,194,194,0,0,0,194,194},
{194,194,194,0,0,193,194,194,194,1,0,0,194,194,194,194,194,194,194,194,194,0,0,0,194,194,194,195,0,0,194,195},
{194,194,0,0,0,194,195,194,1,0,0,194,194,194,0,1,1,0,0,195,194,194,0,0,0,194,194,194,0,0,0,193},
{194,194,0,1,0,194,193,194,0,0,0,194,194,1,0,0,0,0,0,0,194,194,0,0,0,194,194,194,0,0,0,194},
{194,195,0,0,194,194,194,194,0,0,194,194,194,0,0,0,194,0,0,0,194,194,194,0,1,194,194,194,194,0,0,195},
{194,194,0,0,194,194,194,194,0,0,194,194,195,0,0,194,193,194,0,1,194,194,194,0,0,194,195,194,194,0,0,194},
{194,194,0,0,194,194,194,194,0,0,194,194,194,0,0,0,194,0,0,0,194,194,195,0,0,194,194,194,194,0,0,194},
{194,195,0,0,194,194,194,194,0,0,0,194,194,0,1,0,0,0,0,0,194,194,0,0,0,194,194,194,194,0,0,194},
{194,194,0,1,0,194,193,194,0,0,0,194,194,195,0,0,0,0,0,194,194,194,0,0,0,194,194,194,0,0,0,194},
{194,194,0,0,0,194,195,194,194,0,0,0,194,194,194,194,195,194,194,194,194,0,0,1,195,194,194,194,0,0,0,195},
{194,194,194,0,0,193,194,194,194,0,0,0,0,194,194,194,194,194,194,194,0,0,0,0,194,194,194,194,0,1,194,194},
{194,194,194,0,0,0,194,194,194,194,1,0,0,0,0,194,194,194,0,0,0,0,0,194,195,194,194,0,0,0,194,194},
{194,194,194,0,0,0,194,194,194,194,194,0,0,0,0,0,0,0,0,0,1,0,194,194,194,194,194,0,0,0,194,194},
{194,194,194,194,0,0,0,193,194,194,194,194,194,0,0,0,0,0,0,1,194,194,194,194,194,194,0,0,0,194,194,194},
{194,194,194,194,0,0,0,0,194,194,194,194,194,194,194,194,194,194,195,195,194,194,194,194,194,0,0,0,0,195,194,194},
{194,193,195,195,195,0,0,0,0,0,194,194,194,194,193,194,194,194,194,195,194,194,194,0,0,0,0,0,194,194,194,194},
{194,195,194,194,194,194,0,0,0,0,0,194,194,193,194,194,194,194,194,194,194,194,0,0,0,0,0,194,194,194,193,194},
{194,194,194,194,194,194,194,195,0,0,0,0,0,0,194,194,194,194,194,0,0,0,0,0,1,194,194,194,194,195,194,194},
{194,194,194,194,194,195,194,194,194,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,193,195,194,194,194,194,194,194},
{194,195,194,194,194,194,194,194,194,194,194,194,0,0,0,0,0,0,0,0,0,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,193,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,193,194,194,194,194,194,194,193,194,194,194,195,194,194,194,194,194,195,194,194,194,194}
}

xButton := [16, 16]:
{
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,0,0,0,194,194,194,194,194,194,194,194,0,0,0,194},
{194,0,1,0,1,194,194,194,194,194,194,1,0,1,0,194},
{194,0,0,0,0,0,194,194,194,194,0,0,0,0,0,194},
{194,194,0,0,1,0,0,195,195,0,0,1,0,0,194,194},
{194,194,194,0,0,0,0,0,0,0,0,0,0,194,194,194},
{194,194,194,194,0,0,0,0,0,0,0,0,194,194,194,194},
{194,194,194,194,194,0,0,0,0,0,0,194,194,194,194,194},
{194,194,194,194,194,0,0,0,0,0,0,194,194,194,194,194},
{194,194,194,194,0,0,0,0,0,0,0,0,194,194,194,194},
{194,194,194,0,0,0,0,0,0,0,0,0,0,194,194,194},
{194,194,0,0,1,0,0,195,195,0,0,1,0,0,194,194},
{194,0,0,0,0,0,194,194,194,194,0,0,0,0,0,194},
{194,0,1,0,1,194,194,194,194,194,194,1,0,1,0,194},
{194,0,0,0,194,194,194,194,194,194,194,194,0,0,0,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194}
}

helpButton := [16, 16]:
{
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{195,194,194,194,0,0,0,0,0,0,0,194,194,194,194,194},
{194,195,194,0,0,0,0,0,0,0,0,0,194,194,194,195},
{195,195,194,0,0,0,0,0,0,0,1,0,0,194,194,194},
{194,194,194,0,194,194,195,194,194,0,0,0,0,194,194,194},
{194,194,194,194,194,194,194,194,194,0,1,0,0,194,194,194},
{194,194,194,194,194,194,194,194,194,0,0,0,0,194,194,194},
{194,194,194,194,194,194,194,194,1,0,0,0,194,194,194,194},
{195,194,194,194,195,194,0,0,0,0,0,194,194,194,194,194},
{194,194,194,194,194,0,1,0,0,194,194,194,194,194,194,194},
{194,194,194,195,195,0,0,0,194,194,194,194,194,194,194,194},
{194,194,194,194,194,0,0,0,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,195,194},
{194,194,194,194,194,0,0,0,0,194,194,194,194,194,194,194},
{194,193,194,194,195,0,0,0,0,194,194,194,194,194,194,194},
{194,194,194,194,194,0,0,0,1,194,194,194,194,194,194,194}
}

optionButton := [32, 32]:
{
{194,194,194,194,194,194,194,194,194,194,194,194,194,17,6,2,2,7,19,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,25,0,0,0,0,0,0,26,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,23,0,0,0,0,0,0,24,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,37,14,3,28,194,194,33,16,0,0,0,0,0,0,15,32,194,194,28,2,12,37,194,194,194,194,194},
{194,194,194,194,30,2,0,0,0,22,10,0,0,0,0,0,0,0,0,0,0,10,21,0,0,0,2,31,194,194,194,194},
{194,194,194,36,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,38,194,194,194},
{194,194,194,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,194,194,194},
{194,194,194,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,194,194,194},
{194,194,194,27,0,0,0,0,0,0,0,0,0,0,12,20,20,13,0,0,0,0,0,0,0,0,0,0,28,194,194,194},
{194,194,194,194,21,0,0,0,0,0,0,0,26,194,194,194,194,194,194,26,0,0,0,0,0,0,0,21,194,194,194,194},
{194,194,194,194,10,0,0,0,0,0,5,35,194,194,194,194,194,194,194,194,34,5,0,0,0,0,0,10,194,194,194,194},
{194,194,194,32,0,0,0,0,0,0,35,194,194,194,194,194,194,194,194,194,194,34,0,0,0,0,0,0,32,194,194,194},
{194,26,23,15,0,0,0,0,0,26,194,194,194,194,194,194,194,194,194,194,194,194,25,0,0,0,0,0,15,23,26,194},
{18,0,0,0,0,0,0,0,0,194,194,194,194,194,194,194,194,194,194,194,194,194,194,0,0,0,0,0,0,0,0,17},
{8,0,0,0,0,0,0,0,13,194,194,194,194,194,194,194,194,194,194,194,194,194,194,12,0,0,0,0,0,0,0,6},
{2,0,0,0,0,0,0,0,20,194,194,194,194,194,194,194,194,194,194,194,194,194,194,20,0,0,0,0,0,0,0,2},
{1,0,0,0,0,0,0,0,20,194,194,194,194,194,194,194,194,194,194,194,194,194,194,20,0,0,0,0,0,0,0,2},
{6,0,0,0,0,0,0,0,13,194,194,194,194,194,194,194,194,194,194,194,194,194,194,13,0,0,0,0,0,0,0,8},
{17,0,0,0,0,0,0,0,0,194,194,194,194,194,194,194,194,194,194,194,194,194,194,0,0,0,0,0,0,0,0,19},
{194,26,24,15,0,0,0,0,0,26,194,194,194,194,194,194,194,194,194,194,194,194,26,0,0,0,0,0,16,24,26,194},
{194,194,194,32,0,0,0,0,0,0,35,194,194,194,194,194,194,194,194,194,194,35,0,0,0,0,0,0,33,194,194,194},
{194,194,194,194,9,0,0,0,0,0,5,35,194,194,194,194,194,194,194,194,35,4,0,0,0,0,0,11,194,194,194,194},
{194,194,194,194,21,0,0,0,0,0,0,0,26,194,194,194,194,194,194,26,0,0,0,0,0,0,0,22,194,194,194,194},
{194,194,194,27,0,0,0,0,0,0,0,0,0,0,13,20,20,13,0,0,0,0,0,0,0,0,0,0,29,194,194,194},
{194,194,194,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,194,194,194},
{194,194,194,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13,194,194,194},
{194,194,194,38,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,37,194,194,194},
{194,194,194,194,30,2,0,0,0,22,9,0,0,0,0,0,0,0,0,0,0,10,22,0,0,0,2,31,194,194,194,194},
{194,194,194,194,194,37,13,3,29,194,194,32,15,0,0,0,0,0,0,16,33,194,194,27,3,14,38,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,23,0,0,0,0,0,0,24,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,26,0,0,0,0,0,0,26,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,19,8,2,2,6,17,194,194,194,194,194,194,194,194,194,194,194,194,194}
}

cameraButton := [32, 32]:
{
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,72,64,64,64,64,64,64,64,64,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,40,0,0,0,0,0,0,0,0,0,0,49,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,2,0,0,0,0,0,0,0,0,0,0,13,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,0,0,0,0,0,0,0,0,0,0,0,3,194,194,194,194,194,194,194,194,194,194},
{194,55,38,39,39,39,39,39,39,34,0,0,0,0,0,0,0,0,0,0,0,0,41,39,39,39,39,39,39,38,56,194},
{71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,194},
{64,0,0,0,0,0,0,0,0,0,0,0,0,28,50,60,60,48,27,0,0,0,0,194,194,194,194,194,194,46,0,74},
{64,0,0,0,0,0,0,0,0,0,0,25,194,194,194,194,194,194,194,72,21,0,0,63,64,64,64,64,64,41,0,74},
{64,0,0,0,0,0,0,0,0,0,36,194,194,194,194,194,194,194,194,194,194,29,0,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,21,194,194,194,61,23,9,9,24,62,194,194,194,17,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,70,194,194,48,0,0,0,0,0,0,51,194,194,65,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,21,194,194,66,0,0,0,0,0,0,0,0,69,194,194,17,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,41,194,194,30,0,0,0,0,0,0,0,0,33,194,194,37,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,51,194,194,18,0,0,0,0,0,0,0,0,19,194,194,45,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,48,194,194,20,0,0,0,0,0,0,0,0,22,194,194,44,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,36,194,194,42,0,0,0,0,0,0,0,0,43,194,194,30,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,15,194,194,194,7,0,0,0,0,0,0,8,194,194,194,11,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,57,194,194,67,10,0,0,0,0,12,68,194,194,54,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,9,194,194,194,194,52,31,32,53,194,194,194,194,6,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,0,16,194,194,194,194,194,194,194,194,194,75,14,0,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,0,0,6,51,194,194,194,194,194,194,47,4,0,0,0,0,0,0,0,0,0,0,74},
{64,0,0,0,0,0,0,0,0,0,0,0,0,5,26,35,34,25,4,0,0,0,0,0,0,0,0,0,0,0,0,73},
{194,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,194},
{75,72,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,58,75,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194},
{194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194,194}
}
/* end-fold */
// end of buttons

//******************************
// Interfaces
//******************************
// These are Forward Declarations of methods used in classes. You can force them to run on ANY object, which can break things easily.
// However, it helps avoid the problem of classes calling class methods in other, undefined classes.

// All classes need to be able to reference the following methods in the Toolkit class before it is defined.
interface ToolkitInterface
{
	void storeTiltCoord (object self, number shadowDistance, number storeTiltOnly); // Used in Keyhandler
	void toggleMarkerRing(object self); // Used in Keyhandler
	void setRingRadius(object self, number desiredRadiusNM); // Used in Keyhandler
	void updateRadius(object self); // Used in Keyhandler
	void beamCentre(object self); // Used in Keyhandler
}

//*******************
//  BASE FUNCTIONS - These do not require any interaction with classes and can be used by any other functions
//*******************
number true = 1;
number false = 0;
number versionNumber = 0.20

/* Calculates and returns several statistics for an image.
	Taken from www.dmscripting.com
 */
void StandardDeviation(image arrayimg, number &stddev, number &n, number &mean, number &sum){
	mean=mean(arrayimg)
	number xsize, ysize
	getsize(arrayimg,xsize, ysize)
	n=xsize*ysize

	sum=sum(arrayimg)
	image imgsquared=arrayimg*arrayimg
	number sumofvalssqrd=sum(imgsquared)
	stddev=sqrt(((n*sumofvalssqrd)-(sum*sum))/(n*(n-1)))
}

/* Pads out a number value with 0's until it is the length set in PadOutTo */
string PadWithZeroes(number value, number PadOutTo) {
	string startstring = "" + value;
	number stringlen=len(startstring);
	while(stringlen<PadOutTo) {
		startstring="0"+startstring;
		stringlen=len(startstring);
	}
	return startstring;
	}

/* Makes the image take up all available screen space. Used to position the alignment dialogs. */
void zoomImage(image myImage){
	// Taken from http://www.dmscripting.com/files/Zoom_To_Full_Screen.s
	number screenWidth, screenHeight, imagewidth, imageheight, zoomfactor
	number xPos, yPos, zoom
	GetScreenSize( screenWidth, screenHeight )
	number workingareawidth = screenwidth-150
	number workingareaheight = screenheight-32

	GetSize( myImage, imagewidth, imageheight)
	number scalewidth = workingareawidth/imagewidth
	number scaleheight = workingareaheight/imageheight

	If(scalewidth>scaleheight)
		{
			zoomfactor = scaleheight
		}
	else
		{
			zoomfactor = scalewidth
		}
			
	SetWindowPosition( myImage, 142,24 )
	SetWindowSize( myImage, imagewidth*zoomfactor, imageheight*zoomfactor)
	setzoom(myimage, zoomfactor)
	SetImagePositionWithinWindow( myImage, 0, 0 );
}

/* Convert between commonly used unit types */
number convertInverseNMToAngstrom(number InverseNM){
	number Angstroms;
	Angstroms = (1 / InverseNM) * 10;
	return Angstroms;
}

number convertAngstromToInverseNM(number Angstroms){
	number InverseNM;
	InverseNM = 1 / (Angstroms / 10);
	return InverseNM;
}


/* Functions to print out instructions to the output window. */
void printCommands(){
	result("\n\nShortcut Keys Available:");
	result("\n\t'h' to display these commands again.");
	result("\n\t's' to store a diffraction spot's coordinates.");
	result("\n\t'r' to erase the stored diffraction spot cordinates.");
	result("\n\t'p' to print stored tilt data to this screen.");
	//result("\n\t't' to switch the built-in toggle. This is not currently used");
	result("\n\t'1' to show the ring marker and measuring system.");
	result("\n\t'2' to move the marker ring to a set D-Spacing.");
	result("\n\t'3' to update the ring-mode radius display.");
	result("\n\t'0' to return the beam to the centre of the screen.");
}
void printGreeting(){
	result("\n\n\n------- DarkField 360 Quick Start Guide --------");
	result("\nMake sure that the magnification (SA-MAG mode) and camera length are set to the desired values and focused.");
	result("\nSelect the camera length being used and the scale will be set.");
	result("\n\tIf the scale is incorrect a custom scale can be entered on the Options tab.");
	result("\nActivate the Bright Tilt or Dark Tilt controls and enter diffraction mode.");
	result("\nThe DEF/STIG dials can then be used to tilt the beam and move the diffraction pattern around the screen.");
	result("\nAlign the central beam with the image centre crosshairs and then press 'CALIBRATE TILT' to begin the calibration function.");
	result("\n\tFollow the onscreen prompts to set the tilt calibration values. This allows the program to accurately control the diffraction pattern");
	result("\nCenter a diffraction spot and press 'Single Diffraction Spot' to record its position. \n\tAn image of the diffraction pattern is saved to record this.");
	result("\nOr you can place Region of Interest (ROI) points at desired locations on the View window and then press 'Target All ROI'");
	result("\nAll relatively bright spots with a specific d-spacing can be targetted using the marker ring system and the 'Target Entire Ring' command.")
	result("\nWhen you are done select 'Start Darkfield Imaging' to begin imaging. You will need to insert and align the Objective Aperture.");
	result("\nFollow the on-screen prompt to switch to imaging mode (SA-MAG mode), align the brightfield image and press okay when ready");
	result("\nAfter the images have been stored they can be converted into binary images using the image processing controls.")
}

/* Function to change the directory that Digital Micrograph uses to auto-save images */
string setAutoSaveDir (){
	string oldDir, newDir, applicationstring
	number length;
	applicationstring = "auto_save" // This is the codename for the auto-save directory (dir_name)
	
	try
		// GetApplicationDirectory( string dir_name, number create_if_necessary, string &dir_path_out )
		GetApplicationDirectory(applicationstring, 0, oldDir ); // The old directory
	catch
	{
		result("\nCurrent AutoSave directory does not exist.");
		break;
	}

	if(!SaveAsDialog("","Press Save to select this directory", newDir))
 	{
        newDir = oldDir;
	}
	
	//string PathExtractDirectory( string path, number path_type )
	// returns the directory portion of the given path according to the path_type parameter. The path_type variable should be 0.
	newDir = PathExtractDirectory( newDir, 0 ); // newDir is now the directory path
	// void SetApplicationDirectory( string dir_name, number create_if_necessary, string dir_path )
	SetApplicationDirectory( applicationstring, 1, newDir ) // Set new directory
	return newDir
}

/* Returns a list of file names and a directory containing them based on user selection.
*/
TagGroup makeFileListGroup(){
	result("\nMaking Filelist...")
	string newDir;
	TagGroup DFList = NewTagGroup();
	if(!SaveAsDialog("","Press Save to select this directory", newDir))
 	{
        throw("User cancelled operation: No directory selected");
 	}
	
	newDir = PathExtractDirectory( newDir, 0 ); // newDir is now the directory path
	TagGroupCreateNewLabeledTag( DFList, "Directory" ); // Creates the tag for the file directory
	DFList.TagGroupSetTagAsString( "Directory" , newDir ); // sets the directory
	
	TagGroup fileList = GetFilesInDirectory(newDir, 1);
	TagGroupAddLabeledTagGroup( DFList, "files", fileList );
	// The tag list is indexed from 0 and each entry has an entry called "Name"
	Number fileListLength = taggroupcounttags(fileList)
	return DFList;
}

/* Function to open a list of files, open them and then record their ImageIDs in an indexed TagList for use in other functions
	the input list is the output of makeFileListGroup();
*/
TagGroup makeImageIDList (TagGroup DFList){
	result("\nMaking ImageID List...")
	TagGroup imageList = NewTagList();
	TagGroup fileList = TagGroupGetOrCreateTagList( DFList, "files" )
	number totalImages = taggroupcounttags(fileList);
	result("\n\t" + totalImages + " to open and catalogue")
	DocumentWindow tagViewWindow = TagGroupOpenBrowserWindow( fileList, 0 )
	string directory
	DFList.TagGroupGetTagAsString("Directory", directory);
	result("\n\tDirectory: " + directory);
	number i;
	for(i=0;i < totalImages;i++)
	{
		result("\n\tOpening image " + i)
		String filename
		TagGroup temp;
		TagGroupGetIndexedTagAsTagGroup( fileList, i, temp )
		TagGroupGetTagAsString( temp , "Name" , filename );
		result("\n\tFilename: " + filename);
		// Check that the image can be opened.
		string fileExtension = filename.right( (filename.len() - filename.find(".") ) - 1);
		fileExtension.StringToLower();
		result("\nFile extension: " + fileExtension);
		if( (fileExtension != "dm3") &&\
		(fileExtension != "dm4") &&\
		(fileExtension != "gif") &&\
		(fileExtension != "tif") &&\
		(fileExtension != "tiff") &&\
		(fileExtension != "jpg") &&\
		(fileExtension != "jpeg") &&\
		(fileExtension != "pcx") &&\
		(fileExtension != "pict") &&\
		(fileExtension != "pct") &&\
		(fileExtension != "pic") ) { // is unknown file type
			continue;
		}
		
		string filePath = PathConcatenate( directory, filename);
		result("\n\tFilePath: " + filePath);
		image newIm := OpenImage ( filePath );
		showImage( newIm )
		if(newIm.ImageIsValid() == 0){
			throw("Image not found by File Path");
		}
		imageList.TagGroupInsertTagAsNumber(infinity(), newIm.ImageGetID())  // add image ID to list
	}
	result("\nImages opened and IDs found.")
	return imageList;
}

/* Builds a timestamp string formatted as I want it */
string constructTimeStamp(){
	number timeNumber = GetCurrentTime();
	number year, month, day, hour, minute, second, nanosecond;
	DeconstructLocalGregorianDate( timeNumber, year, month, day, hour, minute, second, nanosecond );
	String timeString = "" + year;
	timestring = timestring + month;
	timestring = timestring + day;
	timestring = timestring + "_" + hour + "_" + minute;
	return timeString;
}

/* Returns an rgbNumber from my colour blind friendly palette based on an input number 1-9
	returns black if the number is invalid;
 */
rgbnumber colourBlind(number selection) {
	rgbnumber thisColour;
	if(selection == 1){
		thisColour = rgb(136,204,238);
	} else
	if(selection == 2){
		thisColour = rgb(68,170,153);
	} else
	if(selection == 3){
		thisColour = rgb(17,119,51);
	} else
	if(selection == 4){
		thisColour = rgb(153,153,51);
	} else
	if(selection == 5){
		thisColour = rgb(221,204,119);
	} else
	if(selection == 6){
		thisColour = rgb(204,102,119);
	} else
	if(selection == 7){
		thisColour = rgb(136,34,85);
	} else
	if(selection == 8){
		thisColour = rgb(170,68,153);		
	} else
	if(selection == 9){
		thisColour = rgb(255,255,255);
	} else {
		thisColour = rgb(0,0,0);
	}
	/* debug code
	number redNumber = red(thisColour);
	number blueNumber = blue(thisColour);
	number greenNumber = green(thisColour);
	result("\nColour selected: (" + redNumber + ", " + greenNumber + ", " + blueNumber + ")");
	*/
	return thisColour;
}

/* Function to copy Tags from a reference image to a target image. */
void copyTags(image thisImage, image referenceImage){
	// Taken from http://www.dmscripting.com/copy_all_tags_between_images.html
	// Copies all tags from one image to another.
	// Calculated Images do not have the calibration, microscope, etc. information that a captured image does.
	string targetname, sourcename
	targetname=getname(thisImage)
	sourcename=getname(referenceImage)
	TagGroup sourcetags=imagegettaggroup(referenceImage)
	TagGroup targettags=imagegettaggroup(thisImage)
	taggroupcopytagsfrom(targettags,sourcetags)
	//result("\nAll tags copied from '"+sourcename+"' to '"+targetname+"'.")
}

/* Function to copy the scale used in one image over to another image */
number copyScale(image thisImage, image referenceImage){
		number scaleRefX = ImageGetDimensionScale( referenceImage, 0 );
		string stringRef = ImageGetDimensionUnitString( referenceImage, 0);
		thisImage.ImageSetDimensionScale( 0, scaleRefX );
		thisImage.ImageSetDimensionScale( 1, scaleRefX );
		thisImage.ImageSetDimensionUnitString(0, stringRef );
		thisImage.ImageSetDimensionUnitString(1, stringRef );
}

/* Function to update all open, displayed images (using windows at the moment) */
void updateAllImages(){
	// Cycle through windows
	number i = 0
	DocumentWindow window = GetDocumentWindow( i ) 
	while(window.WindowIsValid()) 
		{
			number windowType = window.WindowGetType();
			if((windowType == 4) && (window.WindowIsShown())){ // if an image window and is being shown...
				window.WindowUpdate(); // update window
			}			
			i ++
			window = GetDocumentWindow( i ) 
		}
}

// ***********************************
//   Generic Image Alignment Functions
// ***********************************

/* Function to compare two images and return how much one has moved relative to the other
	This is a generic, faster check than the Advanced version. It uses a single Cross Correlation.
*/
void findImageShift(image refIm, image newIm, number &XShift, number &YShift, number debugMode){
	number mpV, mpX, mpY, xSize, ySize;
	GetSize( refIm, xSize, ySize );
	if(debugMode==1){
		result("\nfindImageShift()");
		result("\n\tReference Image Size: " + xSize + ", " + ySize);
		GetSize( newIm, xSize, ySize );
		result("\n\tNew Image Size: " + xSize + ", " + ySize);
	}
	image CC := CrossCorrelate( refIm, newIm ); // New correlation image.
	mpV = max( CC, mpX, mpY ); // Finds coords of maximum bright point in correlation image.
	XShift = mpX - trunc( xSize / 2 ); // Shift in x-pixel coord.
	YShift = mpY - trunc( ySize / 2 ); // Shift in y-pixel coord.
	result("\n\txShift = " + xShift + "\n\tyShift = " + yShift);
}

// ************************************
//  IMAGE / WINDOW ID AND POSITIONING
// ************************************

/* Function to pass the VIEW window to a variable. It will return 1 if the window is real and 0 if it is not present */
number returnViewWindow (number debugMode, DocumentWindow &viewWindow){
	number i = 0;
	DocumentWindow thisViewWindow;
	DocumentWindow window = GetDocumentWindow( i );
	while( window.WindowIsValid( ) ) {
		string titleString = window.WindowGetTitle();
		number index = titleString.find(":"); // Looks for : to ID windows
		if(index != -1){ //No ':' means no letter-ID at the title start, and it isn't the View window
			string cutTitle = titleString.right(titleString.len() - index - 2); // Gets rid of : and a space
			if(cutTitle=="View"){ // If it is this window...
				thisViewWindow = GetDocumentWindowByTitle( titleString );
				break;
			}
		}
		i++;
		window = GetDocumentWindow( i );
	}
	if(!thisViewWindow.WindowIsValid()){
		result("\nView window not present.")
		return 0;
	} else {
		viewWindow = thisViewWindow;
		return 1;
	}
}

/* Function to pass the VIEW window's image document to other functions. */
number returnViewImageDocument(number debugMode, ImageDocument &viewImageDocument){
	//if(debugMode==1){result("\nReturnViewImageDocument()");}
	DocumentWindow viewWindow;
	if(returnViewWindow(debugMode, viewWindow)){
		viewImageDocument = viewWindow.ImageWindowGetImageDocument();
		return 1;
	} else {
		return 0;
	}
}

/* Function to pass the VIEW window's image to other functions. */
number returnViewImage(number debugMode, image &viewImage){
	ImageDocument viewImageDocument;
	if(returnViewImageDocument(debugMode, viewImageDocument)){
		viewImage := viewImageDocument.ImageDocumentGetImage(0);
		return 1;
	} else {
		return 0;
	}
}

/* Function to pass the VIEW window's imageDisplay to other functions. */
number  returnViewImageDisplay(number debugMode, imageDisplay &viewImageDisplay){
	Image viewImage;
	if(returnViewImage(debugMode, viewImage)){
		viewImageDisplay = viewImage.ImageGetImageDisplay(0);
		return 1;
	} else {
		return 0;
	}
}

/* Function to reposition the window positions when debug mode is active.
	the view window will be brought back to the front.
	Could be done in the debug functions themselves with a quick call,
		but this might be further customized later.
	Idea: Make the new images cascade
*/
void positionDebugWindow(number debugMode){
 //void WindowSetFramePosition( DocumentWindow window, Number x, Number y ) 
 //Sets the position of the top-left corner of the frame area of the 'window'.
 //void WindowGetFramePosition( DocumentWindow window, NumberVariable x, NumberVariable y ) 
 //Gets the position of the top-left corner of the frame area of the 'window'.

 //void WindowSelect( DocumentWindow window )
 //Brings 'window' to the front. 
	documentWindow viewWindow;
	image viewImage;
	if(returnViewWindow(debugMode, viewWindow)){
		WindowSelect( viewWindow );
		if(returnViewImage(debugMode, viewImage)){
			UpdateImage(viewImage);
		}
	}
}

// ************************************
//  MICROSCOPE CONTROL
// ************************************

/* Function to change the tilt of the electron beam
	targetX = X Tilt of desired spot
	targetY = Y Tilt of desired spot */
void moveBeamTilt ( number targetX, number targetY ){
	Number originX, originY;
	EMGetBeamTilt(originX, originY);
	number xVector = targetX - originX;
	number yVector = targetY - originY;
	EMChangeTilt(xVector,yVector);
	return;
}

// ************************************
//  TARGET DIFFRACTION SPOT STORAGE
// ************************************

/* Create the darkfield taglist to record information about the images taken. */
TagGroup createDFList (number tracker, number shadowing, number integration, number integrationDistance ){
	TagGroup DFList = NewTagGroup();

	TagGroupCreateNewLabeledTag( DFList, "Directory" ); // Creates the tag for the file directory
	TagGroupCreateNewLabeledTag( DFList, "UseImageID" ); // Creates the tag for UseImageID tag.
	TagGroupCreateNewLabeledTag( DFList, "BaseImage" );
	
	TagGroupCreateNewLabeledTag( DFList, "ShadowingMode" );
	DFList.TagGroupSetTagAsNumber( "ShadowingMode" , shadowing );
	TagGroupCreateNewLabeledTag( DFList, "IntegrationMode" );
	DFList.TagGroupSetTagAsNumber( "IntegrationMode" , integration );
	TagGroupCreateNewLabeledTag( DFList, "IntegrationDistance" );
	DFList.TagGroupSetTagAsNumber( "IntegrationDistance" , integrationDistance );
	number i;
	number spotGroupTotal = tracker / 3;
	string longSpotID;
	for(i=1;i<tracker;i++){
		if(integration){
			TagGroupCreateNewLabeledTag( DFList, "IntegratedImage" + (i * (tracker / integrationDistance )));
		}
		if(!shadowing){
			longSpotID = PadWithZeroes(i, 4)
			string tagPath = "Spot" + longSpotID;
			if(!TagGroupDoesTagExist( DFList, tagPath )){
				TagGroup SpotGroup = NewTagGroup(); // the tagGroup that will hold this data and then be attached to the DFList.
				TagGroupCreateNewLabeledTag( SpotGroup, "MIDDLE" );
				TagGroupAddLabeledTagGroup( DFList, tagPath, SpotGroup );
			}
		}
		if(shadowing){
			number pointNumber, rem;
			pointNumber = floor((i-1) / 3) + 1;
			longSpotID = PadWithZeroes(pointNumber, 4);
			string tagPath = "Spot" + longSpotID;
			sum 
			if(!TagGroupDoesTagExist( DFList, tagPath )){
				TagGroup SpotGroup = NewTagGroup(); // the tagGroup that will hold this data and then be attached to the DFList.
				TagGroupCreateNewLabeledTag( SpotGroup, "LOWER" ); // Creates the tag for LOWER data
				TagGroupCreateNewLabeledTag( SpotGroup, "HIGHER" ); // Creates the tag for HIGHER data
				TagGroupCreateNewLabeledTag( SpotGroup, "MIDDLE" ); // Creates the tag for MIDDLE data
				TagGroupAddLabeledTagGroup( DFList, tagPath, SpotGroup ); //Attaches the tag group
			}
		}
	}
	
	return DFList;
}


// ********************************
//	Image Alignment Dialog Class
// ********************************
// the class alignmentdialog is of the type user interface frame, and responds to interaction
// It is used to manually align two images and return the offset of each of them.

class AlignmentDialog : uiframe
{
	// Global variables
	image imagea, imageb // The two images to mess with. Will be provided at start.
	number offsetx, offsety;
	number movementSensitivity, movementSensitivitySetting;
	Number dataObjectID;
	Number ToolkitID;
	Number AlignmentID;
	number debugMode;
	
	// variable to keep track of when the thread is running and when it is not.
	Number ScanIsOn
	
	// Control signals for the thread
	Object StartSignal
	Object StopSignal
	number do_break
	
	object childDialog; // Store a clone of this dialog here for repeated use.

	// Returns the Alignment Dialog ID to external functions.
	number getAlignmentDialogID(object self){
		return AlignmentID;
	}

	// allows external functions to extract the offset values from this object. Able to call it after the dialog is closed. Not sure how long it lasts.
	void getOffsets(object self, number &offsetXExternal, number &offsetYExternal){
		offsetXExternal = offsetX;
		offsetYExternal = offsetY;
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
	//----------------------------------------
	//		Image Processing Functions
	//----------------------------------------

	// Creates two offset images of a new size.
	void makeOffsetImages(object self, image imagea, image imageb, image &newImageA, image &newImageB, number offsetx, number offsety){
		number axsize, bxsize, aysize, bysize
		getsize(imagea, axsize, aysize)
		getsize(imageb, bxsize, bysize)
		number biggestX = max(axsize, bxsize);
		number biggestY = max(aysize, bysize);
		// Check assumption that image 2 is the smaller of the two.
		if((axsize < bxsize) || (aysize < bysize) ) {
			throw ("Make the second image the smaller one");
		}
		// the placement of the second image compared to the first image. Lets us see what is out of bounds.
		// offsets can be -ve (upwards and to the left) or +ve (downwards and to the right)
		number offsetRectangleTop, offsetRectangleLeft, offsetRectangleBottom, offsetRectangleRight;
		offsetRectangleTop = offsety;
		offsetRectangleLeft = offsetx;
		offsetRectangleBottom = offsety + bysize-1;
		offsetRectangleRight = offsetx + bxsize-1;
		
		// What additional space is needed on a new image
		number extraSpaceTop, extraSpaceLeft, extraSpaceBottom, extraSpaceRight;
		extraSpaceTop = (offsetRectangleTop < 0) ? abs(offsety) : 0 ;
		extraSpaceBottom = (offsetRectangleBottom < aysize) ? 0 : (offsetRectangleBottom - aysize +2);
		extraSpaceLeft = (offsetRectangleLeft < 0) ? abs(offsetx) : 0 ; 
		extraSpaceRight = (offsetRectangleRight < axsize) ? 0 : (offsetRectangleRight - axsize +2) ;
		
		number newWidth =  axsize + extraSpaceLeft + extraSpaceRight;
		number newHeight = aysize + extraSpaceBottom + extraSpaceTop;
		// New image (a)
		newImageA := RealImage("Image A aligned", 4, newWidth, newHeight);
		newImageA = 0; // black image
		newImageA [extraSpaceTop, extraSpaceLeft, extraSpaceTop + aysize - 1, extraSpaceLeft + axsize - 1] = imagea [0,0,(aysize-1),(axsize-1)]; // paste imageA on top
		
		// New image (b)
		newImageB := RealImage("Image B aligned", 4, newWidth, newHeight);
		newImageB = 0; //blank;
		number imageBXCoord = (offsetRectangleLeft >= 0) ? offsetRectangleLeft : 0 ;
		number imageBYCoord = (offsetRectangleTop >= 0) ? offsetRectangleTop : 0;
		newImageB [imageBYCoord, imageBXCoord , imageBYCoord + bysize -1, imageBXCoord + bxsize -1] = imageb [0,0,bysize-1, bxsize-1];

		// change titles
		newImageA.setname(getname(imagea) + " Aligned");
		newImageB.setname(getname(imageb) + " Aligned");
	}
	
	/* Used for difficult to align images such as ring integrations.
		Spatially averages the images before Cross Correlation, which is then also spatially averaged.
		Processor intensive. May not work on the 2100 computer as it throws odd error messages when averaging sometimes.
			Will document errors more later.
	*/
	void findImageShiftAdvanced(object self, image refIm, image newIm, number &XShift, number &YShift){
		number mpV, mpX, mpY, xSize, ySize;
		GetSize( refIm, xSize, ySize );
		string title1 = refIm.GetName();
		string title2 = newIm.GetName();
		if(debugMode==1){result("\n\tFinding image shifts for " + title1 + " and " + title2);}
		image filteredrefIm = MedianFilter(refIm,3,5);
		filteredrefIm.ImageSetName("Reference Image");
		image filterednewIm = MedianFilter(newIm,3,5);
		filterednewIm.ImageSetName("Second Image");
		image cc := CrossCorrelate( filteredrefIm, filterednewIm ); // New correlation image.
		image filteredcc = MedianFilter(cc, 3,5);
		mpV = max( filteredcc, mpX, mpY ); // Finds coords of maximum bright point in correlation image.
		XShift = mpX - trunc( xSize / 2 ); // Shift in x-pixel coord.
		YShift = mpY - trunc( ySize / 2 ); // Shift in y-pixel coord.
		if(debugMode==true){result("\n\txShift = " + xShift + "\n\tyShift = " + yShift);}
	}
	
	/* Return image arrays listing the relative X/Y shifts of the images from an image list tag group.
		Also record the display settings to be applied to the aligned images.
		Image list is an indexed TagList of imageIDs such as created from makeImageIDList().
	*/
	void findAllShifts (object self, TagGroup imageList, image &XShiftDataArray, image &YShiftDataArray, image &contrastSettings, \
		number &maxXShift, number &maxYShift, number &minXShift, number &minYShift){
		number totalImages = taggroupcounttags(imageList);
		if(debugMode==true){result("\nFinding shifts for a set of " + totalImages + " images.");}
		number i
		number totalXShift = 0;
		number totalYShift = 0;
		XShiftDataArray := RealImage("XShift Data Array", 4,totalImages,1);
		YShiftDataArray := RealImage("YShift Data Array", 4,totalImages,1);
		contrastSettings := RealImage("Contrast Data Array", 4,totalImages,2);
		// Find the images shifts
		for(i=0; i < (totalImages-1); i++){
			if(debugMode == true){result("\n\tProcessing image " + i);}
			number Image1ID, Image2ID, XShift, YShift;
			TagGroupGetIndexedTagAsNumber( imageList, i, image1ID );
			TagGroupGetIndexedTagAsNumber( imageList, i+1, image2ID );
			image Im1 := GetImageFromID(Image1ID);
			image Im2 := GetImageFromID(Image2ID);
			self.findImageShiftAdvanced(Im1, Im2, XShift, YShift) // Run the Advanced Alignment code to find numbers.
			totalXShift += XShift; // Keep a running total of the relative shifts
			totalYShift += YShift;
			setPixel(XShiftDataArray, (i+1), 0, totalXShift)
			setPixel(YShiftDataArray, (i+1), 0, totalYShift)
			// Record the Contrast settings for displays later
			number highContrast1, lowContrast1, highContrast2, lowContrast2;
			ImageDisplay Im1Display = Im1.ImageGetImageDisplay( 0 );
			ImageDisplay Im2Display = Im2.ImageGetImageDisplay( 0 );
			Im1Display.ImageDisplayGetContrastLimits( lowContrast1, highContrast1 )
			Im2Display.ImageDisplayGetContrastLimits( lowContrast2, highContrast2 )
			contrastSettings.setPixel(i,0, lowContrast1)
			contrastSettings.setPixel(i,1, highContrast1)
			contrastSettings.setPixel(i+1,0, lowContrast2)
			contrastSettings.setPixel(i+1,1, highContrast2)
		}
		//Find the maximum shift values.
		ImageCalculateMinMax( XShiftDataArray, 0, 0, minXShift, maxXShift );
		if(debugMode==true){result("\n\tmaxXShift = " + maxXShift + "\n\tminXShift = " + minXShift);}
		ImageCalculateMinMax( YShiftDataArray, 0, 0, minYShift, maxYShift );
		if(debugMode==true){result("\n\tmaxYShift = " + maxYShift + "\n\tminYShift = " + minYShift);}
		// minX/YShifts need to be either 0 or the largest -ve number.
		// maxX/YShifts need to be either 0 or the largest +ve number
		
		maxXShift = tert( (maxXShift >= 0), maxXShift, 0 );
		minXShift = tert( (minXShift <= 0), minXShift, 0 );
		maxYShift = tert( (maxYShift >= 0), maxYShift, 0 );
		minYShift = tert( (minYShift <= 0), minYShift, 0 );
		if(debugMode==true){
			result("\n\tCalculating magnitudes...\n\tmaxXShift = " + maxXShift + "\n\tminXShift = " + minXShift);
			result("\n\tmaxYShift = " + maxYShift + "\n\tminYShift = " + minYShift);
			result("\nAll Shifts found.");
		}
	}

	/* To align images without losing any data we must make a new version of them.
			They are their original size + |maxXShift| + |minXShift| in X,  + |maxYShift| + |minXShift| in Y.
			The extra space will be filled with black space (0) based on their shift.
			Returns a single image.
			If the images are different sizes then max/min values will need adjusting.
	*/
	image createAlignedImage (object self, image thisImage, number minXShift, number minYShift, number maxXShift,\
			number maxYShift, number XShift, number YShift) {
		if(debugMode==true){result("\nCreating an aligned image from ");}
		number xSize, ySize;
		GetSize( thisImage, xSize, ySize );
		number newSizeX =  xSize + abs(maxXShift) + abs(minXShift);
		number newSizeY = ySize + abs(maxYShift) + abs(minYShift);
		string thisImageTitle;
		thisImage.GetName(thisImageTitle);
		if(debugMode==true){result(thisImageTitle);}
		
		// Make a new canvas to position the image
		image alignedImage = RealImage( "Aligned", 4, newSizeX, newSizeY );
		alignedImage = 0;
		
		// The placement of the image on the new canvas
		number top,left,bottom,right;
		left = abs(minXShift) + XShift;
		if(debugMode==true){result("\n\tLeft = " + left);}
		top = abs(minYShift) + YShift ;
		if(debugMode==true){result("\n\tTop = " + top);}
		bottom = top + ySize;
		right = left + xSize;
		alignedImage [ top, left, bottom, right ] = thisImage; // insert image

		alignedImage.ImageSetName(thisImageTitle + "Aligned");
		copyTags(alignedImage, thisImage);
		copyScale(alignedImage, thisImage);
		return alignedImage;
	}

	/* Function to align images from an indexed TagList of image IDs. Uses Automatic searching, not manual.
		Runs the findAllShifts() function to get the numbers.
		Cycle through images and make them larger to make them align with each other
		Return a tag group of image IDs for the new aligned images.
	*/
	TagGroup autoAlignAllImages (object self, TagGroup imageList){
		if(debugMode==true){result("\nAligning a set of images...");}
		TagGroup alignedImageList = NewTagList();
		number maxXShift, maxYShift, minXShift, minYShift;
		image XShiftDataArray, YShiftDataArray, contrastSettings;
		self.findAllShifts (imageList, XShiftDataArray, YShiftDataArray, contrastSettings, \
		maxXShift, maxYShift, minXShift, minYShift);
		number totalImages = taggroupcounttags(imageList);
		if(debugMode==true){result("\n\tFound " + totalImages + " images.");}
		number i;
		for(i=0; i < totalImages; i++){
			number ImageID, XShift, YShift, xSize, ySize;
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			XShift = getPixel( XShiftDataArray, i, 0 );
			YShift = getPixel( YShiftDataArray, i, 0 );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			result("\n\tProcessing " + imageTitle)
			GetSize(thisImage, xSize, ySize);
			image alignedImage :=  self.createAlignedImage (thisImage, minXShift, minYShift, maxXShift, maxYShift, XShift, YShift);
			showImage(alignedImage);
			// Add aligned image to aligned image list tag group for further processing.
			number alignedImageID = alignedImage.ImageGetID();
			alignedImageList.TagGroupInsertTagAsNumber( infinity(), alignedImageID );
		}
		if(debugMode==true){result("\nAll Images Aligned.");}
		return alignedImageList;
	}

	/* Creates an average image from a set of aligned images
		the list of image IDs is the output of the alignAllImages() function
		Useful to get a quick idea of if the alignment has worked without external editting software
	*/
	image createAverageAlignedImage (object self, TagGroup alignedImageList) {
		number totalImages = taggroupcounttags(alignedImageList);
		number i, imageID;
		TagGroupGetIndexedTagAsNumber( alignedImageList, 0, imageID );
		image averageImage = GetImageFromID( imageID );
		for(i=1;i < totalImages;i++){
			TagGroupGetIndexedTagAsNumber( alignedImageList, i, imageID );
			image thisImage = GetImageFromID( imageID );
			averageImage += thisImage;
		}
		averageImage = averageImage / totalImages;
		// averageImage := MedianFilter(averageImage, 3,5); //Do we need the extra averaging?
		averageImage.ImageSetName("Averaged Aligned Image");
		return averageImage;
	}

	//----------------------------------------
	//		Manual Alignment Functions
	//----------------------------------------
	
	/* This function needs to be run as its own thread with the startAligning() method.
		It will show an image display and begin switching between the two images intermittently.
		The images will be aligned by user input on the buttons of the dialog
		The thread will be stuck in a While loop during the process and will wait for a signal to stop.	
	*/
	void manualalign(object self)
	{
		// Set up the images for alignment
		image newImageA, newImageB
		self.makeOffsetImages(imagea, imageb, newImageA, newImageB, 0, 0);

		image displayimage := newImageA
		showimage(displayimage)
		
		imagedisplay dispdisp=displayimage.imagegetimagedisplay(0)
		dispdisp.imagedisplaysetdoautosurvey(0)
		
		setname(displayimage, "Manual Aligment")
		offsetx = 0
		offsety = 0;
		number lastOffsetx = 0;
		number lastOffsety = 0;
		number switch, counter;

		image alignimage=newImageB
		number moderadio=dlggetvalue(self.lookupelement("moderadio"))
	
		self.lookupelement("crosscorrlabel").dlgtitle("Cross Correl'n: ")
		self.lookupelement("xoffsetlabel").dlgtitle("X Offset: ")
		self.lookupelement("yoffsetlabel").dlgtitle("Y Offset: ")
		self.validateview()

		string delaytitle=dlggettitle(self.lookupelement("speedlabel"))
		number delay=val(right(delaytitle,1))
		
		number low, high;
		dispdisp.ImageDisplayGetContrastLimits( low, high )

		number OSTicksPerSecond = GetOSTicksPerSecond();
		number OSTickCount = GetOSTickCount();
		number targetTick = OSTickCount + (OSTicksPerSecond * (1/delay));

		// Variable to set true when the thread needs to be terminated
		do_break=false
		// Loop the thread until a stop signal is encountered
		while( true )
			{
				try {
					moderadio=dlggetvalue(self.lookupelement("moderadio"))
					OSTickCount = GetOSTickCount();
					self.lookupelement("xoffsetlabel").dlgtitle("X Offset: "+format((offsetx*-1),"%3.1f")) // NB oFfsets are x -1 as the values displayed in the
					self.lookupelement("yoffsetlabel").dlgtitle("Y Offset: "+format((offsety*-1),"%3.1f")) // dialog are the shifts of B relative to A. offsetx and y are the corretions to align them
					self.lookupelement("sensitivitylabel").dlgtitle("Sensitivity: " + movementSensitivitySetting)
					self.validateview()
					// The display mode is set in the manual alignment box setting 0=alternate, 1=simulateous
					number newX, newY;
					if(moderadio==0)
					{
						// alternate between the two images when the offset is changed or when the timer has reached a certain value
						if( (OSTickCount >= targetTick) )
						{
							delaytitle=dlggettitle(self.lookupelement("speedlabel"));
							delay=val(right(delaytitle,1));
							OSTickCount = GetOSTickCount();
							targetTick = OSTickCount + (OSTicksPerSecond * (1/delay));
							// create the new images based on offset change
							self.makeOffsetImages(imagea, imageb, newImageA, newImageB, offsetx, offsety);
							// switch image tracker
							if(switch==0) switch=1
							else switch=0
							// display correct new image
							if(switch==0){
								getSize(newImageA, newX, newY);
								ImageResize( displayImage, 2, newX, newY );
								displayimage = newImageA;
								// Change contrast settings for this image
								number imageAminContrastValue, imageAmaxContrastValue;
								// DLGGetValue( object frame, string identifier, number &val )
								self.dlgGetValue("imageAminContrast", imageAminContrastValue)
								self.dlgGetValue("imageAmaxContrast", imageAmaxContrastValue)							
								ImageDisplaySetContrastLimits(dispdisp, imageAminContrastValue, imageAmaxContrastValue)
							}
							else { 
								getSize(newImageB, newX, newY);
								ImageResize( displayImage, 2, newX, newY );
								displayimage = newImageB
								number imageBminContrastValue, imageBmaxContrastValue;
								self.dlgGetValue("imageBminContrast", imageBminContrastValue)
								self.dlgGetValue("imageBmaxContrast", imageBmaxContrastValue)
								ImageDisplaySetContrastLimits(dispdisp, imageBminContrastValue, imageBmaxContrastValue)
							}
							zoomImage(displayimage);
							updateimage(displayimage);
						}
					}		
					else if( (OSTickCount >= targetTick) )// Simulataneous mode is on instead
					{
						delaytitle=dlggettitle(self.lookupelement("speedlabel"));
						delay=val(right(delaytitle,1));
						OSTickCount = GetOSTickCount();
						targetTick = OSTickCount + (OSTicksPerSecond * (1/delay));
						// create the new images based on offset change
						self.makeOffsetImages(imagea, imageb, newImageA, newImageB, offsetx, offsety);
						getSize(newImageA, newX, newY);
						ImageResize( displayImage, 2, newX, newY );
						displayimage = (newImageA + newImageB) / 2;
						// Change contrast settings for this image
						number imageAminContrastValue, imageAmaxContrastValue;
						// DLGGetValue( object frame, string identifier, number &val )
						self.dlgGetValue("imageAminContrast", imageAminContrastValue)
						self.dlgGetValue("imageAmaxContrast", imageAmaxContrastValue)							
						ImageDisplaySetContrastLimits(dispdisp, imageAminContrastValue, imageAmaxContrastValue);
						zoomImage(displayimage);
						updateimage(displayimage);
					}
				}
				Catch // If any exceptions occur or a stop signal is received stop the thread.
				{
					// A break was encountered, set the tilt back to its starting point and break out of the Try/Catch loop
					do_break = true
					stopsignal.resetsignal()
					Break
				}
				// Stop the thread by breaking out of the function. Otherwise the start signal is reset to keep the thread
				// running
				If(do_break) break
			}
		// Delete temporary images and renable dialog buttons and radios
		deleteimage(displayimage)
		deleteimage(alignimage)
		self.cleanReferences()
		result("\nAlignment loop terminated");
	}

	// Loads two images to be aligned.
	void loadImages(object self, image &imageaExternal, image &imagebExternal)
	{
		imagea := imageaExternal;
		imageb := imagebExternal;
		// Get the image sizes.
		number axsize, bxsize, aysize, bysize
		getsize(imagea, axsize, aysize)
		getsize(imageb, bxsize, bysize)
		if(debugMode==1){result("\n\tLoading Images: ");}
		
		// Update the dialog with the image names
		string imageaname=getname(imagea)
		string imagebname=getname(imageb)
		if(debugMode==1){result(imageaname + " and " + imagebname);}
		
		number alen=len(imageaname)
		number blen=len(imagebname)

		if(alen>24) imageaname=mid(imageaname,0,23)
		if(blen>24) imagebname=mid(imagebname,0,23)

		self.lookupelement("imagealabel").dlgtitle("Image A: "+imageaname)
		self.lookupelement("imageblabel").dlgtitle("Image B: "+imagebname)
		if(debugMode==1){result("\n\tApplied names to dialog ");}
		
		// Set the contrast limits on the dialgoue fields. Used to make the images viewable if they have very different brightnesses.
		number imageAminContrastValue, imageAmaxContrastValue, imageBminContrastValue, imageBmaxContrastValue;
		ImageDisplay imageDispA = imagea.ImageGetImageDisplay( 0 );
		ImageDisplay imageDispB = imageb.ImageGetImageDisplay( 0 );
		ImageDisplayGetContrastLimits(imageDispA, imageAminContrastValue, imageAmaxContrastValue)
		ImageDisplayGetContrastLimits(imageDispB, imageBminContrastValue, imageBmaxContrastValue)
		self.dlgvalue("imageAminContrast", imageAminContrastValue)
		self.dlgvalue("imageAmaxContrast", imageAmaxContrastValue)
		self.dlgvalue("imageBminContrast", imageBminContrastValue)
		self.dlgvalue("imageBmaxContrast", imageBmaxContrastValue)

		// Create the stop and start signals for the thread
		startsignal=NewSignal(0)
		stopsignal=NewSignal(0)
		
		movementSensitivity = 32;
		movementSensitivitySetting = 5;
	}
	
	//----------------------------------------
	//		Dialog Control Functions
	//----------------------------------------
	
	// Responds when the + button is pressed to increase the delay between alternating images
	taggroup increasespeed(object self)
	{
		string delaytitle=dlggettitle(self.lookupelement("speedlabel"))
		number delay=val(right(delaytitle,1))

		delay=delay+1
		if(delay>9) delay=9
		self.lookupelement("speedlabel").dlgtitle("Delay: "+delay)
	}
	// Responds when the - button is pressed to decrease the delay between alternating images
	taggroup decreasespeed(object self)
	{
		string delaytitle=dlggettitle(self.lookupelement("speedlabel"))
		number delay=val(right(delaytitle,1))

		delay=delay-1
		if(delay<1) delay=1
		self.lookupelement("speedlabel").dlgtitle("Delay: "+delay)
	}	

	// Starts the manual alignment function as its own thread.
	void startAligning(object self)
	{
		// Call the function to start the thread
		scanison=true
		self.startthread("manualAlign")
	}	
		
	void offsetUpButtonPress(object self)
	{
		offsety += movementSensitivity;
	}
	void offsetDownButtonPress(object self)
	{
		offsety -= movementSensitivity;
	}
	void offsetLeftButtonPress(object self)
	{
		offsetx -= movementSensitivity;
	}
	void offsetRightButtonPress(object self)
	{
		offsetx += movementSensitivity;
	}
	
	void sensitivityUpPress(object self)
	{
		movementSensitivitySetting +=1;
		movementSensitivitySetting = (movementSensitivitySetting > 10) ? 10 : movementSensitivitySetting;
		movementSensitivity = 2 ** movementSensitivitySetting;
	}
	
	void sensitivityDownPress(object self)
	{
		movementSensitivitySetting -= 1;
		movementSensitivitySetting = (movementSensitivitySetting < 0) ? 0 : movementSensitivitySetting;
		movementSensitivity = 2 ** movementSensitivitySetting;
	}
	
	void radiochanged(object self, taggroup tg)
	{
		// null changed method
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

	// this function creates a button taggroup which returns the taggroup 'box' which is added to
	// the dialog in the createdialog function.
	taggroup MakeSourceImagesBox(object self)
	{
		// Creates a box in the dialog which surrounds the button

		taggroup box_items
		taggroup box=dlgcreatebox("  Source Images  ", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		// Create the labels for the image names
		
		taggroup imagealabel=dlgcreatelabel("Image A:                                 ").dlgidentifier("imagealabel")
		taggroup imageblabel=dlgcreatelabel("Image B:                                 ").dlgidentifier("imageblabel")
		taggroup labelgroup=dlggroupitems(imagealabel, imageblabel).dlgtablelayout(1,2,0)

		// Create inputs for contrast settings of each image
		taggroup imageAminContrast = DLGCreateIntegerField( 0, 8 ).dlgidentifier("imageAminContrast");
		taggroup imageAmaxContrast = DLGCreateIntegerField( 100, 8 ).dlgidentifier("imageAmaxContrast");
		taggroup imageAContrastFields=dlggroupitems(dlgcreatelabel("Contrast A:"), imageAminContrast, dlgcreatelabel("-"), imageAmaxContrast).dlgtablelayout(4,1,0)
		taggroup imageBminContrast = DLGCreateIntegerField( 0, 8 ).dlgidentifier("imageBminContrast");
		taggroup imageBmaxContrast = DLGCreateIntegerField( 100, 8 ).dlgidentifier("imageBmaxContrast");
		taggroup imageBContrastFields=dlggroupitems(dlgcreatelabel("Contrast B:"), imageBminContrast, dlgcreatelabel("-"), imageBmaxContrast).dlgtablelayout(4,1,0)
		
		// Put them all together
		taggroup imagegroup = dlggroupitems(labelgroup, imageAContrastFields, imageBContrastFields);
		box_items.dlgaddelement(imagegroup)
		return box
	}

	// Create the Manual Alignment box
	taggroup makemanualbox(object self)
	{
		taggroup manualboxitems
		taggroup manualbox=dlgcreatebox(" Alignment Control ", manualboxitems).dlginternalpadding(4,6)
		taggroup startAlignmentButton=dlgcreatepushbutton("Start Alignment", "onStartClick").dlgidentifier("startAlignmentButton");
		manualboxitems.dlgaddelement(startAlignmentButton)
		
		// Create the manual display mode radio items
		taggroup moderadioitems
		number moderadio
		getpersistentnumbernote("Align Images:Default Values:Alternate Radio",moderadio)
		taggroup moderadiolist=dlgcreateradiolist(moderadioitems, moderadio, "radiochanged").dlgidentifier("moderadio").dlgexternalpadding(6,0)
		moderadioitems.dlgaddelement(dlgcreateradioitem("Alternate",0))
		moderadioitems.dlgaddelement(dlgcreateradioitem("Simultaneous",1))
		number delay
		getpersistentnumbernote("Align Images:Default Values:Delay",delay)
		// Create the control for the speed of oscillation
		taggroup increasespeed=dlgcreatepushbutton("+","increasespeed").dlgidentifier("increasespeed")
		taggroup decreasespeed=dlgcreatepushbutton("-","decreasespeed").dlgidentifier("decreasespeed").dlginternalpadding(2,0)
		taggroup speedlabel=dlgcreatelabel("Delay: "+delay).dlgidentifier("speedlabel")
		taggroup buttongroup=dlggroupitems(increasespeed, decreasespeed).dlgtablelayout(2,1,0)
		taggroup speedgroup=dlggroupitems(buttongroup, speedlabel).dlgtablelayout(2,1,0).dlgexternalpadding(6,0)
		// Create alignment offset buttons
		taggroup offsetRightButton=dlgcreatepushbutton(">", "offsetRightButtonPress").dlgidentifier("offsetRightButton");
		taggroup offsetLeftButton=dlgcreatepushbutton("<", "offsetLeftButtonPress").dlgidentifier("offsetLeftButton");
		taggroup offsetUpButton=dlgcreatepushbutton("^", "offsetUpButtonPress").dlgidentifier("offsetUpButton");
		taggroup offsetDownButton=dlgcreatepushbutton("v", "offsetDownButtonPress").dlgidentifier("offsetDownButton");
		taggroup sensitivityUpButton=dlgcreatepushbutton("x2", "sensitivityUpPress").dlgidentifier("sensitivityUpButton");
		taggroup sensitivityDownButton=dlgcreatepushbutton("/2", "sensitivityDownPress").dlgidentifier("sensitivityDownButton");
		taggroup sensitivitylabel=dlgcreatelabel("Sensitivity: "+ sqrt(movementSensitivity)).dlgidentifier("sensitivitylabel")
		taggroup blankspace = dlgcreatelabel("");
		taggroup offsetButtons = dlggroupitems(dlggroupitems(blankspace, offsetUpButton, blankspace).dlgtablelayout(3,1,0),\
			dlggroupitems(offsetLeftButton, blankspace, offsetRightButton).dlgtablelayout(3,1,0),\
			dlggroupitems(blankspace, offsetDownButton, blankspace).dlgtablelayout(3,1,0) ).dlgtablelayout(1,3,0);
		taggroup sensitivityButtons = dlggroupitems(sensitivityUpButton, sensitivityDownButton, sensitivitylabel).dlgtablelayout(3,1,0)
		taggroup bottommeasuregroup=dlggroupitems(moderadiolist, speedgroup, offsetButtons, sensitivityButtons).dlgtablelayout(1,4,0)
		manualboxitems.dlgaddelement(bottommeasuregroup)
		return manualbox
	}

	// Create the results box
	taggroup makeresultsbox(object self)
	{
		taggroup resultsboxitems
		taggroup resultsbox=dlgcreatebox(" Alignment Measurement ",resultsboxitems).dlginternalpadding(12,6)
		taggroup offsetxlabel=dlgcreatelabel("X Offset:                         ").dlgidentifier("xoffsetlabel").dlganchor("West")
		taggroup offsetylabel=dlgcreatelabel("Y Offset:                         ").dlgidentifier("yoffsetlabel").dlganchor("West")
		taggroup crosscorrlabel=dlgcreatelabel("Cross Correl'n:                         ").dlgidentifier("crosscorrlabel").dlganchor("West")
		taggroup resultslabelgroup=dlggroupitems(offsetxlabel,offsetylabel,crosscorrlabel).dlgtablelayout(1,3,0)
		resultsboxitems.dlgaddelement(resultslabelgroup)
		return resultsbox
	}

	// This function creates the dialog tag group, drawing togther the various boxes which make it up
	taggroup CreateDialog(object self)
	{
		TagGroup dialog_items;	
		TagGroup dialog = DLGCreateDialog("Image Alignment", dialog_items)
		dialog_items.dlgaddelement( self.MakeSourceImagesBox() );
		dialog_items.dlgaddelement( self.MakeManualBox() );
		dialog_items.dlgaddelement( self.MakeResultsBox() );
		return dialog;
	}

	/* Create the Dialog. Must be called before showAlignmentDialog. Uses the CreateDialog Tag group output */
	void generateDialog(object self){
		self.super.init( self.CreateDialog() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showAlignmentDialog(object self){
		// Display and position the dialog
		number xpos, ypos;
		getpersistentnumbernote("Align Images:Dialog Position:Left",xpos);
		getpersistentnumbernote("Align Images:Dialog Position:Top",ypos);

		//self.display("Align Images") // display dialog as modeless; the calling script will continue after it has been created
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// In order to make function calls after this we will need a 'start' button on the controls.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// The constructor
	alignmentdialog(object self)
	{
		AlignmentID = self.ScriptObjectGetID();
	}

	// The destructor (does nothing)
	~alignmentdialog(object self)
	{
		result("\nAlignment Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}
		
	// If the dialog is closed, the thread is stopped
	void abouttoclosedocument(object self)
	{
		if(scanison) 
		{
			result("\nAlignment thread stopped before destruction of dialog.");
		}
	}
	
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Alignment Dialog");}
	}
	
	// Function used to align two images. The images are inputted and their offsets are output by the function. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	number alignTwoImages(object self, image imageaInput, image imagebInput, number &offsetXExternal, number &offsetYExternal)
	{
		imagea := imageaInput;
		imageb := imagebInput;
		if(debugMode==1){result("\nCreating child dialog Object");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showAlignmentDialog();	// Display the child with Pose() system
			// When the child's Record alignment button is pressed, give the offsets to this (parent) object
			// Use the original AlignmentID, which was not changed during cloning (?);
			//	childDialog.loadImages(imageaInput, imagebInput); // code to Add images to the child dialog
		if(useValues == 1){
			childDialog.getOffsets(offsetXExternal, offsetYExternal); // load the offsets into the external function. Note: The dialog is still in memory and can be referenced. No idea how to get rid of it actually. As long as the thread closes we should be fine.
		}
		childDialog.stopLoop(); // Stop the thread looping the images
		childDialog = NULL; // NULL the childDialog so it can go out of scope.
		return useValues;
	}
	
	void onStartClick(object self){
		if(debugMode==1){result("\nLoading child dialog");}
		self.loadImages(imagea, imageb); // code to Add images to the child dialog
		if(debugMode==1){result("\nStarting Alignment Process");}
		self.startAligning();
	}
	
}

// **********************
//   Data Object Class
// **********************

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
	number ROITracker; // A variable to keep track of which ROI a user looked at last.
	number ringMarkerColourTracker; // Variable to remember which colour marker rings have all ready been used.
	number debugMode; // Set to 1 to prevent image saving and provide robust feedback.
	number DFExposure; // # of seconds to expose the camera for taking DarkField images.
	number DPExposure; // # of seconds to expose the camera for taking Diffraction Pattern images.
	number BFExposure; // # of seconds to expose the camera for taking BrightField images.
	number xTiltVectorX; // number of pixels moved in the (pixel) X axis per tiltX unit
	number xTiltVectorY; // number of pixels moved in the (pixel) Y axis per tiltX unit
	number yTiltVectorX; // number of pixels moved in the (pixel) X axis per tiltY unit
	number yTiltVectorY; // number of pixels moved in the (pixel) Y axis per tiltY unit
	number maxDeviation; // number of pixels difference allowed during pattern matching operations
	number centreXTilt, centreYTilt; // the centred tilt values. Do not set to 0,0, null, or any value that has not been verified.
	number binningMultiplier; // binning of the VIEW window compared to Acquisition images (usually 4)
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

	number getDFExposure(object self) {
		return DFExposure;
	}
	number setDFExposure(object self, number newValue) {
		DFExposure = newValue;
		return DFExposure;
	}

	number getBFExposure(object self) {
		return BFExposure;
	}
	number setBFExposure(object self, number newValue) {
		BFExposure = newValue;
		return BFExposure;
	}

	number getDPExposure(object self) {
		return DPExposure;
	}
	number setDPExposure(object self, number newValue) {
		DPExposure = newValue;
		return DPExposure;
	}

	number setMaxDeviation(object self, number newValue){
		maxDeviation = newValue;
		return maxDeviation;
	}
	number getMaxDeviation(object self){
		return maxDeviation;
	}
	
	number setBinningMultiplier(object self, number newValue){
		binningMultiplier = newValue;
		return binningMultiplier;
	}
	number getBinningMultiplier(object self){

		return binningMultiplier;
	}

	number getCameraWidth(object self) {
		return cameraWidth;
	}
	number setCameraWidth(object self, number newValue) {
		cameraWidth = newValue;
		return cameraWidth;
	}
	number getCameraHeight(object self) {
		return cameraHeight;
	}
	number setCameraHeight(object self, number newValue) {
		cameraHeight = newValue;
		return cameraHeight;
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
	number setRefScale(object self, number newValue) {
		refScale = newValue;
		return refScale;
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
		"\nROITracker: " + ROITracker +\
		"\ndebugMode: " + debugMode +\
		"\nDFExposure: " + DFExposure +\
		"\nDPExposure: " + DPExposure +\
		"\nBFExposure: " + BFExposure +\
		"\nxTiltVectorX: " + xTiltVectorX +\
		"\nxTiltVectorY: " + xTiltVectorY +\
		"\nyTiltVectorX: " + yTiltVectorX +\
		"\nyTiltVectorY: " + yTiltVectorY +\
		"\nmaxDeviation: " + maxDeviation +\
		"\ncentreXTilt: " + centreXTilt +\
		"\ncentreYTilt: " + centreYTilt +\
		"\nbinningMultiplier: " + binningMultiplier +\
		"\ncameraWidth: " + cameraWidth +\
		"\ncameraHeight: " + cameraHeight +\
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
		number coordinatesRecorded = tracker;
		result("\nThe following spots have been stored...\n");
		result("\nSpot ID# \txTilt \tyTilt \txTiltRelative \tyTiltRelative \txPixelShift \tyPixelShift");
		number pi;
		for(pi=0;pi<coordinatesRecorded;pi++){
			result("\n\t" + getpixel(dataArray, pi, 0));
			result("\t" + getpixel(dataArray, pi, 1));
			result("\t\t" + getpixel(dataArray, pi, 2));
			result("\t\t" + getpixel(dataArray, pi, 3));
			result("\t\t\t" + getpixel(dataArray, pi, 4));
			result("\t\t" + getpixel(dataArray, pi, 5));
			result("\t\t" + getpixel(dataArray, pi, 6));
		}	
		result("\n... End of Spot ID Data.")
	}
	/* Function to print out all the values in the data image for debugging and backup.
			This version ignores the tracker value in the dataObject and uses the one provided.
	 */
	void printSpotIDArray (object self, number forcedValue){
		number coordinatesRecorded = forcedValue;
		result("\nThe following spots have been stored in the first " + forcedValue + " columns in the data array");
		result("\nSpot ID# \txTilt \tyTilt \txTiltRelative \tyTiltRelative \txPixelShift \tyPixelShift");
		number pi;
		for(pi=0;pi<coordinatesRecorded;pi++){
			result("\n\t" + getpixel(dataArray, pi, 0));
			result("\t" + getpixel(dataArray, pi, 1));
			result("\t\t" + getpixel(dataArray, pi, 2));
			result("\t\t" + getpixel(dataArray, pi, 3));
			result("\t\t\t" + getpixel(dataArray, pi, 4));
			result("\t\t" + getpixel(dataArray, pi, 5));
			result("\t\t" + getpixel(dataArray, pi, 6));
		}	
		result("\n... End of Sample. There is more in the image Array but you do not need to see 5000 null entries.")
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
			self.setTiltVectors(0,0,0,0);
			result("\nAll stored points and calibration data deleted. Please centre the beam and run the calibrate tilt function again");
			// Note: NEVER set centreXTilt or centreYTilt to 0, or anything other than real values.
		} else {
			self.setTracker(1);
			number height, width;
			getSize(dataArray, width, height)
			//realsubarea operator[( realimage img, number top, number left, number bottom, number right )
			dataArray[0, 1, height, width] = 0; // Set all values except first to 0
			result("\nStored points have been cleared. Calibration data are still in memory.")
		}
	 }
	
	/* Function to get VIEW image xscale despite the mis-calibration of our 2100 */
	number returnViewScale(object self){
		number xscale=1;
		xscale = binningMultiplier * RefScale;
		return xscale;
	}
	
	// ************************************
	//  Tilt calculations
	// ************************************

	/* 	For a Desired Pixel Shift = X,Y. We are rotating the coordinate axis and then scaling the values.
		Theta = angle between x-axis and xTilt-axis
		xTilt = x cos (Theta) + y sin (Theta)
		yTilt = - x sin (Theta) - y cos (Theta) , with the -y term because the pixel y-axis is opposite the geometric y-axis.
		The values will then need scaling, since 1px =/= 1tilt	*/

	/* Function to convert a pixel distance into nanometers. Very simple, but making it into a function should avoid mistakes
		isViewWindow parameter is 0 or 1 */
		
	number convertPixelDistanceToNM(object self, number pixelDistance, number isViewWindow)
	{
		if(binningMultiplier==0){
			throw("Please Calibrate the toolkit");
		}
		
		number scaleX, NMDistance;
		scaleX = self.getRefScale(); // Scale for an unbinned image
		if(isViewWindow==1){
			pixelDistance = pixelDistance * binningMultiplier;
		}
		if(debugMode==true){result("\nPixel Distance -> NM: " + pixelDistance + "px * " + scaleX);}
		NMDistance = pixelDistance * scaleX;
		if(debugMode==true){result(" = " + NMDistance);}
		return NMDistance;
	}

	/* Function to convert a NM distance into pixels. Very simple, but making it into a function should avoid mistakes
		isViewWindow parameter is 0 or 1
	*/
	number convertNMDistanceToPixel(object self, number NMDistance, number isViewWindow)
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
		Assumes X-Tilt is being used, but can be told to use Y-Tilt instead. */
	number convertPixelDistanceToTilt(object self, number pixelDistance, number isViewWindow, number useYTilt)
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

	/* Function to convert Pixel COORDINATES to Tilt Coordinates.
		isViewWindow parameter is 0 or 1.
		tiltShiftOnly = 1 will return only the RELATIVE values of tilt. Basically, it assumes beam centre is (0tilt,0tilt)
				Since all beam movement functions are defined by relative shifts, this might be helpful.
		pixelShiftOnly = 1 will assume the X and Y pixel coordinate values are relative shifts instead of coordinates.
				Basically it will assume the origin is (0,0) instead of the centre of the image.
	 */
	void pixelToTilt(object self, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,\
			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly)
	{
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

		number xPixelChange, yPixelChange;
		if(pixelShiftOnly != 1){
			xPixelChange = xPixel - beamCentreXPixel;
			yPixelChange = yPixel - beamCentreYPixel;
		} else {
			xPixelChange = xPixel;
			yPixelChange = yPixel;
		}

		// For a Desired Pixel Shift = X,Y. We are rotating the coordinate axis and then scaling the values.
		// Alpha = angle between x-axis and xTilt-axis
		number alpha, Tx, Ty, newX, newY
		alpha = atan2(xTy, xTx);
		
		// This finds the coordinates in terms of tilt, but WITHOUT SCALING, which must be done afterwards.
		newX = xPixelChange * cos(alpha) + yPixelChange * sin(alpha);
		newY = -xPixelChange * sin(alpha) + yPixelChange * cos(alpha);
		
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
		isViewWindow parameter is 0 or 1. This will scale the returned pixel value by the binning multiplier. */
		
	void tiltToPixel(object self, number xTilt, number yTilt, number &xPixelShift, number &yPixelShift, number isViewWindow)
	{
		// Load data from dataObject
		number xTx, xTy, yTx, yTy;
		self.getTiltVectors(xTx, xTy, yTx, yTy);
		if(binningMultiplier == 0){
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
		
		return persistentTG;
	}
	
	/* Function to generate a tag group using dataObject and persistent storage, and using the other to fill any gaps.
		Set the dataDominant input to 1 to take the dataobject values first
		Set the dataDominant input to 0 to take the persistent memory values first
		
		Would prefer function to combine all non-conflicting tags in groups, but too advanced for the time being.
	*/
	TagGroup createPersistent(object self, number dataDominant){
		if(debugMode==1){result("\nGenerating a persistent tag group...");}
		TagGroup persistentTG = NewTagGroup();
		persistentTG.TagGroupCreateNewLabeledTag("Toolkit Version");
		persistentTG.TagGroupSetTagAsNumber("Toolkit Version", versionNumber);
		
		// Check if the tag groups exist inside dataObject
		number CameraLengthsDoesExist = TagGroupIsValid(cameralengths);
		number scaleDoesExist = TagGroupIsValid(DiffractionScale);
		number tiltDoesExist = TagGroupIsValid(tiltVectorCalibrations);
		number imageSetsDoesExist = TagGroupIsValid(imageSets);

		number persistentExists = self.checkPersistent();
		
		persistentTG.TagGroupCreateNewLabeledTag("CameraLengths");
		persistentTG.TagGroupCreateNewLabeledTag("DiffractionScale");
		persistentTG.TagGroupCreateNewLabeledTag("TiltCalibration");
		persistentTG.TagGroupCreateNewLabeledTag("ImageSets");
		
		if(persistentExists == 0){ // only dataObject values might be present.
			if(debugMode==1){result("\nusing only dataObjects or making blank...");}
			if(CameraLengthsDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", cameraLengths);
			} else { //if data object does not have it, make a new blank one.
				TagGroup CLValues = NewTagList();
				CLValues.TagGroupInsertTagAsString(infinity(), "None");
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", CLValues);
			}
			
			if(scaleDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", diffractionScale);
			} else { //if data object does not have it, make a new blank one.
				TagGroup DiffScale = NewTagGroup()
				DiffScale.TagGroupCreateNewLabeledTag("None");
				DiffScale.TagGroupSetTagAsNumber("None", 1);
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", DiffScale);
			}
			
			if(tiltDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectorCalibrations);
			} else { //if data object does not have it, make a new blank one.
				TagGroup vectors = NewTagGroup();
				vectors.TagGroupCreateNewLabeledTag("xTiltx");
				vectors.TagGroupSetTagAsNumber("xTiltx", 1);
				vectors.TagGroupCreateNewLabeledTag("xTilty");
				vectors.TagGroupSetTagAsNumber("xTilty", 1);
				vectors.TagGroupCreateNewLabeledTag("yTiltx");
				vectors.TagGroupSetTagAsNumber("yTiltx", 1);
				vectors.TagGroupCreateNewLabeledTag("yTilty");
				vectors.TagGroupSetTagAsNumber("yTilty", 1);
				
				TagGroup tiltVectors = NewTagGroup();
				tiltVectors.TagGroupCreateNewLabeledTag("None");
				tiltVectors.TagGroupSetTagAsTagGroup("None", vectors);
				
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectors);
			}
			
			if(imageSetsDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", imageSets);
			} else { //if data object does not have it, make a new blank one.
				TagGroup BlankImageSets = NewTagGroup();
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", BlankImageSets);
			}
			if(debugMode==1){result(" Done.");}
			return persistentTG;
		}
		
		// Persistent memory contains a Darkfield360 tag group, but we do not know what is inside it.
		TagGroup darkfield360
		TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), "Darkfield360", darkfield360);
		if(debugMode==1){result("\nLooking in permanent memory");}
		
		string tagPath;
		TagGroup loadedCameraLengths, loadedDiffractionScale, loadedTiltCalibration, loadedImageSets;

		tagPath = "Darkfield360:CameraLengths";
		if(TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, loadedCameraLengths)){
			if(debugMode==1){result("\n\tFound CL List");}
			// If the tag path exists then we can decide which data to use.
			if(CameraLengthsDoesExist == 1 && dataDominant == 1){
				if(debugMode==1){result("\n\tUsing DataObject CL List");}
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", cameraLengths); // use dataObject
			} else {
				if(debugMode==1){result("\n\tUsing CL List from memory");}
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", loadedCameraLengths); // use persistent memory
			}
		} else { // camera lengths data not in persistent memory
			if(CameraLengthsDoesExist){ // if data object has it...
				if(debugMode==1){result("\n\tUsing CL List from memory");}
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", cameraLengths);
			} else { //if data object does not have it, make a new blank one.
				if(debugMode==1){result("\n\tMaking Blank CL List");}
				TagGroup CLValues = NewTagList();
				CLValues.TagGroupInsertTagAsString(infinity(), "None");
				persistentTG.TagGroupSetTagAsTagGroup("CameraLengths", CLValues);
			}
		}
		
		tagPath = "Darkfield360:DiffractionScale";
		if(TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, loadedDiffractionScale)){
			// If the tag path exists then we can decide which data to use.
			if(scaleDoesExist == 1 && dataDominant == 1){
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", diffractionScale); // use dataObject
			} else {
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", loadedDiffractionScale); // use persistent memory
			}
		} else { // data not in persistent memory
			if(scaleDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", diffractionScale);
			} else { //if data object does not have it, make a new blank one.
				TagGroup DiffScale = NewTagGroup()
				DiffScale.TagGroupCreateNewLabeledTag("None");
				DiffScale.TagGroupSetTagAsNumber("None", 1);
				persistentTG.TagGroupSetTagAsTagGroup("DiffractionScale", DiffScale);
			}
		}
		
		tagPath = "Darkfield360:TiltCalibration";
		if(TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, loadedTiltCalibration)){
			// If the tag path exists then we can decide which data to use.
			if(tiltDoesExist == 1 && dataDominant == 1){
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectorCalibrations); // use dataObject
			} else {
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", loadedTiltCalibration); // use persistent memory
			}
		} else { // data not in persistent memory
			if(tiltDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectorCalibrations);
			} else { //if data object does not have it, make a new blank one.
				TagGroup vectors = NewTagGroup();
				vectors.TagGroupCreateNewLabeledTag("xTiltx");
				vectors.TagGroupSetTagAsNumber("xTiltx", 1);
				vectors.TagGroupCreateNewLabeledTag("xTilty");
				vectors.TagGroupSetTagAsNumber("xTilty", 1);
				vectors.TagGroupCreateNewLabeledTag("yTiltx");
				vectors.TagGroupSetTagAsNumber("yTiltx", 1);
				vectors.TagGroupCreateNewLabeledTag("yTilty");
				vectors.TagGroupSetTagAsNumber("yTilty", 1);
				
				TagGroup tiltVectors = NewTagGroup();
				tiltVectors.TagGroupCreateNewLabeledTag("None");
				tiltVectors.TagGroupSetTagAsTagGroup("None", vectors);
				
				persistentTG.TagGroupSetTagAsTagGroup("TiltCalibration", tiltVectors);
			}
		}
		
		tagPath = "Darkfield360:ImageSets";
		if(TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), tagPath, loadedImageSets)){
			// If the tag path exists then we can decide which data to use.
			if(imageSetsDoesExist == 1 && dataDominant == 1){
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", imageSets); // use dataObject
			} else {
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", loadedImageSets); // use persistent memory
			}
		} else { // data not in persistent memory
			if(imageSetsDoesExist){ // if data object has it...
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", imageSets);
			} else { //if data object does not have it, make a new blank one.
				TagGroup BlankImageSets = NewTagGroup();
				persistentTG.TagGroupSetTagAsTagGroup("ImageSets", BlankImageSets);
			}
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


// ********************************************************************************
//  Class containing Functions to create and manipulate Image Sets and Image Tags
// ********************************************************************************
// Taking this outside of dataObject because it is a major part of the program now.

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
		if(debugMode == 1){result("\n\tDebug Mode Activated in Alignment Dialog");}
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
		imageSetData.TagGroupCreateNewLabeledTag("DiffractionScale") //<value used>
		imageSetData.TagGroupCreateNewLabeledTag("CameraLength");
		imageSetData.TagGroupCreateNewLabeledTag("RingMode");
		imageSetData.TagGroupCreateNewLabeledTag("IntegratedImage"); // 0/1
		imageSetData.TagGroupCreateNewLabeledTag("NumberOfIntegrations") // 0/value
		imageSetData.TagGroupCreateNewLabeledTag("DegreeStep"); // if ring mode is used each 'step' is a certain number of degrees apart.
		imageSetData.TagGroupCreateNewLabeledTag("ShadowDistance"); // 0/value
		imageSetData.TagGroupCreateNewLabeledTag("ImageNotes"); // String
		
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
	
	/* Function to create a new set of image tags for the imageSet records */
	TagGroup createNewImageForImageSet(object self){
		TagGroup imageData = newTagGroup(); // make blank labels
		imageData.TagGroupCreateNewLabeledTag("ImageID") // Unique imageID number
		imageData.TagGroupCreateNewLabeledTag("FileName") // Name of saved file if present.
		imageData.TagGroupCreateNewLabeledTag("ImageMode")
		imageData.TagGroupCreateNewLabeledTag("ImageType") // Options are DP, DF, BF, Bin
		imageData.TagGroupCreateNewLabeledTag("ExposureTime")
		imageData.TagGroupCreateNewLabeledTag("xTiltValue")
		imageData.TagGroupCreateNewLabeledTag("yTiltValue")
		imageData.TagGroupCreateNewLabeledTag("xTiltRelative")
		imageData.TagGroupCreateNewLabeledTag("yTiltRelative")
		imageData.TagGroupCreateNewLabeledTag("DSpacingAng")
		imageData.TagGroupCreateNewLabeledTag("ShadowValue")
		imageData.TagGroupCreateNewLabeledTag("ShadowDistance")		
		
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


// ********************************
//	Scale Calibration Dialog Class
// ********************************
// It is used to enter/display the calibration scale factors and camera length options.

class ScaleValueDialog : uiframe
{
	// Global variables
	number scaleValueID; // Used by child dialog to return values to parent.
	object childDialog; // Store a clone of this dialog here for repeated use.
	TagGroup returnedCameraLengths; // Used by child dialog to return values to parent.
	TagGroup returnedCalibrationFactors; // Used by child dialog to return values to parent.
	TagGroup returnedTiltVectorCalibrations; // Used by child dialog to return values to parent.
	number dataObjectID;
	number toolkitID;
	number debugMode;
	number availableValueFields; // stores the number of Value fields.
	
	void takeCameraLengths(object self, tagGroup cameraLengthList){ // updates the returnedCameraLengths taggroup in this object.
		returnedCameraLengths = cameraLengthList;
	}
	void takeCalibrationFactors(object self, tagGroup calibrationFactorList){ // updates the returnedCalibrationFactors taggroup in this object.
		returnedCalibrationFactors = calibrationFactorList;
	}
	void takeTiltVectorCalibrations(object self, tagGroup tiltVectorCalibrationsList){ // updates the returnedCalibrationFactors taggroup in this object.
		returnedTiltVectorCalibrations = tiltVectorCalibrationsList;
	}
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		availableValueFields = 5; // Number of value fields that can be used.
		returnedCameraLengths =  GetScriptObjectFromID(dataObjectID).getAvailableCameraLengths();
		returnedCalibrationFactors = GetScriptObjectFromID(dataObjectID).getScaleCalibrationTable();
		returnedTiltVectorCalibrations = GetScriptObjectFromID(dataObjectID).getTiltVectorCalibrations();
	}
	
	/* Function to create the dialog (minus the OK/Cancel buttons) */
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for calibration dialog.");}
		taggroup box_items
		taggroup box=dlgcreatebox("Configure Scale Factors", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		tagGroup availableCameraLengths = GetScriptObjectFromID(dataObjectID).getAvailableCameraLengths();
		//TagGroupOpenBrowserWindow(availableCameraLengths,0);
		tagGroup calibrationValues = GetScriptObjectFromID(dataObjectID).getScaleCalibrationTable();
		//TagGroupOpenBrowserWindow(calibrationValues,0);
		number totalCameraLengths = TagGroupCountTags(availableCameraLengths);
		tagGroup tiltCalibrationValues = GetScriptObjectFromID(dataObjectID).getTiltVectorCalibrations();
		//TagGroupOpenBrowserWindow(tiltCalibrationValues,0);
		
		if(debugMode==1){result("\n\tPopulating fields for calibration dialog.");}
		string theLabel;
		availableCameraLengths.TagGroupGetIndexedTagAsString(0, theLabel);
		number theFactor;
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value0Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value0Label");
		tagGroup value0Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value0Factor");
		taggroup value0Fields = dlggroupitems(value0Label, value0Factor).dlgtablelayout(2,1,0);

		availableCameraLengths.TagGroupGetIndexedTagAsString(1, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value1Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value1Label");
		tagGroup value1Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value1Factor");
		taggroup value1Fields = dlggroupitems(value1Label, value1Factor).dlgtablelayout(2,1,0);
		
		availableCameraLengths.TagGroupGetIndexedTagAsString(2, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value2Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value2Label");
		tagGroup value2Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value2Factor");
		taggroup value2Fields = dlggroupitems(value2Label, value2Factor).dlgtablelayout(2,1,0);
		
		availableCameraLengths.TagGroupGetIndexedTagAsString(3, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value3Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value3Label");
		tagGroup value3Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value3Factor");
		taggroup value3Fields = dlggroupitems(value3Label, value3Factor).dlgtablelayout(2,1,0);
		
		availableCameraLengths.TagGroupGetIndexedTagAsString(4, theLabel);
		calibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup value4Label = DLGCreateStringField( theLabel, 10, "changedLabel" ).dlgidentifier("value4Label");
		tagGroup value4Factor = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value4Factor");
		taggroup value4Fields = dlggroupitems(value4Label, value4Factor).dlgtablelayout(2,1,0);
		
		/* tiltCalibrationValues.TagGroupGetTagAsNumber(theLabel, theFactor);
		tagGroup tilt0Label = DLGCreateLabel( "X Pixels Per X Tilt:" );
		tagGroup tilt0Value = DLGCreateRealField( theFactor, 20, 10, "changedValue" ).dlgidentifier("value0Factor");
		taggroup tilt0Fields = dlggroupitems(value0Label, value0Factor).dlgtablelayout(2,1,0); */
		
		
		if(debugMode==1){result("\n\tGrouping Camera Lengths and scale calibrations...");}
		box_items.DLGAddElement(dlgcreatelabel("Camera Lengths and Scale Factors"));
		box_items.DLGAddElement(value0Fields);
		box_items.DLGAddElement(value1Fields);
		box_items.DLGAddElement(value2Fields);
		box_items.DLGAddElement(value3Fields);
		box_items.DLGAddElement(value4Fields);		
		
		if(debugMode==1){result("\n\tReturning tag group for calibration dialog.");}
		return box
	}
	
	/* Function to create the new tag lists from the field values and uploadthem to the parent dialog. */
	number uploadFields(object self){
		if(debugMode==1){result("\n\tCreating new CL value table...");}
		TagGroup CLValues = NewTagList();
		string value;
		self.DLGGetValue("value0Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value1Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value2Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value3Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		self.DLGGetValue("value4Label", value );
		CLValues.TagGroupInsertTagAsString(infinity(), value);
		if(debugMode==1){result(" Done.");}
		// push to parent dialog.
		GetScriptObjectFromID(scaleValueID).takeCameraLengths(CLValues);
		
		if(debugMode==1){result("\n\tCreating new default calibration table values");}
		TagGroup diffractionData = NewTagGroup();
		string theLabel
		number theFactor
		self.DLGGetValue("value0Label", theLabel );
		self.DLGGetValue("value0Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value1Label", theLabel );
		self.DLGGetValue("value1Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value2Label", theLabel );
		self.DLGGetValue("value2Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value3Label", theLabel );
		self.DLGGetValue("value3Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		self.DLGGetValue("value4Label", theLabel );
		self.DLGGetValue("value4Factor", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		if(debugMode==1){result(" Done.");}
		// push to parent dialog.
		GetScriptObjectFromID(scaleValueID).takeCalibrationFactors(diffractionData);	
	}
	
	/* Function to save temporary tag groups to dataObject */
	void saveToDataObject(object self){
		if(debugMode==1){result("\n\tSaving new values to dataObject...");}
		GetScriptObjectFromID(dataObjectID).setAvailableCameraLengths(returnedCameraLengths);
		GetScriptObjectFromID(dataObjectID).setScaleCalibrationTable(returnedCalibrationFactors);
		if(debugMode==1){result("\nSaving Complete.");}
	}
	
	/* Create the Dialog. Must be called before showScaleValueDialog. Uses the CreateFields function output */
	void generateDialog(object self){
		self.super.init( self.createFields() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showCalibrationDialog(object self){
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// Function used to summon forth the calibration dialog. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	// Stores any results in the dataObject if 'ok' is pressed, no need to do anything else.
	number inputNewCalibration(object self)
	{
		if(debugMode==1){result("\nCreating child dialog Object (calibration options)");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showCalibrationDialog();	// Display the child with Pose() system
		if(useValues == 1){
			// save temporary tag groups to the dataObject
			self.saveToDataObject();
		}
		childDialog = NULL; // NULL the childDialog so it can go out of scope.
		return useValues;
	}

	// The constructor
	ScaleValueDialog(object self)
	{
		scaleValueID = self.ScriptObjectGetID();
	}
	
	// The destructor (does nothing)
	~ScaleValueDialog(object self)
	{
		result("\nScale Calibration Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}
		
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Scale Calibration Dialog");}
	}
	
	void changedLabel(object self, tagGroup tg){ //Change method detects when a CL label is changed. tg is the source of the call
		//string value=tg.dlggetvalue()
		// create the camera length and calibration tables whenever there is a change and upload them to the parent dialog.
		self.uploadFields();
	}
	
	void changedValue(object self, tagGroup tg){ //Change method detects when a calibration factor is changed. tg is the source of the call
		// number value=tg.dlggetvalue()
		// create the camera length and calibration tables whenever there is a change and upload them to the parent dialog.
		self.uploadFields();
	}
}

// ********************************
//	Tilt Calibration Dialog Class
// ********************************
// It is used to enter/display the calibration scale factors and camera length options.

class TiltValueDialog : uiframe
{
	// Global variables
	number scaleValueID; // Used by child dialog to return values to parent.
	object childDialog; // Store a clone of this dialog here for repeated use.
	TagGroup returnedCameraLengths; // Used by child dialog to return values to parent.
	TagGroup returnedCalibrationFactors; // Used by child dialog to return values to parent.
	TagGroup returnedTiltVectorCalibrations; // Used by child dialog to return values to parent.
	tagGroup availableCameraLengths; // used to store initial values.
	tagGroup calibrationValues; // used to store initial values.
	tagGroup tiltCalibrationValues; // used to store initial values.
	number dataObjectID;
	number toolkitID;
	number debugMode;
	number availableValueFields; // stores the number of camera lengths.
	string cameraLength;
	
	// updates the returnedTiltVectorCalibrations taggroup in this object.
	void takeTiltFactors(object self, tagGroup tiltFactorList, string theCameraLength){
		cameraLength = theCameraLength;
		if(returnedTiltVectorCalibrations.TagGroupDoesTagExist(cameraLength)){
			//result("\nExisting CL found and deleted")
			returnedTiltVectorCalibrations.taggroupdeletetagwithlabel(cameraLength); // delete existing values.
		}
		returnedTiltVectorCalibrations.TagGroupCreateNewLabeledTag(cameraLength); // create value
		returnedTiltVectorCalibrations.TagGroupSetTagAsTagGroup(cameraLength, tiltFactorList); // update tilt values
		//TagGroupOpenBrowserWindow(returnedTiltVectorCalibrations,0);
	}

	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		availableValueFields = 5; // Number of camera lengths available
		returnedCameraLengths =  GetScriptObjectFromID(dataObjectID).getAvailableCameraLengths();
		availableCameraLengths =  GetScriptObjectFromID(dataObjectID).getAvailableCameraLengths();
		returnedCalibrationFactors = GetScriptObjectFromID(dataObjectID).getScaleCalibrationTable();
		calibrationValues = GetScriptObjectFromID(dataObjectID).getScaleCalibrationTable();
		returnedTiltVectorCalibrations = GetScriptObjectFromID(dataObjectID).getTiltVectorCalibrations();
		tiltCalibrationValues = GetScriptObjectFromID(dataObjectID).getTiltVectorCalibrations();
		
	}
	
	/* Function to create the dialog (minus the OK/Cancel buttons) */
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for tilt calibration dialog.");}
		taggroup box_items;
		taggroup box=dlgcreatebox("Configure Tilts", box_items);
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5);
		
		//TagGroupOpenBrowserWindow(availableCameraLengths,0);
		//TagGroupOpenBrowserWindow(calibrationValues,0);
		//TagGroupOpenBrowserWindow(tiltCalibrationValues,0);
		number totalCameraLengths = TagGroupCountTags(availableCameraLengths);
		
		if(debugMode==1){result("\n\tPopulating drop down dialog...");}
		TagGroup dropDownList;
		TagGroup dropDown = DLGCreatePopup( dropDownList, 1, "changeCL" ).dlgidentifier("cameraLengthDropDown");
		
		number i;
		for(i=0; i < availableValueFields; i++){
			string theLabel;
			if( availableCameraLengths.TagGroupGetIndexedTagAsString(i, theLabel) ){
				DLGAddPopupItemEntry( dropDownList, theLabel );
			}
		}
		taggroup dropDownGroup = dlggroupitems(DLGCreateLabel("Select Camera Length:"), dropDown).dlgtablelayout(2,1,0);
		if(debugMode==1){result(" done.");}
		
		string theLabel, thePath;
		number theValue;
		availableCameraLengths.TagGroupGetIndexedTagAsString(0, theLabel);
		thePath = theLabel + ":xTiltx";
		result("\nTheLabel: " + theLabel);
		result("\nThePath: " + thePath);
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		result("\nTheValue: " + theValue);
		tagGroup value0Label = DLGCreateLabel("X Pixels per X-Tilt:");
		tagGroup value0Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("xTiltxField");
		taggroup value0Fields = dlggroupitems(value0Label, value0Factor).dlgtablelayout(2,1,0);

		thePath = theLabel + ":xTilty";
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		tagGroup value1Label = DLGCreateLabel("Y Pixels per X-Tilt:");
		tagGroup value1Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("xTiltyField");
		taggroup value1Fields = dlggroupitems(value1Label, value1Factor).dlgtablelayout(2,1,0);
		
		thePath = theLabel + ":yTiltx";
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		tagGroup value2Label = DLGCreateLabel("X Pixels per Y-Tilt:");
		tagGroup value2Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("yTiltxField");
		taggroup value2Fields = dlggroupitems(value2Label, value2Factor).dlgtablelayout(2,1,0);
		
		thePath = theLabel + ":yTilty";
		tiltCalibrationValues.TagGroupGetTagAsNumber(thePath, theValue);
		tagGroup value3Label = DLGCreateLabel("Y Pixels per Y-Tilt:");
		tagGroup value3Factor = DLGCreateRealField( theValue, 30, 10, "changedValue" ).dlgidentifier("yTiltyField");
		taggroup value3Fields = dlggroupitems(value3Label, value3Factor).dlgtablelayout(2,1,0);
		
		if(debugMode==1){result("\n\tGrouping tilt values");}
		box_items.DLGAddElement(dropDownGroup);
		box_items.DLGAddElement(value0Fields);
		box_items.DLGAddElement(value1Fields);
		box_items.DLGAddElement(value2Fields);
		box_items.DLGAddElement(value3Fields);
		
		if(debugMode==1){result("\n\tReturning tag group for tilt calibration dialog.");}
		return box
	}
	
	/* Function to create the new tag lists from the field values and uploadthem to the parent dialog. */
	number uploadFields(object self){
		if(debugMode==1){result("\n\tCreating new tilt value table");}

		string thisCameraLength
		number option;
		self.DLGGetValue("cameraLengthDropDown", option);
		returnedCameraLengths.TagGroupGetIndexedTagAsString((option-1), thisCameraLength);

		TagGroup diffractionData = NewTagGroup();
		number theFactor
		string theLabel
		
		theLabel = "xTiltx";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		theLabel = "xTilty";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		theLabel = "yTiltx";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		theLabel = "yTilty";
		self.DLGGetValue(theLabel + "Field", theFactor );
		diffractionData.TagGroupCreateNewLabeledTag(theLabel);
		diffractionData.TagGroupSetTagAsNumber(theLabel, theFactor);
		
		if(debugMode==1){result(" Done.");}
		// push to parent dialog.
		//TagGroupOpenBrowserWindow(diffractionData,0);
		GetScriptObjectFromID(scaleValueID).takeTiltFactors(diffractionData, thisCameraLength);
	}
	
	
	/* Function to save temporary tag groups to dataObject */
	void saveToDataObject(object self){
		if(debugMode==1){result("\n\tSaving new values to dataObject...");}
		GetScriptObjectFromID(dataObjectID).setTiltVectorCalibrations(returnedTiltVectorCalibrations);
		if(debugMode==1){result("\nSaving Complete.");}
	}
	
	
	/* Create the Dialog. Must be called before showScaleValueDialog. Uses the CreateFields function output */
	void generateDialog(object self){
		self.super.init( self.createFields() );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showCalibrationDialog(object self){
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// Function used to summon forth the calibration dialog. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	number inputNewCalibration(object self)
	{
		if(debugMode==1){result("\nCreating child dialog Object (calibration options)");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showCalibrationDialog();	// Display the child with Pose() system
		if(useValues == 1){
			// save temporary tag groups to the dataObject
			self.saveToDataObject();
		}
		childDialog = NULL; // NULL the childDialog so it can go out of scope.
		return useValues;
	}

	// The constructor
	TiltValueDialog(object self)
	{
		scaleValueID = self.ScriptObjectGetID();
	}
	
	// The destructor (does nothing)
	~TiltValueDialog(object self)
	{
		result("\nTilt Calibration Dialog with ID: " + self.ScriptObjectGetID() + " closed.");
	}
		
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Tilt Calibration Dialog");}
	}
	
	void changeCL (object self, tagGroup tg){ //Change method detects when a CL is changed on the drop down menu
		number dropValue = tg.dlggetvalue();
		number theValue; // will hold the tilt value to load
		string thePath, thisCameraLength; // will hold the label for referencing values
		returnedCameraLengths.TagGroupGetIndexedTagAsString((dropValue-1), thisCameraLength);
		
		thePath = thisCameraLength + ":xTiltx";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("xTiltxField").DLGValue(theValue);
		
		thePath = thisCameraLength + ":xTilty";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("xTiltyField").DLGValue(theValue);
		
		thePath = thisCameraLength + ":yTiltx";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("yTiltxField").DLGValue(theValue);

		thePath = thisCameraLength + ":yTilty";
		returnedTiltVectorCalibrations.TagGroupGetTagAsNumber(thePath, theValue);
		self.LookupElement("yTiltyField").DLGValue(theValue);
	}
	
	void changedValue(object self, tagGroup tg){ //Change method detects when a calibration factor is changed. tg is the source of the call
		self.uploadFields();
	}
}


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


//****************************************************
// TOOLKIT FUNCTIONS & CLASS
//****************************************************

class CreateDF360DialogClass : uiframe
{
	number ToolkitID; // the ID of this object
	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image.
	object dataObject;
	number dataObjectID;
	object imageSetTools;
	number imageSetToolsID;
	number debugMode;
	object KeyListener;
	number KeyListenerID;
	object imageAlignmentDialog;
	number imageAlignmentDialogID;
	object scaleCalibrationDialog;
	number scaleCalibrationDialogID;
	object tiltCalibrationDialog;
	number tiltCalibrationDialogID;
	component markerRing;
	component ringRadiusText;
	
	// Function to print out the various saved variables for debugging
	void printAllValues(object self)
	{
		result("\n\nToolkit Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ToolkitID +\
			"\nDebugMode: " + debugMode +\
			"\nEMonline: " + EMOnline +\
			"\nAllowControl: " + AllowControl +\
			"\nDataObjectID: " + DataObjectID + " and " + (dataObject.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\nKeyListenerID: " + KeyListenerID + " and " + (KeyListener.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\nimageAlignmentDialogID: " + imageAlignmentDialogID + " and " + (imageAlignmentDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid";
		result(textstring);
		result("\n-------End----------------")
	}
	
	// Check if the microscope is online or not. Do not allow control of the microscope if not.
	void updateEMstatus(object self)
	{
		EMOnline = EMIsReady();
		if(!EMOnline){
			AllowControl = 0;
		}
	}
	
	// External functions can call this to see if they can use the microscope.
	number getAllowControl(object self)
	{
		return AllowControl;
	}
	
	number getToolkitID(object self)
	{
		return ToolkitID;
	}
	
	/* Stores the dataObject */
	number storeDataObject(object self, object &theDataObject)
	{
		dataObject = theDataObject;
		dataObject.initialise(ToolkitID);
		dataObjectID = dataObject.ScriptObjectGetID();
		dataObject.setDebugMode(debugMode);
		return 1;
	}
	number getDataObjectID(object self)
	{
		return dataObjectID;
	}
	
	/* The Toolkit will store the ImageSetTools object for future use. */
	number storeImageSetTools(object self, object &theImageSetTools)
	{
		imageSetTools = theImageSetTools;
		imageSetToolsID = imageSetTools.ScriptObjectGetID();
		imageSetTools.initialise(ToolkitID, dataObjectID);
		imageSetTools.setDebugMode(debugMode);
		return imageSetToolsID;
	}
	number getImageSetToolsID(object self){
		return imageSetToolsID;
	}
	
	/* The Toolkit will store the KeyListener for future use. */
	number storeKeyListener(object self, object &theKeyListener)
	{
		KeyListener = theKeyListener;
		KeyListenerID = KeyListener.ScriptObjectGetID();
		KeyListener.initialise(ToolkitID, dataObjectID, imageSetToolsID);
		KeyListener.setDebugMode(debugMode);
		return KeyListenerID;
	}
	/* Attach the KeyListener to a display so it can function */
	void attachKeyListener(object self, imageDisplay theDisplay)
	{
		number keyToken = theDisplay.ImageDisplayAddKeyHandler(KeyListener, "HandleKey")
		if(debugmode==1){result("\nToolkit function: Attaching key handler object to display. KeyToken = " + keyToken);}
		KeyListener.startListening(keyToken);
	}
	number getKeyListenerID(object self)
	{
		return KeyListenerID;
	}
	/* Store the alignment dialog for future use. */
	number storeAlignmentDialog(object self, object theAlignmentDialog)
	{
		imageAlignmentDialog = theAlignmentDialog;
		imageAlignmentDialogID = imageAlignmentDialog.ScriptObjectGetID();
		imageAlignmentDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		imageAlignmentDialog.setDebugMode(debugMode);
		return imageAlignmentDialogID;
	}
	number getAlignmentDialogID(object self)
	{
		return imageAlignmentDialogID;
	}
	
	/* Store the scale calibration dialog for future use. */
	number storeCalibrationDialog(object self, object theCalibrationDialog)
	{
		scaleCalibrationDialog = theCalibrationDialog;
		scaleCalibrationDialogID = scaleCalibrationDialog.ScriptObjectGetID();
		scaleCalibrationDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		scaleCalibrationDialog.setDebugMode(debugMode);
		return scaleCalibrationDialogID;
	}
	number getscaleCalibrationDialogID(object self)
	{
		return scaleCalibrationDialogID;
	}
	
	/* Store the tilt calibration dialog for future use. */
	number storeTiltDialog(object self, object theDialog)
	{
		tiltCalibrationDialog = theDialog;
		tiltCalibrationDialogID = tiltCalibrationDialog.ScriptObjectGetID();
		tiltCalibrationDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		tiltCalibrationDialog.setDebugMode(debugMode);
		return tiltCalibrationDialogID;
	}
	number getTiltCalibrationDialogID(object self)
	{
		return tiltCalibrationDialogID;
	}
	
	/* Function to draw the lines on the View Window used to centre the beam and pick spots.
		If updateToolkit = 1, Adds the ring marker and stores it in the toolkit.
		Also creates a text component to update with ring diameter.
	*/
	void drawReticle(object self, image targetImage, number updateToolkit)
	{
		number centrex, centreY, radius, width, height;
		getSize(targetImage, width, height );
		component circle2;
		
		centreX = (width) / 2;
		centreY = (height) / 2;
		
		//Component NewLineAnnotation( Number top, Number left, Number bottom, Number right )
		Component line1 = NewLineAnnotation( 0, 0, height, width );
		Component line2 = NewLineAnnotation( height, 0, 0, width );
		
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		radius = 10; // Radius of the circle in pixels.
		number cTop = centreY - radius;
		number cBottom = centreY + radius;
		number cLeft = centreX - radius;
		number cRight = centreX + radius;
		Component circle1 = NewOvalAnnotation( cTop , cLeft, cBottom, cRight );

		// Set colour and stuff
		line1.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
		line2.componentsetfillmode(2);
		circle1.componentsetfillmode(2);
		line1.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
		line2.componentsetdrawingmode(2);
		circle1.componentsetdrawingmode(2);
		line1.componentsetforegroundcolor(1,0,0); // Colour that the shape is drawn in
		line2.componentsetforegroundcolor(1,0,0);
		circle1.componentsetforegroundcolor(1,0,0);
		line1.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.
		line2.componentsetbackgroundcolor(0,0,0);
		circle1.componentsetbackgroundcolor(0,0,0);
		// Add the components to the image display
		ImageDisplay targetDisplay = targetImage.ImageGetImageDisplay(0);
		Component comp = targetDisplay;
		comp.ComponentAddChildAtEnd( line1 );
		comp.ComponentAddChildAtEnd( line2 );
		comp.ComponentAddChildAtEnd( circle1 );

		// Make the lines not selectable.
		line1.ComponentSetSelectable(0);
		line2.ComponentSetSelectable(0);
		circle1.ComponentSetSelectable(0);
		
		/* This is the ring used to mark out a target for the ring collection method. */
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		radius = 100; // Radius of the circle in pixels.
		cTop = centreY - radius;
		cBottom = centreY + radius;
		cLeft = centreX - radius;
		cRight = centreX + radius;
		component newMarkerRing
		newMarkerRing = NewOvalAnnotation( cTop , cLeft, cBottom, cRight ); // This loads the component into the toolkit as well.

		// Set colour and stuff
		newMarkerRing.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
		newMarkerRing.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour
		newMarkerRing.componentsetforegroundcolor(1,0,0);// Colour that the shape is drawn in
		newMarkerRing.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.

		// Add the component to the image document
		comp.ComponentAddChildAtEnd( newMarkerRing );
		ComponentSetVisible( newMarkerRing, 1 ); // Make it visible on start up
		ComponentSetDeletable (newMarkerRing, 0); // Cannot be deleted until 'cleaned up'
		
		if(updateToolkit == 1){
			markerRing = newMarkerRing;
		}

		/* This is the text component to display the ring radius. */
		string textString = "D-Spacing: ";
		// Add text annotations and set their colour, display mode and font
		component newRingRadiusText;
		newRingRadiusText=newtextannotation(10,height - 32, textString, 16);
		newRingRadiusText.componentsetfillmode(2);
		newRingRadiusText.componentsetdrawingmode(2)			;
		newRingRadiusText.componentsetforegroundcolor(1,0,0);
		newRingRadiusText.componentsetbackgroundcolor(0,0,0);
		newRingRadiusText.componentsetfontfacename("Microsoft Sans Serif");
	
		// Add the component to the image document
		comp.ComponentAddChildAtEnd( newRingRadiusText );
		ComponentSetVisible( newRingRadiusText, 1 ); // Show it initially
		newRingRadiusText.ComponentSetSelectable(0);
		if(updateToolkit == 1){
			ringRadiusText = newRingRadiusText;
		}		
	}
	
	/* Function to make the reticle, lines, etc. of any image deletable and selectable */
	void cleanReticle(object self, image myImage)
	{
		ImageDisplay imageDisp = myImage.ImageGetImageDisplay( 0 );
		Number compCount =  ComponentCountChildren( imageDisp );
		for(number i=0;i < compCount;i++){
			component annotid=imageDisp.ComponentGetChild(i);	
			annotid.ComponentSetSelectable(1);
			annotid.ComponentSetDeletable(1);
		}	
	}
	
	/* Code run to link an active View image / window to the Toolkit and set up short cut keys and things. */
	void captureViewScreen (object self)
	{
		self.updateEMstatus();
		if(!EMOnline){
			result("\n-------------No Microscope Detected.-----------------")
			exit(0);
		}
		dataObject.setCentreTiltHere();
		if(debugMode){result("\nCapturing View Window...");}
		number cameraWidth, cameraHeight;
		sscgetsize(cameraWidth, cameraHeight); // Get camera resolution
		dataObject.setCameraHeight(cameraHeight);
		dataObject.setCameraWidth(cameraWidth);
		if(debugMode==1){result("\nCamera Resolution set to " + dataObject.getCameraWidth() + " x " + dataObject.getCameraHeight());}
		image ReferenceDP := sscUnprocessedAcquire(0.1,0,0,cameraWidth,cameraHeight);
		if(debugMode){result("\n\tReference exposure created");}
		dataObject.setReferenceDP(ReferenceDP);
		if(debugMode){result("\n\tReference exposure added to toolkit data store.");}
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo View Image detected in capture code.")
			exit(0);
		}
		AllowControl = 1;
		self.drawReticle(viewImage, 1);
		if(debugMode==1){result("\n\tReticle added to View window.");}
		
		imageDisplay frontdisp
		if(!returnViewImageDisplay(debugMode, frontdisp)){
			result("\nNo View Display found.")
			exit(0);	
		}
		
		self.attachKeyListener(frontdisp) // attach the keylistener to the live-view display and start it up.
		if(debugMode==1){result("\n\tKeyListener created and attached. Shortcut keys available.");}
		
		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		dataObject.setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 )
		dataObject.setOriginalScaleString(scaleString);
		if(debugMode==1){result("\n\tThe View window scale was initially set to " + dataObject.getOriginalScale() + " " + dataObject.getOriginalScaleString());}
		number viewWidth, viewHeight;
		getSize(viewImage, viewWidth, viewHeight);
		number binning = cameraWidth / viewWidth;
		dataObject.setBinningMultiplier(binning);
		if(debugMode==1){result("\n\tThe binning multiplier has been set to " + dataObject.getBinningMultiplier());}
		if(debugMode){result("\nView Window Capture complete");}
		return;
	}
		
	void ToggleDebugMode(object self){
		debugMode = (debugMode == 0) ? 1 : 0 ;
		if(debugMode == 1){
			result("\nDebug Mode Activated");
		}
		if(debugMode == 0){
			result("\nDebug Mode Deactivated");
		}
		if(dataObject.ScriptObjectIsValid()){
			dataObject.setDebugMode(debugMode);
		}
		if(KeyListener.ScriptObjectIsValid()){
			keylistener.setDebugMode(debugMode);
		}
		if(imageAlignmentDialog.ScriptObjectIsValid()){
			imageAlignmentDialog.setDebugMode(debugMode);
		}
	}
	
	/* Function to centre beam */
	void beamCentre(object self){
		if(dataObject.ScriptObjectIsValid()){ // If dataobject is not there, do not let it set the beam tilt to 0,0!
			number centreXTilt = dataObject.getCentreXTilt();
			number centreYTilt = dataObject.getCentreYTilt();
			moveBeamTilt ( centreXTilt, centreYTilt );
			}
	}	
	
	/* Function to change the Tilt to centre on a marked ROI point */
	// Number ImageDisplayCountROIs( ImageDisplay imgDisp )
	// ROI ImageDisplayGetROI( ImageDisplay imgDisp, Number index )
	void moveToCurrentROI (object self){
		if(debugMode==1){result("\nStart moveToCurrentROI function.");}
		number ROITracker = dataObject.getROITracker(); // This value determines which ROI to go to.
		if(debugMode==1){result("\n\tROITracker = " + ROITracker);}
		ImageDisplay viewDisplay;
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			result("\nNo active View Window detected. This should never happen.");
			exit(0);
		}
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==1){result("\n\tTotal ROIs = " + totalROI);}
		if( totalROI==0 ){
			result("\nNo ROI to go to.");
			exit(0);
		}
		if ( (ROITracker-1) >= totalROI){ // The tracker is 1 higher than the highest ROI .
			//Resets the count to 0 to avoid out-of-bounds errors and goes to Beam Centre instead.
			ROITracker = 0;
			dataObject.setROITracker(0);
			if(debugMode==1){result("\nSet ROITracker to 0. Returning to Beam Centre");}
			self.beamCentre();
			exit(0);
		}
		ROI ROItoMoveTo = viewDisplay.ImageDisplayGetROI( ROITracker );
		number xPixel, yPixel, xTiltTarget, yTiltTarget;
		if(ROItoMoveTo.ROIIsPoint() != 1){
			result("\n\tROI #" + ROITracker + " is not a point. Skipping over it.");
		}
		else
		{
			ROItoMoveTo.ROIGetPoint(xPixel, yPixel);
			if(debugMode==1){result("\n\txPixel = " + xPixel + " yPixel = " + yPixel);}
			// void pixelToTilt(object dataObject, number xPixel, number yPixel, number &xTiltTarget, number &yTiltTarget,
			//			number isViewWindow, number tiltShiftOnly, number pixelShiftOnly)
			dataObject.pixelToTilt(xPixel, yPixel, xTiltTarget, yTiltTarget, 1, 0, 0);
			if(debugMode==1){result("\n\txTiltTarget = " + xTiltTarget + " yTiltTarget = " + yTiltTarget);}
			moveBeamTilt(xTiltTarget, yTiltTarget);
		}
		if(debugMode==1){result("\nEnd moveToCurrentROI function.");}
	}
	
	//****************************************************
	// Create the top level components of the Toolkit dialog
	//****************************************************

	TagGroup makeDF360Buttons(object self)
	{
		// Creates the buttons
		TagGroup dsCalibrate = DLGCreateBevelButton(calibrateButton, calibrateButton, "calibrateButtonPress");
		TagGroup dsControls = DLGCreateBevelButton(microscopeButton, microscopeButton, "controlsButtonPress");
		TagGroup dsRing = DLGCreateBevelButton(ringButton, ringButton, "ringButtonPress");
		TagGroup dsTarget = DLGCreateBevelButton(targetButton, targetButton, "targetButtonPress");
		TagGroup dsCamera = DLGCreateBevelButton(cameraButton, cameraButton, "cameraButtonPress");
		TagGroup dsOption = DLGCreateBevelButton(optionButton, optionButton, "optionButtonPress");

		// Now add the buttons created above to the container

		taggroup container=dlgcreategroup()
		
		container.dlgaddelement(dsCalibrate)
		container.dlgaddelement(dsControls)
		container.dlgaddelement(dsRing)
		container.dlgaddelement(dsTarget)
		container.dlgaddelement(dsCamera)
		container.dlgaddelement(dsOption)
		
		container.dlgtablelayout(10,1,0)
		
		return container;
	}

	//****************************************************
	// PANEL CREATION
	//****************************************************
	// this function creates a panel for each set of controls. The buttons and fields are defined, but their functions are not.

	TagGroup makeCameraDropDownMenu(object self) // creates the pulldown menu to select camera length
	{
		if(debugMode==1){result("\nConstructing the camera length drop down menu");}
		TagGroup pulldown_items;
		TagGroup pulldown = DLGCreatePopup(pulldown_items, 1, "trackCameraLengthChange")
		pulldown_items.DLGAddPopupItemEntry("Set Camera Length");
		TagGroup CameraLengths
		if(ScriptObjectIsValid(dataObject)==1){
			if(debugMode==1){result(" from stored table...");}
			CameraLengths = dataObject.getAvailableCameraLengths();
		} else {
		if(debugMode==1){result(" from scratch...");}
			CameraLengths = NewTagList();
			CameraLengths.TagGroupInsertTagAsString(infinity(), "None");
		}		
		number availableCameraLengths = CameraLengths.TagGroupCountTags();
		number i;
		for(i=0; i < availableCameraLengths; i++){
			string value;
			TagGroupGetIndexedTagAsString(CameraLengths, i, value)
			pulldown_items.DLGAddPopupItemEntry(value);
		}
		pulldown.DLGIdentifier("CameraDropDown"); // Used to ID the menu in other functions.
		if(debugMode==1){result("  Done.");}
		//TagGroupOpenBrowserWindow(pulldown, 0);
		return pulldown;
	}
		
	taggroup makeDF360panels(object self)
	{
		taggroup panellist = dlgcreatepanellist().dlgidentifier("panellist").dlgexternalpadding(10,10)

		// BUTTON METHODS are to be defined in the class definition (work needed);

		// The first panel is for calibration
		taggroup panel1=dlgcreatepanel()
		panel1.dlgaddelement(dlgcreatelabel("Calibration")) // Label
		panel1.dlgaddelement(dlgcreatelabel("")) // Blank
		panel1.DLGAddElement(self.makeCameraDropDownMenu() )
		TagGroup tiltCalibrationAutoButton = DLGCreatePushButton("CALIBRATE TILT", "startCalibrationButtonPress")
		panel1.dlgaddelement(tiltCalibrationAutoButton)
		TagGroup DarkfieldImagingExposure = DLGCreateRealField( 30, 10, 3).dlgidentifier("DarkfieldExposureFieldInput")
		panel1.dlgaddelement(DarkfieldImagingExposure)
		TagGroup SetDFExposureButton = DLGCreatePushButton("Set DF Exposure", "onDFChange");
		panel1.dlgaddelement(SetDFExposureButton)
		TagGroup BrightfieldImagingExposure = DLGCreateRealField( 0.5, 10, 3).dlgidentifier("BrightfieldExposureFieldInput")
		panel1.dlgaddelement(BrightfieldImagingExposure)
		TagGroup SetBFExposureButton = DLGCreatePushButton("Set BF Exposure", "onBFChange");
		panel1.dlgaddelement(SetBFExposureButton)
		TagGroup DiffractionImagingExposure = DLGCreateRealField( 1, 10, 3).dlgidentifier("DiffractionExposureFieldInput")
		panel1.dlgaddelement(DiffractionImagingExposure)
		TagGroup SetDPExposureButton = DLGCreatePushButton("Set DP Exposure", "onDPChange");
		panel1.dlgaddelement(SetDPExposureButton)
		
			// Arrange the buttons and things
		panel1.dlgtablelayout(2,6,0);
		
		// The second panel is for Spot Storage.
		taggroup panel2=dlgcreatepanel()
		panel2.dlgaddelement(dlgcreatelabel("Target Diffraction Spots")) // Label
		/*TagGroup storeDPSelect = DLGCreateCheckBox( "Record DP Images", 1 );
		panel2.dlgaddelement(storeDPSelect) */
		TagGroup storePointButton = DLGCreatePushButton("Single Diffraction Spot", "StoreDPButtonPress")
		panel2.dlgaddelement(storePointButton)
		TagGroup DarkFieldROIButton = DLGCreatePushButton("Target All ROI", "storeROIButtonPress")
		panel2.dlgaddelement(DarkFieldROIButton)
		TagGroup storeRingButton = DLGCreatePushButton("Target Ring", "storeRingButtonPress")
		panel2.dlgaddelement(storeRingButton)
		TagGroup resetTiltStoreButton = DLGCreatePushButton("Delete Stored Targets", "deleteStoredTiltsButtonPress")
		panel2.dlgaddelement(resetTiltStoreButton)
		
		// Panel 3 is for controlling the Marker Ring
		taggroup panel3=dlgcreatepanel()
		panel3.dlgaddelement(dlgcreatelabel("Ring Mode:")) // Label
		TagGroup markerRingToggleButton = DLGCreatePushButton("On / Off", "RingToggleButtonPress")
		panel3.dlgaddelement(markerRingToggleButton)
		taggroup ringMarkerField=DLGCreateRealField(0, 10, 0).dlgidentifier("ringMarkerFieldInput")
		panel3.dlgaddelement(ringMarkerField)
		/*	Refer to this value by defining like so:
			taggroup intfield=self.lookupelement("ringMarkerFieldInput")
			number fieldval=dlggetvalue(intfield)
		*/
		TagGroup setRadiusButton = DLGCreatePushButton("Set Radius (1/nm)", "SetRingRadiusButtonPress")
		panel3.dlgaddelement(setRadiusButton)
		TagGroup updateRadiusButton = DLGCreatePushButton("Update Radius Text", "updateRingRadiusButtonPress")
		panel3.dlgaddelement(updateRadiusButton)
		TagGroup recenterRingButton = DLGCreatePushButton("Reset Ring", "recenterRingButtonPress")
		panel3.dlgaddelement(recenterRingButton)
		TagGroup addRingButton = DLGCreatePushButton("Add Marker Ring", "addRingButtonPress")
		panel3.dlgaddelement(addRingButton)
		
		panel3.dlgtablelayout(2,6,0); // Arrange the buttons

		// Panel 4 is a blank panel
		taggroup panel4=dlgcreatepanel()
		
		// Panel 5 is microscope controls
		taggroup panel5=dlgcreatepanel()
		panel5.dlgaddelement(dlgcreatelabel("Microscope Controls")) // Label
		TagGroup recentreBeamButton = DLGCreatePushButton("Center Beam", "beamCentreButtonPress")
		panel5.dlgaddelement(recentreBeamButton)
		
		// Panel 6 is for options
		taggroup panel6=dlgcreatepanel();
		panel6.dlgaddelement(dlgcreatelabel("Options")); // Label
		panel6.dlgaddelement(dlgcreatelabel("")); // Blank
		TagGroup dsDebug = DLGCreatePushButton("Debug Mode", "debugToggleButtonPress");
		panel6.dlgaddelement(dsDebug);
		TagGroup changeSaveDir = DLGCreatePushButton("Save Directory", "saveDirButtonPress");
		panel6.dlgaddelement(changeSaveDir);
		TagGroup enterScaleButton = DLGCreatePushButton("Set Scale", "enterScaleButtonPress");
		panel6.dlgaddelement(enterScaleButton);
		TagGroup manualTiltEntryButton = DLGCreatePushButton("Tilt Calibration", "manualTiltCalibrationButtonPress");
		panel6.dlgaddelement(manualTiltEntryButton);
		TagGroup captureViewButton = DLGCreatePushButton("Capture View", "captureViewButtonPress");
		panel6.dlgaddelement(captureViewButton);
		TagGroup saveSettingsToFile = DLGCreatePushButton("Save Settings File", "saveToolKitVariablesToFilePress");
		panel6.dlgaddelement(saveSettingsToFile);
		TagGroup loadSettingsFromFile = DLGCreatePushButton("Load Settings File", "loadToolkitVariablesFromFilePress");
		panel6.dlgaddelement(loadSettingsFromFile);
		TagGroup saveSettingsToDM = DLGCreatePushButton("Set as Default", "saveVariablesToMemoryPress");
		panel6.dlgaddelement(saveSettingsToDM);
		panel6.dlgtablelayout(2,12,0); // Arrange the buttons
		
		// Panel 7 is for final Imaging steps
		taggroup panel7=dlgcreatepanel()
		panel7.dlgaddelement(dlgcreatelabel("Dark Field Imaging")) // Label
		TagGroup DarkFieldStoredButton = DLGCreatePushButton("Start Imaging", "DarkFieldImageButtonPress")
		panel7.dlgaddelement(DarkFieldStoredButton)
		panel7.dlgaddelement(dlgcreatelabel("Image Processing")) // Label
		panel7.dlgaddelement(dlgcreatelabel("")) // Blank		
		TagGroup ProcessSingleFileButton = DLGCreatePushButton("Binary Image", "ProcessSingleFileButtonPress")
		panel7.dlgaddelement(ProcessSingleFileButton)
		TagGroup BinaryDirectoryButton = DLGCreatePushButton("Binary Directory", "ProcessDirectoryButtonPress")
		panel7.dlgaddelement(BinaryDirectoryButton)
		TagGroup AlignImagesButton = DLGCreatePushButton("Align 2 Images", "alignImagesButtonPress")
		panel7.dlgaddelement(AlignImagesButton)
		TagGroup AlignDirectoryButton = DLGCreatePushButton("Align Directory", "alignDirectoryButtonPress")
		panel7.dlgaddelement(AlignDirectoryButton)
		TagGroup CompositeMapButton = DLGCreatePushButton("Create Map", "mapDirectoryButtonPress")
		panel7.dlgaddelement(CompositeMapButton)
		
		panel7.dlgtablelayout(2,10,0); // Arrange the buttons
		
		panellist.dlgaddpanel(panel1)
		panellist.dlgaddpanel(panel2)
		panellist.dlgaddpanel(panel3)
		panellist.dlgaddpanel(panel4)
		panellist.dlgaddpanel(panel5)
		panellist.dlgaddpanel(panel7)
		panellist.dlgaddpanel(panel6)

		panellist.dlgvalue(3) // Set the panel to be displayed

		return panellist
	}
	
	
	//*********************
	// SELF STARTING
	//*********************
	// When the class is constructed it sets up a lot of stuff, but is finalised with the updateDialog() function.
	
	// Constructor
	CreateDF360DialogClass(object self)
	{
		ToolkitID = self.ScriptObjectGetID();
		debugMode = 1;
		
	}
		
	// Function called on any destruction event.
	~CreateDF360DialogClass(object self)
	{
		imageDisplay imgdisp;
		if(returnViewImageDisplay(debugMode,imgdisp)){
			component annotid=imgdisp.ComponentGetChild(0)
			while (annotid.ComponentIsValid()){
				annotid.componentremovefromparent();
				annotid=imgdisp.ComponentGetChild(0);
			}
			self.beamCentre();
			// Stop the keyhandler
			if(debugMode==1){result("\nRemoving KeyHandler from View display");}
			KeyListener.stopListening(imgdisp);
		}
	result("\nToolkit has been closed.");
	}
	
	// Function to put the final dialog together and show it. Have the various objects stored inside it before hand.
	void updateDialog(object self){
		result("\nInitializing Toolkit...");
		// Configure the positioning in the top right of the application window
		TagGroup position;
		position = DLGBuildPositionFromApplication()
		position.TagGroupSetTagAsTagGroup( "Width", DLGBuildAutoSize() )
		position.TagGroupSetTagAsTagGroup( "Height", DLGBuildAutoSize() )
		position.TagGroupSetTagAsTagGroup( "X", DLGBuildRelativePosition( "Inside", 1 ) )
		position.TagGroupSetTagAsTagGroup( "Y", DLGBuildRelativePosition( "Inside", 1 ) )

		TagGroup dialog_items;	
		TagGroup dialog = DLGCreateDialog("Darkfield 360 Control Dialog", dialog_items).dlgposition(position);

		// Top level buttons made here
		dialog_items.dlgaddelement( self.makeDF360Buttons() );
		// Panels and lower level buttons built here
		dialog_items.dlgaddelement(  self.makeDF360panels() );
		// Initialises the above class object with the dialog that was made
		self.init(dialog)
		// Show the dialog as a Modeless Dialog
		self.display("Darkfield 360 Controls");
		
		// Make the dialog into a floating palette. Needs a lot of work to make it usable.
		// self.RegisterScriptPalette("Darkfield 360", "Darkfield 360");
		
		self.updateEMstatus();
	}
	//********************************
	// RING CONTROL FUNCTIONS
	//********************************
	/* Function to make a marker circle component that can be assigned to any image.
		This is intended as a marker ring that is not linked to the ring-capture controls, just to show things. 
		Will return the Circle component if you want to use it.
	*/
	component makeNewCircle(object self, image targetImage, number radiusPX, string radiusTextString, rgbnumber componentColour)
	{
		component greenCircle
		number centreX, centreY;
		getSize(targetImage, centreX, centreY);
		centreX = centreX / 2;
		centreY = centreY / 2;
		number cTop = centreY - radiusPX;
		number cBottom = centreY + radiusPX;
		number cLeft = centreX - radiusPX;
		number cRight = centreX + radiusPX;
		greenCircle = NewOvalAnnotation( cTop , cLeft, cBottom, cRight );
		
		// Set colour and stuff
		number redNumber, blueNumber, greenNumber;
		redNumber = red(componentColour) / 255;
		blueNumber = blue(componentColour) / 255;
		greenNumber = green(componentColour) / 255;
		greenCircle.componentsetfillmode(2); // mode 2 is not filled. Important for circles.
		greenCircle.componentsetdrawingmode(2); // mode 1 outlines the shape in the background colour, mode 2 does foreground (?)
		greenCircle.componentsetforegroundcolor(redNumber, greenNumber, blueNumber);// Colour that the shape is drawn in
		greenCircle.componentsetbackgroundcolor(0,0,0); // Colour the shape is outlined in.

		// Add the component to the image document
		ImageDisplay targetDisplay = targetImage.ImageGetImageDisplay(0);
		Component comp = targetDisplay;
		comp.ComponentAddChildAtEnd( greenCircle );
		
		// Text Stuff
		component radiusText;
		radiusText=newtextannotation(10, 10, radiusTextString, 16); // Put this one near the top
		radiusText.componentsetfillmode(2);
		radiusText.componentsetdrawingmode(2)			;
		radiusText.componentsetforegroundcolor(redNumber, greenNumber, blueNumber);
		radiusText.componentsetbackgroundcolor(0,0,0);
		radiusText.componentsetfontfacename("Microsoft Sans Serif");

		// Add the component to the image document
		comp.ComponentAddChildAtEnd( radiusText );
		return greenCircle;
	}
	
	/* Function to change the visibility of the marker ring and any attached text.
		Select the component to make it easy to see and work with.
	*/
	
	void toggleMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			exit(0);
		}
		if(debugMode==true){result("\nmarkerRing object is valid");}
		if(debugMode==true){result("\n\tmarkerRing Get Visible: " + ComponentGetVisible( markerRing ) );}
		if( ComponentGetVisible( markerRing ) == 1 ){
			ComponentSetVisible( markerRing, 0 );
			ComponentSetVisible( ringRadiusText, 0 );
			ComponentSetSelected( markerRing, 0 );
		} else {
			ComponentSetVisible( markerRing, 1 );
			ComponentSetVisible( ringRadiusText, 1 );
			ComponentSetSelected( markerRing, 1 );
		}
	}
	
	/* Function to update a text component with the radius of a diffraction ring. */
	void updateRadius (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			exit(0);
		}
		if(debugMode==true){result("\n\tUpdating Radius...");}
		// void ComponentGetBoundingRect( Component comp, NumberVariable t, NumberVariable l, NumberVariable b, NumberVariable r )
		number measuredRadiusPX, measuredRadiusNM, top, bottom, left, right, scaleX, scaleY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		if(debugMode==true){result("\nmeasuredRadiusPX = " + measuredRadiusPX);}
		scaleX = dataObject.returnViewScale();
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		measuredRadiusNM = measuredRadiusPX * scaleX;
		number measureRadiusAngstrom = 10 / measuredRadiusNM;
		ringRadiusText.TextAnnotationSetText("D-Spacing: " + measuredRadiusNM + " (1/nm)   /   " + measureRadiusAngstrom + " A");
	}
	
	/* Function to set the markerRing to a desired radius (in 1/nm) */
	void setRingRadius (object self, number desiredRadiusNM)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			exit(0);
		}
		number measuredRadiusPX, desiredRadiusPX, top, bottom, left, right, scaleX, scaleY, centreX, centreY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		centreX = right - measuredRadiusPX;
		centreY = bottom - measuredRadiusPX;
		number binningMultiplier = dataObject.getBinningMultiplier();
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = dataObject.returnViewScale();
		desiredRadiusPX = desiredRadiusNM / scaleX;
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		if(debugMode==true){result("\ndesiredRadiusNM: " + desiredRadiusNM + " (1/nm)");}
		
		top = centreY + desiredRadiusPX;
		bottom = centreY - desiredRadiusPX;
		right = centreX + desiredRadiusPX;
		left = centreX - desiredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
	}

	/* Function to put the marker ring back on the central spot and make it circular. */
	void recenterMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			exit(0);
		}
		number top, bottom, left, right, centreX, centreY;
		number binningMultiplier = dataObject.getBinningMultiplier();
		number cameraHeight = dataObject.getCameraHeight();
		number cameraWidth = dataObject.getCameraWidth();
		// Check if calibrated yet. Stop if not.
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		
		centreX = cameraWidth / (2 * binningMultiplier);
		centreY = cameraHeight / (2 * binningMultiplier);
		if(debugMode==true){result("\nCenter of View window = (" + centreX + ", " + centreY + ")");}
			
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		number measuredRadiusPXVertical = (bottom - top) / 2;
		number measuredRadiusPXHorizontal = (right - left) / 2;
		// Pick the largest one.
		number measuredRadiusPX = (measuredRadiusPXVertical > measuredRadiusPXHorizontal) ? measuredRadiusPXVertical : measuredRadiusPXHorizontal;
		if(debugMode==true){result("\nRing radius measured as " + measuredRadiusPX + "px");}
		
		top = centreY + measuredRadiusPX;
		bottom = centreY - measuredRadiusPX;
		right = centreX + measuredRadiusPX;
		left = centreX - measuredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
		if(debugMode==true){result("\nRectangle set to [" + top + ", " + left + ", " + bottom + ", " + right + " ]");}
	}
	

	//****************************************************
	// IMAGING PROCESSES
	//****************************************************
	 
	/* Function to store tilt values and record the spot for later recall
		shadowDistance = distance from the central point (in 1/nm) to perform shadowing. 0 = no shadowing.
		storeTiltOnly (0 or 1) if 1, the function will store the tilt values and then stop without any imaging.
	*/
	void storeTiltCoord (object self, number shadowDistance, number storeTiltOnly) {
		// Check to see if the EM is in diffraction mode.
		if ( (EMGetImagingOpticsMode() == "SAMAG") || (EMGetImagingOpticsMode() == "IMAGING")  || (EMGetImagingOpticsMode() == "MAG1") || (EMGetImagingOpticsMode() == "MAG2")) {
			if (!ContinueCancelDialog( "Switch to diffraction mode before continuing." )){
				Throw( "User aborted process." );
			}
		}			
		Number xTilt, yTilt;
		EMGetBeamTilt(xTilt, yTilt); //Get the current tilt values.
		
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();
		number tracker = dataObject.getTracker();
		number DPExposure = dataObject.getDPExposure();
		image dataArray := dataObject.getDataArray();
		image ReferenceDP = dataObject.getReferenceDP();
		
		if(debugMode==true)
		{
			result("\nStoring the tilt coordinate. Shadowing distance is set to " + shadowDistance + "(1/nm)");
			result("\nstoreTiltOnly = " + storeTiltOnly);
			positionDebugWindow(debugMode);
		}
		
		setpixel(dataArray, tracker, 0, tracker); // spotID
		setpixel(dataArray, tracker, 1, xTilt); // xTilt value
		setpixel(dataArray, tracker, 2, yTilt); // yTilt value
		
		number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
		xTiltRelative = xTilt - xTiltCenter;
		yTiltRelative = yTilt - yTiltCenter;
		setpixel(dataArray, tracker, 3, xTiltRelative);
		setpixel(dataArray, tracker, 4, yTiltRelative);
		
		TagGroup spot = ImageSetTools.addSpotToCurrentImageSet(); // The 1-3 images here will be placed inside the spot group
		
		TagGroup image1Data = imageSetTools.createNewImageForImageSet();
		image1Data.TagGroupSetTagAsString("ImageType", "DP");
		image1Data.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
		image1Data.TagGroupSetTagAsNumber("xTiltRelative", xTiltRelative);
		image1Data.TagGroupSetTagAsNumber("yTiltRelative", yTiltRelative);
		image1Data.TagGroupSetTagAsNumber("xTiltValue", xTilt);
		image1Data.TagGroupSetTagAsNumber("yTiltValue", yTilt);
		image1Data.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
		if(shadowDistance==0){ // SpotID just increases by one each time
			image1Data.TagGroupSetTagAsNumber("ShadowValue", 0);
		} else {
			image1Data.TagGroupSetTagAsNumber("ShadowValue", 1);
		}
		imageSetTools.addImageDataToCurrentSpot(image1Data, "Middle"); // this is the middle image and is added to that tag in the spot taggroup
		
		
		/* old file name generation system is old. adapt it to use the tag lists */
		string fileName, spotID, filePath, timeString;
		if(shadowDistance==0){ // SpotID just increases by one each time
			spotID = PadWithZeroes(tracker,4);
		} else {
			number SpotIDNumber;
			SpotIDNumber = ceil(tracker / 3)
			spotID = PadWithZeroes(SpotIDNumber,4);
		}
		timeString = constructTimeStamp();
		
		if(storeTiltOnly == false) // The image creation + storage parts can be ignored if parameter is set to true.
		{
			// Take new exposure for comparison of pixel movement.
			number cameraWidth, cameraHeight;
			cameraWidth = dataObject.getCameraWidth();
			cameraHeight = dataObject.getCameraHeight();
			
			// Wait for the image to stabilize after moving.
			number OSTickCount = GetOSTickCount();
			number OSTicksPerSecond = GetOSTicksPerSecond();
			number targetTick = OSTickCount + (OSTicksPerSecond);
			while( targetTick > GetOSTickCount()){	// Do nothing
			}
			image newDPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);

			// image1Data.TagGroupSetTagAsNumber("UniqueImageID", ); Not sure how unique image ID works.
			
			// Compare to reference image
			//findImageShift(image refIm, image newIm, number &XShift, number &YShift)
			number XShift, YShift;
			findImageShift(referenceDP, newDPImage, XShift, YShift, debugMode);
			setpixel(dataArray, tracker, 5, XShift);
			setpixel(dataArray, tracker, 6, YShift);
			// Convert the distance travelled to 1/nm
			number pixelDistance = distance(XShift, YShift);
			number scaleX = dataObject.getRefScale();
			number realDistance = pixelDistance * scaleX;
			image1Data.TagGroupSetTagAsNumber("DSpacingAng", convertInverseNMToAngstrom(realDistance));
			
			if(debugMode==true){Result( "\nPattern Distance Shift (1/nm): " + realDistance);}
			// Make a name for the file based on spotID.
			// An image is saved each time a coordinate is taken for later reference.
			// The spotID will link across scripts and references.
			// The format DP_SpotID_NNNN_timestamp is to be used to make auto-save directories read nicely and not write over previous images accidentally.

			fileName = "DP_" + spotID + "_" + timeString;
			
			// Add the real distance as text in the image
			// Add the pixel shift as text in the image
			string textString = "D-Spacing: " + realDistance + " (1/nm)" + "\nPixel Shift: (" + XShift + ", " + YShift + ")";
			// Add text annotations and set their colour, display mode and font
			component textannot=newtextannotation(10,10, textString, 64);
			textannot.componentsetfillmode(2);
			textannot.componentsetdrawingmode(2);
			textannot.componentsetforegroundcolor(1,0,0);
			textannot.componentsetbackgroundcolor(0,0,0);
			textannot.componentsetfontfacename("Microsoft Sans Serif");
			
			showImage(newDPImage) // Images needs to be shown to give it an ImageDisplay, which is needed for attaching components.
			ImageDisplay imgDisplay = newDPImage.ImageGetImageDisplay(0)
			imgDisplay.componentaddchildatend(textannot);
			ImageDocument thisImageDocument = ImageGetOrCreateImageDocument( newDPImage );
			// Save or show the copied image.
			if(debugMode==false)
				{
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileName);
					image1Data.TagGroupSetTagAsString("FileName", fileName);
					image1Data.TagGroupSetTagAsNumber("SavedAsFile", 1);
					self.drawReticle(newDPImage, 0);
					self.cleanReticle(newDPImage);
					SaveAsGatan( newDPImage, filePath );
					ImageDocumentClean(thisImageDocument); // So the window can be closed without asking to be saved
					closeImage(newDPImage);
					positionDebugWindow(debugMode);
					result("\nStored Tilt " + fileName);
				} 
				else
				{
					image1Data.TagGroupSetTagAsNumber("SavedAsFile", 0);
					ImageDocumentClean(thisImageDocument); // So the window can be closed without asking to be saved
					ImageDocumentShow(thisImageDocument); // Display the image document.
					result("\nStore Tilt Function run for " + fileName + ". Tilt value stored (" + xTilt + ", " + yTilt + ")");
					self.drawReticle(newDPImage, 0);
					self.cleanReticle(newDPImage); // Makes it editable.
					positionDebugWindow(debugMode); // Return the View window to the front
				}
		}

		if(shadowDistance!=0)
		{
			//void tiltToPixel(dataObject, number xTilt, number yTilt, number &xPixelShift, number &yPixelShift, number isViewWindow)
			number xTiltShift = xTilt - dataObject.getCentreXTilt();
			number yTiltShift = yTilt - dataObject.getCentreYTilt();
			number xPixelShift, yPixelShift, NMDistance;
			tiltToPixel(dataObject, xTiltShift, yTiltShift, xPixelShift, yPixelShift, 0);
			if(debugMode==true){result("\nBeginning Shadowing.");}
			if(debugMode==true){result("\n\tTilt -> Pixel Shift = (" + xTiltShift + ", " + yTiltShift\
					+ ") -> (" + xPixelShift + ", " + yPixelShift + ")px");}
			NMDistance = distance(yPixelShift, xPixelShift) * dataObject.getRefScale();
			number shadowMultiplier = shadowDistance / NMDistance;
			if(debugMode==true){result("\n\tNMDistance = " + NMDistance);}
			if(debugMode==true){result("\n\tShadowMultiplier = " + shadowMultiplier);}
			
			// Need centre -> Tilt, not just tilt value.
			number shadowXshift = xTiltShift * shadowMultiplier;
			number shadowYshift = yTiltShift * shadowMultiplier;
			if(debugMode==true){result("\n\tShadowXShift (tilt) = " + shadowXshift);}
			if(debugMode==true){result("\n\tShadowYShift (tilt) = " + shadowYshift);}
			
			string fileNameHigher, fileNameLower
			fileNameHigher = "DP_" + spotID + "_" + timeString + "_HIGHER";
			fileNameLower = "DP_" + spotID + "_" + timeString + "_LOWER";
			
			EMChangeTilt(shadowXshift, shadowYshift);
			if(debugMode==1){result("\n\tBeam tilt moved to 1st shadow point.");}
			// Store new beam tilt.
			EMGetBeamTilt(xTilt, yTilt)
			tracker = tracker + 1
			xTiltRelative = xTilt - xTiltCenter;
			yTiltRelative = yTilt - yTiltCenter;
			setpixel(dataArray, tracker, 0, tracker); // spotID
			setpixel(dataArray, tracker, 1, xTilt); // xTilt value
			setpixel(dataArray, tracker, 2, yTilt); // yTilt value
			setpixel(dataArray, tracker, 3, xTiltRelative); // relative xTilt value
			setpixel(dataArray, tracker, 4, yTiltRelative); // relative yTilt value
			
			TagGroup image2Data = imageSetTools.createNewImageForImageSet();
			image2Data.TagGroupSetTagAsString("ImageType", "DP");
			image2Data.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
			image2Data.TagGroupSetTagAsNumber("xTiltRelative", xTiltRelative);
			image2Data.TagGroupSetTagAsNumber("yTiltRelative", yTiltRelative);
			image2Data.TagGroupSetTagAsNumber("xTiltValue", xTilt);
			image2Data.TagGroupSetTagAsNumber("yTiltValue", yTilt);
			image2Data.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
			image2Data.TagGroupSetTagAsNumber("ShadowValue", 2);
			imageSetTools.addImageDataToCurrentSpot(image2Data, "Higher");
			
			if(debugMode==true){result("\n\tStored as Tracker value " + tracker);}
			
			number OSTickCount = GetOSTickCount();
			number OSTicksPerSecond = GetOSTicksPerSecond();
			number targetTick = OSTickCount + (OSTicksPerSecond * DPExposure);
			if(debugMode==true){result("\n\tTickCount = " + OSTickCount + "  TicksperSec = " + OSTicksPerSecond);}
			ImageDocument higherDPView, lowerDPView
			if(storeTiltOnly != true)
			{
				// Wait for one second to let the ccd be exposed
				while( targetTick > GetOSTickCount()){	// Do nothing
				}
				// Update the view image display
				image viewImage;
				if(!returnViewImage(debugMode, viewImage)){
					result("View Image not found. This error should never happen.")
					exit(0);
				}
				UpdateImage( viewImage );
				ImageDocument higherDPView, viewImageDocument;
				if(!returnViewImageDocument(debugMode, viewImageDocument)){
					result("\nImage Document not detected. This error should not be possible.");
					exit(0);
				}
				higherDPView = ImageDocumentClone( ViewImageDocument, 1 );
				ImageDocumentSetName( higherDPView, fileNameHigher ); // Label the new image with the point name.
				ImageDocumentShow(higherDPView)
				higherDPView.ImageDocumentClean(); // So it can be closed easily
				if(debugMode != true){
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileNameHigher);
					ImageDocumentSaveToFile( higherDPView, "Gatan Format", filePath);
					higherDPView.imageDocumentClose(0);
					image2Data.TagGroupSetTagAsString("FileName", fileNameHigher);
					image2Data.TagGroupSetTagAsNumber("SavedAsFile", 1);
				} else {
					image2Data.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
			}
			
			EMChangeTilt((-2 * shadowXshift), (-2 * shadowYshift));
			if(debugMode==1){result("\n\tBeam tilt moved to 2nd shadow point.");}
			// Store new beam tilt
			EMGetBeamTilt(xTilt, yTilt)
			tracker = tracker + 1
			xTiltRelative = xTilt - xTiltCenter;
			yTiltRelative = yTilt - yTiltCenter;
			setpixel(dataArray, tracker, 0, tracker); // spotID
			setpixel(dataArray, tracker, 1, xTilt); // xTilt value
			setpixel(dataArray, tracker, 2, yTilt); // yTilt value
			setpixel(dataArray, tracker, 3, xTiltRelative); // relative xTilt value
			setpixel(dataArray, tracker, 4, yTiltRelative); // relative yTilt value
			
			TagGroup image3Data = imageSetTools.createNewImageForImageSet();
			image3Data.TagGroupSetTagAsString("ImageType", "DP");
			image3Data.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
			image3Data.TagGroupSetTagAsNumber("xTiltRelative", xTiltRelative);
			image3Data.TagGroupSetTagAsNumber("yTiltRelative", yTiltRelative);
			image3Data.TagGroupSetTagAsNumber("xTiltValue", xTilt);
			image3Data.TagGroupSetTagAsNumber("yTiltValue", yTilt);
			image3Data.TagGroupSetTagAsNumber("ShadowDistance", shadowDistance);
			image3Data.TagGroupSetTagAsNumber("ShadowValue", 3);
			imageSetTools.addImageDataToCurrentSpot(image3Data, "Lower");
			
			if(debugMode==1){result("\n\tStored as Tracker value " + tracker);}
			if(storeTiltOnly != 1)
			{
				OSTickCount = GetOSTickCount();
				number targetTick = OSTickCount + (OSTicksPerSecond * DPExposure);
				while( targetTick > GetOSTickCount())	{ // Do nothing
				}
				image viewImage;
				if(!returnViewImage(debugMode, viewImage)){
					result("View Image not found. This error should never happen.")
					exit(0);
				}
				UpdateImage( ViewImage );
				ImageDocument lowerDPView, viewImageDocument;
				if(!returnViewImageDocument(debugMode, viewImageDocument)){
					result("\nImage Document not detected. This error should not be possible.");
					exit(0);
				}
				lowerDPView = ImageDocumentClone( ViewImageDocument, 1 );
				ImageDocumentSetName( lowerDPView, fileNameLower ); // Label the new image with the point name.
				ImageDocumentShow(lowerDPView)
				lowerDPView.ImageDocumentClean(); // So it can be closed easily
				if(debugMode==0)
				{
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileNameLower);
					ImageDocumentSaveToFile( lowerDPView, "Gatan Format", filePath );
					lowerDPView.imageDocumentClose(0);
					image3Data.TagGroupSetTagAsString("FileName", fileNameLower);
					image3Data.TagGroupSetTagAsNumber("SavedAsFile", 1);
				} else {
					image3Data.TagGroupSetTagAsNumber("SavedAsFile", 0);
				}
			}
			dataObject.setTracker(tracker + 1);
		} else {
			dataObject.setTracker(tracker + 1);
		}
	}

	/* Will take a number of images of the DP moved to values in the list of stored points.
		This is to test the tilt calibration and alignment.
	 */
	void takeTestDPImages (object self, number tracker, image dataArray, number DPExposure, number cameraWidth, number cameraHeight, number xTiltCenter, number yTiltCenter){
		number alignmentDPToTake = 6;
		getnumber("How many points should be checked?", alignmentDPToTake, alignmentDPToTake);
		if(alignmentDPToTake > tracker){
			alignmentDPToTake = tracker;
		}
		number i;
		for(i=0; i < alignmentDPToTake; i++){
			number j = i * round(tracker / alignmentDPToTake);
			j = (j==0 ? 1 : j);
			// load the tilt.
			number xTiltTarget = xTiltCenter + getpixel(dataArray, j, 3);
			number yTiltTarget = yTiltCenter + getpixel(dataArray, j, 4);
			moveBeamTilt(xTiltTarget,yTiltTarget);
			
			if ( (EMGetImagingOpticsMode() == "SAMAG") || (EMGetImagingOpticsMode() == "IMAGING") || (EMGetImagingOpticsMode() == "MAG1") || (EMGetImagingOpticsMode() == "MAG2")) {
				if (!ContinueCancelDialog( "Switch to diffraction mode before continuing." )){
					Throw( "User aborted process." );
				}
			}	
			image DPImage;
			DPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
			DPImage.ImageSetName("Alignment Test " + i);
			showImage(DPImage);
		}
		return;
	}

	/* Function to take a DF image by reading from the Data Array */
	image takeDFImage (object self, number tracker, image dataArray, number xTiltCenter, number yTiltCenter,\
			number DFExposure, number cameraWidth, number cameraHeight, number im ){

		number xTiltTarget, yTiltTarget;
		
		// Read xTilt and yTilt from array
		xTiltTarget = xTiltCenter + getpixel(dataArray, im, 3);
		yTiltTarget = yTiltCenter + getpixel(dataArray, im, 4);
		
		// Move the beam tilt to this value.
		moveBeamTilt(xTiltTarget,yTiltTarget);
		string opticsMode = EMGetImagingOpticsMode();
		// Switch to imaging manually if it is not in that mode.
		// "SAMAG" is the name our JEOL2100 uses. VirtualTEM uses "IMAGING". Add your own modes in or replace these ones if your scope is different.
		if (! ( (opticsMode == "SAMAG") || (opticsMode == "IMAGING")  || (EMGetImagingOpticsMode() == "MAG1") || (EMGetImagingOpticsMode() == "MAG2")) ) {
			if(debugMode==true){
				result("\nTakeDFImage() called when EM not in imaging mode. Is in mode: " + EMGetImagingOpticsMode());
			}
			if (!ContinueCancelDialog( "Switch to imaging mode before continuing." )){
				Throw( "User aborted process." );
			}
		}
		
		// Take the Dark field Image
		image DFImage;
		DFImage := sscUnprocessedAcquire(DFExposure,0,0,cameraWidth,cameraHeight);
		return DFImage;
	}


	/* Function to generate the file name for a darkfield image and update the DFList taggroup*/
	string generateDFFileName (object self, number im, number imageID, image dataArray, TagGroup DFList, number shadowing, number debugMode) {
		number spotID = getpixel(dataArray, im, 0);
		if(debugMode){result("\nGenerating File name " + im);}
		string longSpotID;
		string filename;
		if(im == 0){ // The first 0000 image is always the bright field image
			fileName = "BrightField_" + constructTimeStamp();
			DFList.TagGroupSetTagAsNumber( "BaseImage" , imageID );
			return filename;
		}
		if(shadowing == 0){ // Normal way of naming files. Sequential.
			if(debugMode){result("\n\tShadowing is OFF");}
			longSpotID = PadWithZeroes(SpotID, 4);
			fileName = "DarkField_" + longSpotID + "_" + constructTimeStamp();
			// Update the DFList
			string tagPath = "Spot" + longSpotID
			DFList.TagGroupSetTagAsNumber( (tagPath + ":MIDDLE") , imageID )
			return filename;
		}
		else
		{
			 // Shadowing has been selected, so the files will be named after their 'group' and if they are higher or lower.
			if(debugMode==1){result("\nShadowing is ON");}
			number pointNumber, rem;
			pointNumber = floor((im-1) / 3) + 1;
			if(debugMode==1){result("\nPoint Number is " + pointNumber);}
			longSpotID = PadWithZeroes(pointNumber, 4);
			if(debugMode==1){result("\nlongSpotID with 0s: " + longSpotID);}
			
			string tagPath = "Spot" + longSpotID;
			if(!TagGroupDoesTagExist( DFList, tagPath )){
				TagGroup SpotGroup = NewTagGroup(); // the tagGroup that will hold this data and then be attached to the DFList.
				TagGroupCreateNewLabeledTag( SpotGroup, "LOWER" ); // Creates the tag for LOWER data
				TagGroupCreateNewLabeledTag( SpotGroup, "HIGHER" ); // Creates the tag for HIGHER data
				TagGroupCreateNewLabeledTag( SpotGroup, "MIDDLE" ); // Creates the tag for MIDDLE data
				TagGroupAddLabeledTagGroup( DFList, tagPath, SpotGroup );
			}
			
			rem = remainder(im, 3); // 1 for central peak, -1 for higher, 0 for low
			if(debugMode==1){result("\nim is " + im);result("\nRemainder is " + rem);}
			if(rem==(-1)){
				longSpotID = longSpotID + "_HIGHER";
				DFList.TagGroupSetTagAsNumber( (tagPath + ":HIGHER") , imageID ); // sets the ImageID within the HIGHER/LOWER tag
			}
			else if(rem==0)
			{
				longSpotID = longSpotID + "_LOWER";
				DFList.TagGroupSetTagAsNumber( (tagPath + ":LOWER") , imageID ); // sets the ImageID within the HIGHER/LOWER tag
			} else 
			{
				DFList.TagGroupSetTagAsNumber( (tagPath + ":MIDDLE") , imageID ); // sets the ImageID within the MIDDLE tag
			}
			fileName = "DarkField_" + longSpotID + "_" + constructTimeStamp();
			return filename;
		}
		result("\n\ngenerateDFFileName has developed a fault")
		filename = "file " + im;
		return filename;	
	}

	/* Function will use the stored Tilt values to take darkfield images. 1st Image (0000) will be Bright Field of site.
		shadowing = 0 / 1 for the shadowing mode.
		integration = 0 / 1 for if the images should be integrated together
		integrationDistance = number of DP to be integrated together before image is produced
	*/
	void darkFieldImage (object self, number shadowing, number integration, number integrationDistance){
		number tracker = dataObject.getTracker();
		number DPExposure = dataObject.getDPExposure();
		number DFExposure = dataObject.getDFExposure();
		number BFExposure = dataObject.getBFExposure();
		image dataArray = dataObject.getDataArray();
		image ReferenceDP = dataObject.getReferenceDP();
		image ROIList = dataObject.getROIList();
		image startBFImage;
		image integratedImage;
		image sumImage;
		number imageSetID = GetCurrentTime(); // unique ID for this group of images.

		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number xTiltCenter = dataObject.getCentreXTilt();
		number yTiltCenter = dataObject.getCentreYTilt();
		
		if(integration){
		if(debugMode==true){result("\nCreating Integrated Images to populate...");}
			integratedImage = RealImage( "Integrated Image 01", 4, cameraWidth, cameraHeight );
			integratedImage = integratedImage * 0;
			sumImage = RealImage( "Sum of all Integrals", 4, cameraWidth, cameraHeight );
			sumImage = sumImage * 0;
		}
		
		if(debugMode==true){result("\nWorking on TagGroup...");}
		TagGroup DFList = createDFList(tracker, shadowing, integration, integrationDistance);
		/* Tag group format:
		DFList	:	UseImageID
					BaseImage
					Directory
					Spot#### : 	HIGHER
								MIDDLE
								LOWER
		*/
		
		// Set the tag values
		string Directory = GetApplicationDirectory("auto_save", 0);
		DFList.TagGroupSetTagAsString( "Directory" , Directory ); // sets the directory	
		if(debugMode==1){result("\n\tSave directory set.");}
		DFList.TagGroupSetTagAsNumber( "UseImageID" , 1 ); // Is 1 since the images are being created now.
		if(debugMode==1){result("\n\tUseImageID set to 1.");}
		
		Result("\n------------- Starting Dark Field Imaging Process ---------------\n");
		result("\n" + tracker + " images to create, taking " + (DFExposure * tracker / 60) + " minutes.");
		if(debugMode==1){dataObject.printSpotIDArray();}
		
		if (!ContinueCancelDialog( "Insert the Objective Aperture and center it. Switch to Imaging Mode and check the Brightfield image before continuing." )){
			throw("Aborted by User. No data changed.")
		}
		
		// For each targetArrayImage point move the beam there and take an image.
		number im, spotID, imageID;
		for(im=0; im<tracker ;im++){
			// Take the image
			image DFImage := self.takeDFImage ( tracker, dataArray, xTiltCenter, yTiltCenter, DFExposure, cameraWidth, cameraHeight, im );
			if(im==0){
				startBFImage = DFImage;
			}
			// Get image data
			imageID = DFImage.ImageGetID();
			spotID = getpixel(dataArray, im, 0);
			
			// Generate the filename to save the image with.
			string fileName, filePath, longSpotID;
			fileName = self.generateDFFileName(im, imageID, dataArray, DFList, shadowing, debugMode );
			
			// If in Integrated image mode add it to the current integration image and display any completed integrated images.
			if(integration==true){
				integratedImage = integratedImage + DFImage;
				result("\nIntegrating Exposure " + (im + 1) +" of " + tracker);
				if((remainder(im, integrationDistance)==0) || (im == 0)){ // save this integrated image and start a new one.
					sumImage = sumImage + integratedImage;
					image newImage = integratedImage.ImageClone();
					integratedImage.ImageSetName( "Integrated Image " + im );
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					fileName = "Integrated Image " + im;
					filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
					SaveAsGatan(integratedImage, filePath);
					result("\nIntegrated " + integrationDistance + " exposures into Integrated Image " + im);
					integratedImage = integratedImage * 0; // Set old image to 0 for next integration sequence.
					if(debugMode==true){OpenImage(filePath + ".dm3");} // Display the image as well if in debug mode.
				}
			}
			else { // Save the image as a Gatan file or display it if in debug mode.
				if(debugMode==true){
					ImageSetName(DFImage, fileName);
					ShowImage(DFImage);
					ImageDocumentClean(ImageGetOrCreateImageDocument( DFImage )); // So it can be closed easily
					result("\nSingle Exposure " + (im + 1) +" of " + tracker + " completed and displayed as image " + fileName);
				} else {
					string fileDirectory = GetApplicationDirectory("auto_save", 0);
					filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
					SaveAsGatan( DFImage, filePath );
					closeImage( DFImage );
					result("\nSingle Exposure " + (im + 1) +" of " + tracker + " saved as: " + filePath);
				}
			}
			updateAllImages();
		}
		self.beamCentre();
		
		// A bright field image is taken at the end to compare to the start. This can track drift.
		image endBFImage;
		endBFImage := sscUnprocessedAcquire(BFExposure,0,0,cameraWidth,cameraHeight);
		string fileName, filePath, longSpotID;
		longSpotID = "";
		fileName = "End_BrightField_" + constructTimeStamp();
		if(debugMode==true)
		{
			ImageSetName(endBFImage, fileName);
			ShowImage(endBFImage);
			ImageDocumentClean(ImageGetOrCreateImageDocument( endBFImage )); // So it can be closed easily
			result("\nEnding Bright Field exposure displayed as " + filename);
		}
		else
		{
			string fileDirectory = GetApplicationDirectory("auto_save", 0);
			filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
			SaveAsGatan( endBFImage, filePath );
			closeImage( endBFImage );
			result("\nEnding Bright Field exposure saved as: " + filePath);
		}
		// Find the image drift.
		number xShiftBF, yShiftBF;
		findImageShift(startBFImage, endBFImage, xShiftBF, yShiftBF, debugMode);
		result("\nDuring the exposures the image drifted by (" + xShiftBF + ", " + yShiftBF + ") pixels")
		if(integration==true){ //show Sum.
			showImage(sumImage);
			copyTags(sumImage, endBFImage);
			copyScale(sumImage, endBFImage);
		}
		positionDebugWindow(debugMode); //Return View Window to the front if it is not all ready
		Result("\n------------- Ending Dark Field Imaging Process ---------------\n");
		dataObject.setDFList(DFList);
		if(debugMode==true){dataObject.showDFList();} // Used to check on the Tag group when debugging
	}

	/* 	Function that performs the Calibration process
			Take image of the DP for reference when storing.
			Store the central beam as the first data point.
			Calibrate the Tilt Vectors (pixels per tilt unit)
	 */
	 void startDPStoring(object self){
		// Load data from dataObject
		// Not Reference DP. That is set later.
		number tracker = dataObject.getTracker();
		number DPExposure = dataObject.getDPExposure();
		image dataArray := dataObject.getDataArray();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		if(debugMode==true){result("\nstartDPStoring()");}
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			result("\nNo view Image detected. This error should not be possible.");
		}	
		if(tracker!=0){ //("There is Calibration data all ready stored.")
			if(!ContinueCancelDialog( "There is all ready calibration data stores. Would you like to overwrite it?" )){
				return;
			}
		}
		// Set central Tilt values
		dataObject.setCentreTiltHere();
		
		// Take the reference Diffraction Pattern for future use in calculations.
		image ReferenceDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);

		number refScaleX, refScaleY;
		refScaleX = dataObject.getRefScale();
		if(debugMode==true){result("\nrefScaleX: " + refScaleX);}
		if(refScaleX == 0){
			throw("Please set Camera Length");
		}
		ImageSetDimensionScale(ReferenceDP, 0, refScaleX)
		ImageSetDimensionUnitString(ReferenceDP, 0, "1/nm" )
		ImageSetDimensionScale(ReferenceDP, 1, refScaleX)
		ImageSetDimensionUnitString(ReferenceDP, 1, "1/nm" )	
		
		// Calculate the binning of the view screen
		number viewSizeX, viewSizeY, refSizeX, refSizeY;
		getSize(viewImage, viewSizeX, viewSizeY )
		getsize(ReferenceDP, refSizeX, refSizeY )

		number binning = refSizeX / viewSizeX;
		dataObject.setBinningMultiplier(binning);
		if(debugMode==true){result("\n\tBinning set to " + binning);}
		referenceDP.SetName("Reference Diffraction Pattern");
		
		// Load the reference image into the dataObject
		if(debugMode==true){result("\nNow Setting ReferenceDP in the DataObject...");}
		dataObject.setReferenceDP(ReferenceDP);
		
		number oldTracker = dataObject.getTracker();
		dataObject.setTracker(0);
		
		// Store the tilt etc. as the 0 value in the array image.
		if(debugMode==1){result("\nNow Storing Centre Tilt Coords... ");}
		// self.storeTiltCoord(0, 0); // This is the old code, but for calibration we need to do things differently and fill out the correct tag groups.
		number xTilt, yTilt;
		EMGetBeamTilt(xTilt, yTilt);
		number xTiltRelative = 0;
		number yTiltRelative = 0;
		setpixel(dataArray, 0, 0, 0);
		setpixel(dataArray, 0, 1, xTilt); // xTilt value
		setpixel(dataArray, 0, 2, yTilt); // yTilt value
		setpixel(dataArray, 0, 3, xTiltRelative); // relative xTilt value
		setpixel(dataArray, 0, 4, yTiltRelative); // relative yTilt value
		dataObject.setTracker( 1 );
		if(debugMode==1){result(" Done");}
		
		if(oldTracker != 0){ // reset tracker so stored spots are accessible
			dataObject.setTracker( oldTracker ); 
		}
		
		if(xTiltVectorX != 0){
			result("\nCurrent Tilt Vector settings are:");
			result("\n\txTilt(X): " + xTiltVectorX);
			result("\n\txTilt(Y): " + xTiltVectorY);
			result("\n\tyTilt(X): " + yTiltVectorX);
			result("\n\tyTilt(Y): " + yTiltVectorY);
			/*Boolean TwoButtonDialog( String prompt, String acceptLabel, String rejectLabel )*/
			if(TwoButtonDialog("Use existing tilt values?", "Yes", "No")){
				printCommands();
				return;
			}
		}
		
		number centreXTilt = dataObject.getCentreXTilt();
		number centreYTilt = dataObject.getCentreYTilt();
		/* This part gets the tilt vectors. */
		// X TILT
		result("\n\n\tPlease move the pattern to the approximate d-spacing you will be imaging using the X-TILT control.");
		if (!ContinueCancelDialog( "Please move the pattern to the approximate d-spacing you will be imaging using the X-TILT control." )){
			Throw( "User abort." );
		}
		result("\nStoring X-Tilt pattern...");
		image xTiltDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
		number xTiltPixelShiftX, xTiltPixelShiftY, xTiltShiftX, xTiltShiftY;
		EMGetBeamTilt(xTiltShiftX,xTiltShiftY);
		xTiltShiftX = xTiltShiftX - centreXTilt;
		findImageShift(ReferenceDP, xTiltDP, xTiltPixelShiftX, xTiltPixelShiftY, debugMode);
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
		
		self.beamCentre();
		
		// Y TILT
		Result("\n\n\tPlease move the pattern to the approximate d-spacing you will be imaging using the Y-TILT control.")
		if (!ContinueCancelDialog( "Please move the pattern to the approximate d-spacing you will be imaging using the Y-TILT control." )){
			Throw( "User abort." );
		}
		result("\nStoring Y-Tilt pattern...");
		image yTiltDP := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
		number yTiltPixelShiftX, yTiltPixelShiftY, yTiltShiftX, yTiltShiftY;
		EMGetBeamTilt(yTiltShiftX,yTiltShiftY);
		yTiltShiftY = yTiltShiftY - centreYTilt;
		findImageShift(ReferenceDP, yTiltDP, yTiltPixelShiftX, yTiltPixelShiftY, debugMode);
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
		self.beamCentre();
		TagGroup vectors = NewTagGroup();
		vectors.TagGroupCreateNewLabeledTag("xTiltx");
		vectors.TagGroupCreateNewLabeledTag("xTilty");
		vectors.TagGroupCreateNewLabeledTag("yTiltx");
		vectors.TagGroupCreateNewLabeledTag("yTilty");
		vectors.TagGroupSetTagAsNumber("xTiltx", xTiltVectorX);
		vectors.TagGroupSetTagAsNumber("xTilty", xTiltVectorY);
		vectors.TagGroupSetTagAsNumber("yTiltx", yTiltVectorX);
		vectors.TagGroupSetTagAsNumber("yTilty", yTiltVectorY);
		dataObject.setTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		dataObject.setTiltVectorCalibrations(dataObject.getCameraLength(), vectors);
		result("\nCalibration Complete.");
		printCommands();
	}

	//****************************************************
	// ENTIRE RING IMAGING FUNCTIONS
	//****************************************************

	/* Finds the level of brightness needed to filter out the less bright pixels
		Values to customize in this function:
		targetPercentage = The % of total counts at which brightness is declared. e.g. 99 will return the brightness level that includes only the top 1% brightest pixels.
	*/
	number findBackgroundBrightness (object self, image thisImage, number targetPercentage)
	{
		string imageName = thisImage.ImageGetName()
		if(debugMode==true){result("\nStarting background brightness search for top " + targetPercentage + "% brightest pixels in " + imageName + "... ");}
		number imageHeight, imageWidth;
		getSize(thisImage, imageWidth, imageHeight);
		number minimum = floor(min(thisImage));
		number maximum = ceil(max(thisImage));
		number range = maximum - minimum;
		minimum = round(minimum);
		maximum = round(maximum);
		number n = imageHeight * imageWidth;
		if(debugMode==true){result("\nThis Image has " + n + " pixels ranging from " + minimum + " to " + maximum + " in brightness.");}
		number justBlack; // do not count pixels if they are simply black because they have been added by the alignment system
		image processImage = BinaryImage ("Checking for black pixels", imageWidth, imageHeight );
		processImage = tert ( (thisImage == 0), 1, 0 );
		justBlack = sum(processImage);
		if(debugMode==true){result("\nThere are " + justBlack + " black pixels in the image. These will not be counted in the thresholding.");}
		
		number targetNumber = ((100 - targetPercentage) / 100) * (n - justBlack)
		if(debugMode==true){result("\nTarget number of pixels for " + (100 - targetPercentage) + "% is " + targetNumber);}
		number highLevel = maximum;
		number lowLevel = minimum;
		number found = 0;
		number timeCheck = 0;
		while( (found==0) && (timeCheck < 50) ){
			number newLevel = floor(lowLevel + ( (highLevel - lowLevel) / 2 )); // half way between, but still integer
			image processImage = BinaryImage ("Processing Level " + newLevel, imageWidth, imageHeight );
			processImage = tert ( (thisImage > newLevel), 1, 0 );
			number count = sum(processImage);
			if(count >= targetNumber){
				lowLevel = newLevel;
			} else {
				highLevel = newLevel;
			}
			if( (highLevel - lowLevel) <= 2){
				found = 1;
			}
			timeCheck ++
		}
		if(debugMode==true){result("\nLevels found are " + lowLevel + " and " + highLevel);}
		if(debugMode==true){result("\n" + targetPercentage + "% of the pixels are below " + highLevel + " in brightness.");}
		if(debugMode==true){result(lowLevel);}
		return lowLevel;
	}

	 /* Function to return the radius of the marker ring in pixels for unbinned images */
	 number markerRingRadius(object self)
	 {
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number binning = dataObject.getBinningMultiplier();
		number beamPixelCentreX, beamPixelCentreY, tiltVectorX, tiltVectorY, targetRadiusPX, scaleX, scaleY;
		scaleX = dataObject.getRefScale(); // Scales for an unbinned image
		scaleY = dataObject.getRefScale(); 
		beamPixelCentreX = cameraWidth / 2;
		beamPixelCentreY = cameraHeight / 2;
		
		number top, bottom, left, right;
		markerRing.ComponentGetRect(top, left, bottom, right );
		if(debugMode==true){result("\nRing rectangle: " + top + ", " + left + ", " + bottom + ", " + right);}
		
		targetRadiusPX = ( right - left )/2;
		if(debugMode==true){result("\nRing radius measured as: " + targetRadiusPX + "px");}
		targetRadiusPX = targetRadiusPX * binning;
		if(debugMode==true){result("\nAt full scale this is: " + targetRadiusPX + "px");}
		return targetRadiusPX;
	 }
	 
	/* Function to take a pixel radius and load the calculated tilt coordinates into the data array
		returns the number of points used, since this is useful to other functions.
	*/
	void loadRingPoints (object self, number radiusPX, number shadowDistanceNM, number &numberOfPoints )
	{
		// Load data from dataObject
		if(debugMode==true){result("\nStarting to load Ring Data Points.");}
		number DPExposure = dataObject.getDPExposure();
		number DFExposure = dataObject.getDFExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number binning = dataObject.getBinningMultiplier();
		number beamCentreX = dataObject.getCentreXTilt();
		number beamCentreY = dataObject.getCentreYTilt();
		image dataArray := dataObject.getDataArray();
		if(debugMode==true){result("\n\tData Object loaded into variables.");}

		// If not calibrated stop here!
		if((xTiltVectorX==0) && (xTiltVectorY==0) && (yTiltVectorX==0) && (yTiltVectorY==0)){
			throw("Please perform the tilt calibration first.")
		}
		
		numberOfPoints = 360; // Not using shadowing yet. (Spend 10s at each 1° angle = 1hr.)
								// Will be changed below, but default option is 360.

		if(!getNumber("How many measurements should be taken?", numberOfPoints, numberOfPoints)){
			throw("Cancelled by User");
		}
		if(debugMode==true){result("\n\tNumber of points is " + numberOfPoints);}
		if(numberOfPoints<=0){
			throw("Wrong number of points.");
		}
		number angleStep = 360 / numberOfPoints; // each reading will be taken this many degrees apart. Converted to Radians later.
		// alpha is angle between X axis and TiltX axis in radians.
		number Px, Py, alpha;
		alpha = atan2(xTiltVectorY, xTiltVectorX);
		// tiltVectorX is the tilt needed to reach the target radius using only xTilt
		number tiltVectorX
		if(debugMode==true){result("\nTiltVectorX Calculation values:");}
		if(debugMode==true){result("\n\tRadiusPX: " + radiusPX);}
		if(debugMode==true){result("\n\tRadiusPX ^ 2: " + radiusPX**2);}
		if(debugMode==true){result("\n\txTiltVectorX: " + xTiltVectorX);}
		if(debugMode==true){result("\n\txTiltVectorX ^ 2: " + xTiltVectorX**2);}
		if(debugMode==true){result("\n\ttan(alpha): " + tan(alpha));}
		if(debugMode==true){result("\n\ttan(alpha) ^ 2: " + tan(alpha)**2);}
		if(debugMode==true){result("\n\tTiltVectorX ^ 2: " + radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ));}
		tiltVectorX = sqrt( radiusPX**2 / ( xTiltVectorX**2 * (1 + tan(alpha)**2 ) ) );
		if(debugMode==true){
			result("\nAlpha for tiltVectorX: " + alpha );
			result("\ntan (alpha): " + tan(alpha) );
			result("\ntiltVectorX = " + tiltVectorX);
		}
		number averageTiltVector = tiltVectorX; // Would use an average of X and Y vectors, but geometry is broken. Just using X.
		
		number estimatedTime = numberOfPoints * DFExposure / 60;
		if (!ContinueCancelDialog( "Complete darkfield imaging of this ring will take approximately " + estimatedTime + " minutes. Would you like to target these points?" )){
			throw("Cancelled by User");
		}
		result("\nGenerating Tilt coordinates...");

		number i, angleToMove, tiltX, tiltY;
		number tiltXHigher, tiltYHigher, tiltXLower, tiltYLower, extraTilt;
		for(i=0; i < numberOfPoints; i++){
			number tracker = dataObject.getTracker()
			angleToMove = i * angleStep; // This is in Degrees.
			angleToMove = angleToMove * pi() / 180; // converted to radians
			
			// work out change in tilt to get there.
			tiltX = beamCentreX + (averageTiltVector * sin(angleToMove));
			tiltY = beamCentreY + (averageTiltVector * cos(angleToMove));
			if(debugMode==true){result("\n\ti: " + i);}
			if(debugMode==true){result("\n\tAngleToMove: " + angleToMove);}
			if(debugMode==true){result("\n\tsin(angle): " + sin(angleToMove));}
			if(debugMode==true){result("\n\tcos(angle): " + cos(angleToMove));}
			if(debugMode==true){result("\n\tAdditional TiltX: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\tAdditional TiltY: " + (averageTiltVector * sin(angleToMove)));}
			if(debugMode==true){result("\n\t---------");}
			
			setpixel(dataArray, tracker, 0, tracker); // spotID
			setpixel(dataArray, tracker, 1, tiltX); // xTilt value
			setpixel(dataArray, tracker, 2, tiltY); // yTilt value
		
			number xTiltRelative, yTiltRelative; // tilt values relative to centre tilt
			xTiltRelative = tiltX - beamCentreX
			yTiltRelative = tiltY - beamCentreY;
			setpixel(dataArray, tracker, 3, xTiltRelative);
			setpixel(dataArray, tracker, 4, yTiltRelative);

			tracker += 1;
			dataObject.setTracker(tracker);
			if(remainder(i,60)==0){ //This part just puts a '.' every 60 calculations as a crude progress bar.
				result("\n");
			} else {
				result(".");
			}
		}
		result("\nTilt coordinates have been generated for darkfield imaging");
	 }

	/* Function to check the ring coordinates before imaging begins.
		angleStep = angleStep size used to generate tilt coordinates. This controls which coordinates will be used.
		e.g. if a step size of 2° was used it will only have 180 coordinates.
	*/
	void imageRingDP (object self, number angleStep)
	{
		image dataArray := dataObject.getDataArray();
		number DPExposure = dataObject.getDPExposure();
		number xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY;
		dataObject.getTiltVectors(xTiltVectorX, xTiltVectorY, yTiltVectorX, yTiltVectorY);
		number cameraWidth = dataObject.getCameraWidth();
		number cameraHeight = dataObject.getCameraHeight();
		number binning = dataObject.getBinningMultiplier();
		number beamCentreX = dataObject.getCentreXTilt();
		number beamCentreY = dataObject.getCentreYTilt();
		number tracker = dataObject.getTracker(); // This is the # of points recorded.
				
		number i
		number numberOfPoints = 8; // can be changed to provide more or less
		for(i=0; i < numberOfPoints; i++){
			number j = 1 + (round(tracker / numberOfPoints) * i); // the index of the value in the data array to use
			// Load coordinates from dataArray
			number tiltXRelative = getPixel( dataArray, j, 3)
			number tiltYRelative = getPixel( dataArray, j, 4)
			// Move there
			moveBeamTilt( tiltXRelative + beamCentreX, tiltYRelative + beamCentreY );
			// Take image
			image DPImage := sscUnprocessedAcquire(DPExposure,0,0,cameraWidth,cameraHeight);
			string fileName = "Ring at " + (i * angleStep) + " deg"
			DPImage.ImageSetName(fileName);
			showImage(DPImage);
			number refScaleX = dataObject.getRefScale(); // Fix the image's scale for future use.
			ImageSetDimensionScale(DPImage, 0, refScaleX)
			ImageSetDimensionUnitString(DPImage, 0, "1/nm" )
			ImageSetDimensionScale(DPImage, 1, refScaleX)
			ImageSetDimensionUnitString(DPImage, 1, "1/nm" )	
			self.drawReticle(DPImage, 0); // add the reticle so that the exact spot targetted can be seen
			self.cleanReticle(DPImage); // clean it so the reticle etc can be editted later.
			DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // Image can be closed without saving warning.
			if(debugMode==false){ // save the images if debugmode is off.
				string fileDirectory = GetApplicationDirectory("auto_save", 0);
				string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
				SaveAsGatan( DPImage, filePath );
				DPImage.ImageGetOrCreateImageDocument().ImageDocumentClean(); // just added
				closeImage( DPImage );
			}
		}
		self.beamCentre();
	}
 
	//****************************************************
	// BINARY IMAGE PROCESSING FUNCTIONS
	//****************************************************

	// Returns a binary image that has been thresholded and despeckled.
		// thisImage = input image
		// targetPercentage = The percentage of the pixels that will be ignored, based on their brightness.
			// e.g. 99 would select only the brightest 1% of pixels to appear on the map.
	image levelAndDespeckleImage(object self, image thisImage, number targetPercentage)
	{
		image originalImage = thisImage; // make copy to avoid affecting original image
		number xsize, ysize;
		number xMin, yMin, xMax, yMax, minimum, maximum; // for debug
		getSize(originalImage, xsize, ysize);
		number dataType = ImageGetDataType( originalImage );
		// the image should be the type directly from the microscope. Tthis is integer, 4 bytes, unsigned.
		if(dataType!=7){
			ImageChangeDataType(originalImage, 7);
		}

		// Find the brightness level to isolate the desired data.
		number Threshold = self.findBackgroundBrightness(originalImage, targetPercentage);

		image binImage = tert( ( originalImage > Threshold), 1 , 0 );
		
		ImageChangeDataType(binImage, 2); // change to real image to do median work for despeckle.
		image despeckledImage = MedianFilter( binImage, 3, 3 );
		
		number despecThreshold = 0.34 // The threshold used to remove the speckles. 0.34 = needs 3 adjacent pixels
		/* The mean of the nearest 9 pixels needs to be:
			Sum of Pixels	Mean value
				9				1
				8				0.888
				7				0.777
				6				0.666
				5				0.555
				4				0.444
				3				0.333
				2				0.222
				1				0.111
				0				0
		*/

		image mapImage = tert( despeckledImage < despecThreshold, 0 , 1 );
		ImageChangeDataType(mapImage, 14); // change to Binary image
		return mapImage;
	}

	/* Function to convert binary image into RGBA image for editting by external software
		The transparency does not work at the moment but I am using it anyway for possible future solutions.
		Saves the image as a Gif file which is usually about 6Kb in size. Nice and small, and why I did not use Tiffs.
	*/
	void transparencyExport(object self, image &binaryImage, string saveDirectory)
	{
		number width, height;
		GetSize(binaryImage, width, height);
		string imageName = ImageGetName(binaryImage);
		image transparencyImage = RGBImage( imageName, 4, width, height );
		//RGBNumberExpression rgba( RealNumberExpression red, RealNumberExpression green, RealNumberExpression blue, RealNumberExpression alpha )
		transparencyImage = rgba(binaryImage * 255, binaryImage * 255, binaryImage * 255, binaryImage * 255);
		string filePath = PathConcatenate (saveDirectory, imageName );
		SaveAsGif( transparencyImage, filePath );
	}

	/* Create a map using aligned binaries and an aligned bright field image. List all images by ID in an imageList*/
	image createMap(object self, Taggroup imageList){
		image originalBaseImage, image2;
		if(!GetTwoImagesWithPrompt("Select the Bright Field Image", "Choose Base Image", originalBaseImage, image2 )){
			exit(0);
		}
		number width, height, baseImageID;
		baseImageID = originalBaseImage.ImageGetID();
		GetSize(originalBaseImage, width, height);
		string baseImageName = ImageGetName(originalBaseImage);
		string mapImageName = baseImageName + " Composite Map";
		image compositeImage = RGBImage( mapImageName, 4, width, height );
		// Set thresholds using display settings for base image
		imageDisplay baseImageDisplay = originalBaseImage.ImageGetImageDisplay(0);
		number minCon, maxCon;
		BaseImageDisplay.ImageDisplayGetContrastLimits(minCon, maxCon);
		number range = maxCon-minCon;
		number scaleFactor = 255 / range
		result("\nMinCon = " + minCon + ", MaxCon = " + maxCon);
		result("\nScale Factor = " + scaleFactor + ", Range = " + range);
		image baseImage = tert( (originalBaseImage < minCon), minCon, originalBaseImage);
		baseImage = tert( (originalbaseImage > maxCon), maxCon, baseImage);
		baseImage = baseImage - minCon;
		showImage(baseImage);
		
		compositeImage = rgb(baseImage*scaleFactor, baseImage*scaleFactor, baseImage*scaleFactor);
		showImage(compositeImage);
		result("\nmaking composite image map from a set of images...")
		number totalImages = taggroupcounttags(imageList);
		result("\n\tFound " + totalImages + " images.");
		number i;
		rgbNumber mapColor = rgb(255,0,0);
		for(i=0; i < totalImages; i++){
			number ImageID
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			if(ImageID == baseImageID){
				continue; // It is the base image, ignore it.
			}
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			number dataType = ImageGetDataType( thisImage );
			// the image should be a binary type. DM will open gifs as an integer image but not set it to binary automatically.
			if(dataType!=14){
				ImageChangeDataType(thisImage, 14); // change to Binary image
			}
			compositeImage = tert( (thisImage==1), mapColor, compositeImage );
			compositeImage.SetName(mapImageName);
			copyTags(compositeImage, originalBaseImage);
			copyScale(compositeImage, originalBaseImage);
		}
		showImage(compositeImage);
		result("\nComposite map generated.")
	}
	
	/* This function creates a tag group to be processed further by other image processing functions.
		returns DFList tag group formatted as so
			DFList	:	UseImageID
						BaseImage
						Directory
						Spot#### : 	HIGHER
									MIDDLE
									LOWER	
	 */
	TagGroup makeDFFileListGroup(object self)
	{
		string newDir;
		TagGroup DFList = NewTagGroup();
		if(!SaveAsDialog("","Press Save to select this directory", newDir))
		{
			throw("User cancelled operation: No directory selected");
		}
		
		//string PathExtractDirectory( string path, number path_type )
			// returns the directory portion of the given path according to the path_type parameter. The path_type variable should be 0.
		newDir = PathExtractDirectory( newDir, 0 ); // newDir is now the directory path
		if(debugMode==true){result("\nDirectory '" + newDir + "' selected.");}
		TagGroupCreateNewLabeledTag( DFList, "Directory" ); // Creates the tag for the file directory
		DFList.TagGroupSetTagAsString( "Directory" , newDir ); // sets the directory
		TagGroupCreateNewLabeledTag( DFList, "UseImageID" ); // Creates the tag for UseImageID tag.
		DFList.TagGroupSetTagAsNumber( "UseImageID" , 0 ); // Must be 0 since it is a file list looking in a directory.
		TagGroupCreateNewLabeledTag( DFList, "ShadowMode" ); // Creates the tag for the shadowing mode. 0 = off, 1 = on.
		
		//TagGroup GetFilesInDirectory( string directory_name, number search_flags )
			// returns a list of string tags with the files in directory_name.
			// The search_flags parameter can be a 1 to include only files; 2 to include only directories; or 3 to include both files and directories.
		TagGroup fileList = GetFilesInDirectory(newDir, 1);
		// The tag list is indexed from 0 and each entry has an entry called "Name"
		Number fileListLength = taggroupcounttags(fileList)
		if(debugMode==true){result("\nLength of fileList: " + fileListLength);}
		number i
		string fileName
		TagGroup fileGroup
		for(i=0; i < fileListLength; i++){
			if(debugMode==true){result("\nFile " + i + "...");}
			// Boolean TagGroupGetIndexedTagAsTagGroup( TagGroup tagGroup, Number index, TagGroup subGroup )
			fileList.TagGroupGetIndexedTagAsTagGroup(i, fileGroup )
			fileGroup.TagGroupGetTagAsString( "Name", fileName )
			if(debugMode==true){Result("\n\tFilename: " + fileName );}
				//File Name format: DarkField_####_[HIGHER/LOWER]_[#######]_[######]_[#####].dm#
			number stringLength = fileName.len()
			number namePartOneIndex = fileName.find("_"); // DarkField or BrightField
			string namePartOne = fileName.left(namePartOneIndex);
			if(debugMode==true){result("\n\tName part one: " + namePartOne);}
			namePartOne = namePartOne.StringToLower();
			if(namePartOne == "brightfield"){
				if(debugMode==true){result("\n\tBrightfield image detected.");}
				TagGroupCreateNewLabeledTag( DFList, "BaseImage" );
				DFList.TagGroupSetTagAsString( "BaseImage" , fileName );
				continue;
			}
			if(namePartOne == "dp"){
				if(debugMode==true){result("\n\tDiffraction Pattern image detected.");}
				continue;
			}
			if(namePartOne != "darkfield"){
				if(debugMode==true){result("\n\tUnknown image detected.");}
				continue;
			}
			string namePartTwo = fileName.right(stringLength - namePartOneIndex - 1); // Get rid of first part
			if(debugMode==true){result("\n\tName part two (first step): " + namePartTwo);}
			number namePartTwoIndex = namePartTwo.find("_"); // The Spot ID number (should be 4 characters)
			if(debugMode==true){result("\n\tName part two (index): " + namePartTwoIndex);}
			if(namePartTwoIndex == -1){
				namePartTwoIndex = namePartTwo.find(".");
			}
			namePartTwo = namePartTwo.left(namePartTwoIndex);
			if(debugMode==true){result("\n\tSpotID: " + namePartTwo);} // This is the Spot ID
			string namePartThree	// Could be HIGHER_.../LOWER_... or just "dm3"
			namePartThree = fileName.right(stringLength - namePartOneIndex - namePartTwoIndex - 2); // Get rid of the other parts
			if(debugMode==true){result("\n\tName part three (first step): " + namePartThree);}
			number namePartThreeIndex = namePartThree.find("_");
			if(debugMode==true){result("\n\tName part three (index): " + namePartThreeIndex);}
			if(namePartThreeIndex == -1){ //No '_' detected.
				namePartThreeIndex = namePartThree.find(".");
				if(namePartThreeIndex == -1){ //No '.' detected.
					// namePartThreeIndex = ""; // is blank
				} else {
					namePartThree = namePartThree.left(namePartThreeIndex);
				}
			}
			if(debugMode==true){result("\n\tPart 3: " + namePartThree);}
			
			// Record the information in a tag group of the format:
			// 	DFList:Spot####:Higher/Lower/Middle (#### is spot ID)
			string tagPath = "Spot" + namePartTwo
			if(!TagGroupDoesTagExist( DFList, tagPath )){
				// Is higher or lower, so add to list to multiply.
				TagGroup SpotGroup = NewTagGroup(); // the tagGroup that will hold this data and then be attached to the DFList.
				TagGroupCreateNewLabeledTag( SpotGroup, "LOWER" ); // Creates the tag for LOWER data
				TagGroupCreateNewLabeledTag( SpotGroup, "HIGHER" ); // Creates the tag for HIGHER data
				TagGroupCreateNewLabeledTag( SpotGroup, "MIDDLE" ); // Creates the tag for MIDDLE data
				TagGroupAddLabeledTagGroup( DFList, tagPath, SpotGroup );
			}
			
			if(namePartThree.left(1).StringToLower() == "h"){
				DFList.TagGroupSetTagAsString( (tagPath + ":HIGHER") , fileName ); // sets the filename within the HIGHER/LOWER tag
			}
			else if(namePartThree.left(1).StringToLower() == "l")
			{
				DFList.TagGroupSetTagAsString( (tagPath + ":LOWER") , fileName ); // sets the filename within the HIGHER/LOWER tag
			}
			else
			{
				DFList.TagGroupSetTagAsString( (tagPath + ":MIDDLE") , fileName ); // sets the MIDDLE tag
			}
		}
		// Set the shadowing mode by looking for Higher / Lower images
		number shadowMode = 0;
		number shadowCount = taggroupcounttags(DFList)
		for(i=0; i < shadowCount; i++){
			string tagPath
			string filePath
			string shadowLabel = DFList.TagGroupGetTagLabel( i )
			if(shadowLabel.left(4) == "Spot"){
				tagPath = shadowLabel + ":LOWER"
				DFList.TagGroupGetTagAsString(tagPath, filePath);
				if(filePath != "0"){
					result("\nShadow Images Confirmed.")
					shadowMode = 1;
					break;
				}
			}
		}
		DFList.TagGroupSetTagAsNumber( "ShadowMode" , shadowMode );
		if(debugMode==true){DocumentWindow tagViewWindow = TagGroupOpenBrowserWindow( DFList, 0 );} // Used to check on the Tag group when debugging
		// The taggroup DFList now contains the files that need to be multiplied together.
		return DFList;
	}

	/* This function will take a TagGroup of stored images and then process them based on the input arguments.
		The input TagGroup is the output of makeDFFileListGroup()
		useShadowImages 0/1 - use the shadowing method. This will only use the higher/lower images of a darkfield set. If 0 it will only use the Middle images.
		makeBinaries 0/1 - Run the levelAndDespeckleImage() function on the images before addition or multiplication. If set to 0 it assumes the input images are all ready binaries.
		targetPercentage - number. The % of the dimmest pixels to be removed. 99 is generally used. Is the input for levelAndDespeckleImage function.
		DisplayImages 0/1 - show binary images on screen after processing
		SaveImages 0/1/2 - 	2 = Will automatically save binary images, shadow images and summed images to a directory.
							1 = Will save binaries and summed images (not individual shadowed binaries)
							0 = Will not save anything
			If DisplayImages and SaveImages are both 0 then only the sum total image will be returned and the others will be lost.
		ExportImages 0/1/2 - 	0 = no additional action
								1 = save any binary images that are saved in gatan format in gif format as well.
								2 = save ALL binary images produced as gif format as well.
		debugMode 0/1 - Lots of feedback.
		
	*/
	image processDarkFieldImages(object self, TagGroup DFList, number useShadowImages, number makeBinaries, number targetPercentage,\
			number DisplayImages, number SaveImages, number ExportImages ){
		if( ( DisplayImages != 1) && ( DisplayImages != 0 ) ){
			throw("DisplayImages parameter not set correctly");
		}
		if( ( SaveImages != 1) && ( SaveImages != 0 ) && ( SaveImages != 2) ){
			throw("SaveImages parameter not set correctly");
		}
		if( ( makeBinaries != 1) && ( makeBinaries != 0 ) ){
			throw("makeBinaries parameter not set correctly");
		}
		if( ( useShadowImages != 1) && ( useShadowImages != 0 ) ){
			throw("useShadowImages parameter not set correctly");
		}
		if( ( targetPercentage < 0) || ( targetPercentage > 100 ) ){
			throw("targetPercentage parameter not set correctly");
		}
		result("\nProcessing a set of Darkfield Images.");
		if(debugMode==true){
			result("Parameters set as:" + \
			"\n\tuseShadowImages: " + useShadowImages + \
			"\n\tmakeBinaries: "+ makeBinaries + \
			"\n\ttargetPercentage: "+ targetPercentage + \
			"\n\tDisplayImages: " + DisplayImages + \
			"\n\tSaveImages: " + SaveImages);
		}

		number UseImageID; // 0/1 for if the images are referenced with file paths or imageID numbers.
		DFList.TagGroupGetTagAsNumber("UseImageID", UseImageID);
		if(debugMode==true){result("\n\tUseImageID: " + UseImageID);}
		string directory;
		DFList.TagGroupGetTagAsString("Directory", directory);
		if(debugMode==true){result("\n\tDirectory selected: " + directory);} // Directory can be used for just saving if not loading
		string saveDirectory; // directory to save the images in.
		string subdirectoryName; // subdirectory to save processed images inside.
		subdirectoryName = (useShadowImages == 1) ? ("shadowed_" + constructTimeStamp()) : ("Not_shadowed_" + constructTimeStamp());
		if((SaveImages != 0) || (ExportImages != 0)){ // will need to make a subdirectory
			saveDirectory = PathConcatenate ( directory, subdirectoryName )
			createDirectory(saveDirectory);
		}	
		
		number cameraWidth, cameraHeight;
		sscgetsize(cameraWidth, cameraHeight);
		image binarySum; // image that each binary image will be added to.
		binarySum = IntegerImage( "Binary Sum", 1, 0, cameraWidth, cameraHeight );
		binarySum.ImageSetName("Binary Sum " + constructTimeStamp());
		string binarySumFileName, binarySumFilePath

		number totalSpots, i;
		totalSpots = taggroupcounttags(DFList);
		
		image RefIm;
		number RefImStored = 0; // save an image for later use.
		
		// Go to each 'Spot' set.
		for(i=0;i<totalSpots;i++)
		{
			image binaryImage;
			String label = DFList.TagGroupGetTagLabel( i ); // Will be of format Spot#### if a spot set.
			if(label.left(4) != "Spot"){
				if(debugMode==true){result("\n" + label + " is not a spot set");}
				continue;
			}
			string tagPathToLower = label + ":LOWER"; // will be of format: ID or file path
			string tagPathToHigher = label + ":HIGHER";
			string tagPathToMiddle = label + ":MIDDLE";
			
			if(debugMode==true){
				result("\ntagPathToLower: " + tagPathToLower);
				result("\ntagPathToHigher: " + tagPathToHigher);
				result("\ntagPathToMiddle: " + tagPathToMiddle);
			}
			
			if(useShadowImages==1){
				// Reference the two images to multiply together.
				image higherImage, lowerImage;
				if(UseImageID){
					number imageIDLower, imageIDHigher;
					imageIDLower = DFList.TagGroupGetTagAsNumber(tagPathToLower, imageIDLower);
					imageIDHigher = DFList.TagGroupGetTagAsNumber(tagPathToHigher, imageIDHigher);
					
					lowerImage = GetImageFromID( imageIDLower );
					higherImage = GetImageFromID( imageIDHigher );
					if(lowerImage.ImageIsValid() == 0){
						throw("Lower Image not found by ID");
					}
					if(higherImage.ImageIsValid() == 0){
						throw("Higher Image not found by ID");
					}
				}
				else // Use filepaths
				{
					string lowerImagePath, higherImagePath;
					DFList.TagGroupGetTagAsString(tagPathToLower, lowerImagePath);
					DFList.TagGroupGetTagAsString(tagPathToHigher, higherImagePath);
					lowerImagePath = PathConcatenate( directory, lowerImagePath);
					higherImagePath = PathConcatenate( directory, higherImagePath);
					if(debugMode==true){result("\nLower File: " + lowerImagePath);}
					if(debugMode==true){result("\nHigher File: " + higherImagePath);}
					
					higherImage := OpenImage ( higherImagePath );
					lowerImage := OpenImage ( lowerImagePath );
					if(lowerImage.ImageIsValid() == 0){
						throw("Lower Image not found by File Path");
					}
					if(higherImage.ImageIsValid() == 0){
						throw("Higher Image not found by File Path");
					}
				}
				// Store an image if needed for referencing later.
				if(!RefImStored){
					RefIm = higherImage;
					RefImStored = 1;
				}
				if(makeBinaries){ // Images need making into binaries first.
					lowerImage := self.levelAndDespeckleImage(lowerImage, targetPercentage);
					higherImage := self.levelAndDespeckleImage(higherImage, targetPercentage);
				}
				lowerImage.ImageSetName(label + "_binary_lower")
				higherImage.ImageSetName(label + "_binary_higher")
				binaryImage = tert( ( ( lowerImage == 1 ) && ( higherImage == 1 ) ), 1, 0 );
				binaryImage.ImageSetName(label + "_binary_shadowed");
				copyTags(binaryImage, lowerImage);
				ImageChangeDataType(binaryImage, 14); // change to Binary image
				if(debugMode==true){
					result("\n\tImages made into Binaries and shadowed.");
				}
				if(DisplayImages==1){ // Show the binary images on the screen. Contrast needs setting to avoid blankness
					showImage(lowerImage);
					showImage(higherImage);
					showImage(binaryImage);
					ImageDisplay lowerImageDisplay = ImageGetImageDisplay( lowerImage, 0 )
					ImageDisplay higherImageDisplay = ImageGetImageDisplay( higherImage, 0 )
					ImageDisplay binaryImageDisplay = ImageGetImageDisplay( binaryImage, 0 )
					lowerImageDisplay.ImageDisplaySetContrastLimits(0,1);
					higherImageDisplay.ImageDisplaySetContrastLimits(0,1);
					binaryImageDisplay.ImageDisplaySetContrastLimits(0,1);
				}
				if(SaveImages != 0){ // save the images to the listed subdirectory unless set to 0
					string binaryFileName, binaryFilePath, lowerFileName, lowerFilePath, higherFileName, higherFilePath;
					binaryFileName = label + "_binary_shadowed"
					binaryFilePath = PathConcatenate ( saveDirectory, binaryFileName )
					SaveAsGatan(binaryImage, binaryFilePath);
					if(SaveImages == 2){
						lowerFileName = label + "_binary_lower"
						lowerFilePath = PathConcatenate ( saveDirectory, lowerFileName )
						SaveAsGatan(lowerImage, lowerFilePath);
						higherFileName = label + "_binary_higher"
						higherFilePath = PathConcatenate ( saveDirectory, higherFileName )
						SaveAsGatan(higherImage, higherFilePath);
					}
				}
				if(ExportImages != 0){
					self.transparencyExport(binaryImage, saveDirectory)
					if(ExportImages == 2){
						self.transparencyExport(lowerImage, saveDirectory)
						self.transparencyExport(higherImage, saveDirectory)
					}
				}
			}
			else 
			{ // Image is not to use the shadowing feature, so just use the middle image
				image middleImage;
				if(UseImageID){
					number imageID
					DFList.TagGroupGetTagAsNumber(tagPathToMiddle, imageID);
					middleImage = GetImageFromID( imageID );
					if(middleImage.ImageIsValid() == 0){
						throw("Image not found by ID method");
					}
				}
				else // Use filepaths
				{
					string ImagePath;
					DFList.TagGroupGetTagAsString(tagPathToMiddle, ImagePath);
					ImagePath = PathConcatenate( directory, ImagePath);
					if(debugMode==true){result("\nImage File: " + ImagePath);}
					
					middleImage := OpenImage ( ImagePath );
					if(middleImage.ImageIsValid() == 0){
						throw("Image not found by File Path method");
					}
				}
				// Store an image if needed for referencing later.
				if(!RefImStored){
					RefIm = middleImage;
					RefImStored = 1;
				}
				if(makeBinaries){ // Image needs making into binary first.
					middleImage := self.levelAndDespeckleImage(middleImage, targetPercentage);
				}
				binaryImage := middleImage;
				binaryImage.ImageSetName(label + "_binary_no_shadow");
				if(DisplayImages){
					showImage(middleImage);
					ImageDisplay middleImageDisplay = ImageGetImageDisplay( middleImage, 0 )
					middleImageDisplay.ImageDisplaySetContrastLimits(0,1);
				}
				if(SaveImages){ // save the images to the listed subdirectory unless set to 0
					string binaryFileName, binaryFilePath;
					binaryFileName = label + "_binary_no_shadow"
					binaryFilePath = PathConcatenate ( saveDirectory, binaryFileName );
					SaveAsGatan(middleImage, binaryFilePath);
				}
				if(ExportImages){
					self.transparencyExport(binaryImage, saveDirectory)
				}	
			}
			// The images will all be added together, regardless of the parameters.
			binarySum = binarySum + binaryImage;
		} // end of loop
		copyTags(binarySum, RefIm);
		
		string binarySumTitle = (useShadowImages != 0) ? "Sum_from_Shadows" : "Sum_from_Middle" ;
		binarySum.ImageSetName(binarySumTitle);
		if(SaveImages){
			binarySumFileName = binarySumTitle
			binarySumFilePath = PathConcatenate ( saveDirectory, binarySumFileName )
			SaveAsGatan(binarySum, binarySumFilePath);
		}
		if(DisplayImages){
			showImage(binarySum);
		}
		if(ExportImages){
			self.transparencyExport(binarySum, saveDirectory);
		}
		return binarySum;
	}

	/* Function to make binary images out of a generic image list */
	void binaryAllImages(object self, TagGroup imageList, number targetPercentage, number ExportImages, string saveDirectory){
		result("\nmaking binaries of a set of images...")
		number totalImages = taggroupcounttags(imageList);
		result("\n\tFound " + totalImages + " images.");
		number i;
		for(i=0; i < totalImages; i++){
			number ImageID
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			image binaryImage :=  self.levelAndDespeckleImage(thisImage, targetPercentage);
			showImage(binaryImage);
			binaryImage.ImageSetName(imageTitle + " binary");
			if(ExportImages){
				self.transparencyExport(binaryImage , saveDirectory);
			}
		}
		result("\nAll Images processed.");
	}

	/* Function to align an entire directory */
	void alignAllImages(object self, TagGroup imageList){
		result("\nAligning a set of images...")
		number totalImages = taggroupcounttags(imageList);
		result("\n\tFound " + totalImages + " images.");
		number i;
		number maxXShift, maxYShift, minXShift, minYShift;
		image xShiftImage := IntegerImage( "xShift Array", 4, 1, totalImages, 1);
		image yShiftImage := IntegerImage( "yShift Array", 4, 1, totalImages, 1);
		image image2, baseImage;
		if(!GetTwoImagesWithPrompt( "Select the Base Image to compare all others to", "Base Image Selection", baseImage, image2) ){
			exit(0);
		}
		string baseImageTitle = baseImage.GetName();
		
		for(i=0; i < totalImages; i++){
			number ImageID
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			if(imageTitle == baseImageTitle){
				continue;
			}
			number offsetX, offsetY;
			if(!imageAlignmentDialog.alignTwoImages(thisImage, baseImage, offsetX, offsetY)){
				// User pressed Cancel. Stop everything.
				return;
			}
			xShiftImage.setPixel(i, 0, -offsetX);
			yShiftImage.setPixel(i, 0, -offsetY);
		}
		result("\nAll Images aligned. Making aligned image set...");
		//Find the maximum shift values.
		ImageCalculateMinMax( xShiftImage, 0, 0, minXShift, maxXShift );
		if(debugMode==true){result("\n\tmaxXShift = " + maxXShift + "\n\tminXShift = " + minXShift);}
		ImageCalculateMinMax( yShiftImage, 0, 0, minYShift, maxYShift );
		if(debugMode==true){result("\n\tmaxYShift = " + maxYShift + "\n\tminYShift = " + minYShift);}
		
		// minX/YShifts need to be either 0 or the largest -ve number.
		// maxX/YShifts need to be either 0 or the largest +ve number
		maxXShift = tert( (maxXShift >= 0), maxXShift, 0 );
		minXShift = tert( (minXShift <= 0), minXShift, 0 );
		maxYShift = tert( (maxYShift >= 0), maxYShift, 0 );
		minYShift = tert( (minYShift <= 0), minYShift, 0 );
		
		for(i=0; i < totalImages; i++){
			number ImageID, XShift, YShift, xSize, ySize;
			TagGroupGetIndexedTagAsNumber( imageList, i, imageID );
			XShift = getPixel( xShiftImage, i, 0 );
			YShift = getPixel( yShiftImage, i, 0 );
			image thisImage := GetImageFromID(ImageID);
			string imageTitle = thisImage.GetName();
			result("\n\tProcessing " + imageTitle)
			GetSize(thisImage, xSize, ySize);
			image alignedImage :=  imageAlignmentDialog.createAlignedImage (thisImage, minXShift, minYShift, maxXShift, maxYShift, XShift, YShift);
			showImage(alignedImage);
		}
	}

	/* TOP LEVEL BUTTON FUNCTIONS */
	void calibrateButtonPress(object self)
		{
			//this is the response when the Calibration button is pressed
			// It should make the calibration panel appear
			taggroup panellist=self.lookupelement("panellist")
			// number panelvalue=dlggetvalue(panellist); to get the current value
			number panelvalue=0
			panellist.dlgvalue(panelvalue)
			return
		}
		
	void controlsButtonPress(object self) // Will have buttons to change the tilt
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 4
			panellist.dlgvalue(panelvalue)
			return
		}

	void targetButtonPress(object self)
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 1
			panellist.dlgvalue(panelvalue)
			return
		}

	void ringButtonPress(object self)
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 2
			panellist.dlgvalue(panelvalue)
			return
		}		
		
	void optionButtonPress(object self)
		{
			// Will display some kind of instructions
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 6
			panellist.dlgvalue(panelvalue)
			return
		}
	
	void cameraButtonPress(object self)
		{
			taggroup panellist=self.lookupelement("panellist")
			number panelvalue = 5
			panellist.dlgvalue(panelvalue)
			return
		}
		
	/* CALIBRATION PANEL BUTTON FUNCTIONS */
	
	void trackCameraLengthChange(object self, TagGroup tg)
	{
		number returnno=val(dlggetstringvalue(tg)) - 1 // the option #
		string returnname;
		dlggetnthlabel(tg, returnno, returnname) // convert option # to label
		if(debugMode==true){result("\nSelection is " + returnname);}
		dataObject.setCameraLength(returnname);
		
		// Update the scales
		number newScale = dataObject.getScaleCalibration(returnname);
		if(debugMode==true){result("\nNew Scale is " + newScale);}

		dataObject.setRefScale(newScale);
		
		// update the Tilt vectors from the stored table.
		TagGroup vectors
		if (TagGroupGetTagAsTagGroup (dataObject.getTiltVectorCalibrations(), returnname, vectors) == 0){
			result("\nError changing the tilt calibration. Camera length not found in calibration tables.")
		}
		number xTVx, xTVy, yTVx, yTVy;
		vectors.TagGroupGetTagAsNumber("xTiltx", xTVx);
		vectors.TagGroupGetTagAsNumber("xTilty", xTVy);
		vectors.TagGroupGetTagAsNumber("yTiltx", yTVx);
		vectors.TagGroupGetTagAsNumber("yTilty", yTVy);
		dataObject.setTiltVectors(xTVx, xTVy, yTVx, yTVy);
		
		
		image viewImage;
		if(!returnViewImage(debugMode, viewImage)){
			if(debugMode==true){result("\nNo View Window detected.");}
			exit(0); // Stop here if no view window is there.
		}
		
		// View image scale
		number binning = dataObject.getBinningMultiplier();

		ImageSetDimensionScale(viewImage, 0, (newScale * binning))
		ImageSetDimensionUnitString(viewImage, 0, "1/nm" )
		ImageSetDimensionScale(viewImage, 1, (newScale * binning))
		ImageSetDimensionUnitString(viewImage, 1, "1/nm" )

		// Reference image scale
		image refImg := dataObject.getReferenceDP();
		if(refImg.ImageIsValid()){
			ImageSetDimensionScale(refImg, 0, newScale)
			ImageSetDimensionUnitString(refImg, 0, "1/nm" )
			ImageSetDimensionScale(refImg, 1, newScale)
			ImageSetDimensionUnitString(refImg, 1, "1/nm" )	
		}
	}
	
	void startCalibrationButtonPress (object self)
	{	
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and it has been captured.")
			exit(0);
		}
		if (!ContinueCancelDialog( "Please Centre the beam before continuing..." )){
			Throw( "User aborted process." );
		}
		self.startDPStoring();
	}
		
	void onDFChange (object self)
	{
		number newDFExposure;
		taggroup intfield=self.lookupelement("DarkfieldExposureFieldInput")
		newDFExposure = dlggetvalue(intfield);
		dataObject.setDFExposure(newDFExposure);
		if(debugMode==true){result("\nDarkField Exposure time set to " + newDFExposure + " seconds");}
	}
	void onBFChange (object self)
	{
		number newBFExposure;
		taggroup intfield=self.lookupelement("BrightfieldExposureFieldInput")
		newBFExposure = dlggetvalue(intfield);
		dataObject.setBFExposure(newBFExposure);
		if(debugMode==true){result("\nBrightField Exposure time set to " + newBFExposure + " seconds");}
	}
	void onDPChange (object self)
	{
		number newDPExposure;
		taggroup intfield=self.lookupelement("DiffractionExposureFieldInput")
		newDPExposure = dlggetvalue(intfield);
		dataObject.setDPExposure(newDPExposure);
		if(debugMode==true){result("\nDiffraction Pattern Exposure time set to " + newDPExposure + " seconds");}
	}	
	
		
	/* CONTROL PANEL BUTTON FUNCTIONS*/
	void beamCentreButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active.")
			exit(0);
		}
		if(debugMode==true){result("\nCentralizing Beam");}
		self.beamCentre();
	}

		
	/* IMAGE PANEL BUTTON FUNCTIONS */
	void StoreDPButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		// Stores a diffraction spot's tilt coordinates and takes a picture to reference the spot in future.
		if(dataObject.getTracker()<1)
		{ //The first tiltStore needs to make the reference image as well.
			Throw("Data NOT stored. Please Calibrate the system first.")
		}
		else
		{
			number shadowDistanceNM;
			shadowDistanceNM = dataObject.getShadowDistanceNM();
			getNumber("Set Shadowing Distance in (1/nm):", shadowDistanceNM , shadowDistanceNM)
			dataObject.setShadowDistanceNM(shadowDistanceNM)
			self.storeTiltCoord (shadowDistanceNM , 0 );
		}
	}
		
	void storeROIButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(dataObject.getTracker()<1){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		// Get the total number of ROI on the screen
		ImageDisplay viewDisplay
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			throw("No Live View window found");
		}
		/* Create the ImageSet Tag Group. The values will be filled out as the function goes on and uploaded to the dataObject before the storeROIButtonPress function ends. */
		TagGroup imageSet = imageSetTools.createNewImageSet();
		imageSetTools.addImageSet(imageSet);
				
		number totalROI = viewDisplay.ImageDisplayCountROIs(); // Count ROIs
		if(debugMode==true){result("\nThere are " + totalROI + " ROI highlighted on the View Window before any shadowing.");}
		if(totalROI < 1)
		{ 
			Throw("No ROI are present.")
		}
		image dataArray := dataObject.getDataArray();
		//if(dataObject.getTracker() > 1){ // All ready results stored?
			//if(TwoButtonDialog("Delete previous stored points?", "Yes", "No")){
				dataObject.setTracker(1);
				number height, width;
				getSize(dataArray, width, height)
				//realsubarea operator[( realimage img, number top, number left, number bottom, number right )
				dataArray[0, 1, height, width] = 0; // Set all values except first to 0
				result("\nStored points have been cleared. Calibration data are still in memory.")			
			//}
		//}
		number shadowDistanceNM;
		shadowDistanceNM = dataObject.getShadowDistanceNM();
		getNumber("Shadow points by (1/nm): ", shadowDistanceNM, shadowDistanceNM);
		
		dataObject.setShadowDistanceNM(shadowDistanceNM)
		imageSet.TagGroupSetTagAsNumber("ShadowDistance", shadowDistanceNM); // store in imageSet Tags
		
		// Create the information for the image of the diffraction pattern. This makes sure BF and DP are paired up later.
		TagGroup CentralImage = imageSetTools.createNewImageForImageSet();
		CentralImage.TagGroupSetTagAsString("ImageType", "DP");
		CentralImage.TagGroupSetTagAsNumber("ExposureTime", dataObject.getDPExposure());
		CentralImage.TagGroupSetTagAsNumber("xTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("yTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("xTiltValue", dataObject.getCentreXTilt());
		CentralImage.TagGroupSetTagAsNumber("yTiltValue", dataObject.getCentreYTilt());
		CentralImage.TagGroupSetTagAsNumber("ShadowValue", 0);
		CentralImage.TagGroupSetTagAsNumber("DSpacingAng", 0);
		
		imageSetTools.addSpotToCurrentImageSet();
		imageSetTools.addImageDataToCurrentSpot(CentralImage, "Middle");
		
		if(debugMode==true){result("\nCreating ROI List...");}
		if(debugMode==true){result("\n\tROIs present: " + totalROI);}
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
		dataobject.setROIList(ROIData);
		if(debugMode==true){result("\nROI List loaded to DataObject.");}
		
		image ROIList = dataObject.getROIList();
		// For each ROI...
		if(debugMode==true){result("\nBeginning to move to and store ROIs...");}
		for(i=0; i < totalROI; i++)
		{
			result("\n\tROI " + (i+1) + " of " + totalROI);
			if(debugMode==true){result("\nROI " + (i+1) + " of " + totalROI +  " has index ");}
			number indexValue = getPixel(ROIList, i, 1);
			if(debugMode==true){result(indexValue);}
			dataObject.setROITracker(indexValue); // Set ROI tracker number
			self.moveToCurrentROI(); // Go there.
			self.storeTiltCoord(shadowDistanceNM, 0); // Store it in the system + Shadow.
		}
		if(debugMode==true){result("\nAll ROIs stored.");}
		OkDialog("All ROI have been stored. You may now begin imaging.");
		self.beamCentre();
		imageSetTools.showImageSets();
	}

	void storeRingButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(!markerRing.ComponentIsValid()){
			throw("Marker Ring not found")
		}
		image dataArray := dataObject.getDataArray();
		if(dataObject.getTracker() > 1){ // All ready results stored?
			if(TwoButtonDialog("Delete previous stored points?", "Yes", "No")){
				dataObject.setTracker(1);
				number height, width;
				getSize(dataArray, width, height)
				//realsubarea operator[( realimage img, number top, number left, number bottom, number right )
				dataArray[0, 1, height, width] = 0; // Set all values except first to 0
				result("\nStored points have been cleared. Calibration data are still in memory.")			
			}
		}
		number radiusPX = self.markerRingRadius()
		number numberOfPoints;
		self.loadRingPoints (radiusPX, 0, numberOfPoints);
		self.imageRingDP (45);
		self.beamCentre();
	}
	
	void deleteStoredTiltsButtonPress (object self)	
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		self.beamCentre();
		dataObject.resetTiltStore();
	}
		
	/* RING PANEL BUTTON FUNCTIONS*/
	void RingToggleButtonPress (object self)
	{
		if(debugMode==1){result("\n\tYou have pressed to toggle the marker ring");}
		// Make the Marker Ring and radius display visible/hidden;
		self.toggleMarkerRing();
	}
	void RingTextButtonPress (object self) // NOT IMPLEMENTED
	{
		// Make the radius display visible/hidden;
		// toggleMarkerRing(dataObject);
	}
	void SetRingRadiusButtonPress (object self)
	{
		// Take the value in the ringMarkerField text box and set the ring radius to it.
		taggroup intfield=self.lookupelement("ringMarkerFieldInput")
		number desiredRadiusNM = dlggetvalue(intfield)
		self.setRingRadius (desiredRadiusNM);
		self.updateRadius();
	}
		
	void updateRingRadiusButtonPress(object self)
	{
		self.updateRadius();
	}

	void recenterRingButtonPress (object self)
	{
		self.recenterMarkerRing();
	}

	void addRingButtonPress (object self)
	{
		// Pick an image
		image targetImage, dummyImage;
		if(!GetTwoImages("Please Select an image to add a ring marker to.", targetImage, dummyImage )){
			throw("Cancelled by User");
		}
		// Pick a colour
		number colourChoice = dataObject.getringMarkerColourTracker() + 1;
		rgbnumber componentColour = colourBlind(colourChoice);
		dataObject.setringMarkerColourTracker(colourChoice);
		// Pick a radius (Anstroms)
		number radiusAng, radiusPX, scaleX, radiusNM;
		if(!getNumber("Ring Radius in Angstroms", 3.2, radiusAng)){
			throw("Cancelled by User");
		}
		string radiusTextString = "D-Spacing: " + radiusAng + " A"
		// convert this to pixels. Can use image scale unless it is view image.
		image viewImage;
		radiusNM = 1 / (radiusAng / 10); // radius in units of 1/nm
		if(returnViewImage(debugMode, viewImage)){ // if View image present...
			number targetImageID = targetImage.ImageGetID();
			number viewImageID = viewImage.ImageGetID();
			if(targetImageID == viewImageID){ // AND the view image is being refered to
				//get scale from dataObject
				scaleX = dataObject.getRefScale() * dataObject.getBinningMultiplier();
			}
		} else { // use image scale
			number scaleY
			targetImage.getScale(scaleX, scaleY);
		}
		radiusPX = radiusNM / scaleX;
		result("\nRadius 1/NM: " + radiusNM);
		result("\nscaleX: " + scaleX);
		result("\nradiusPX: " + radiusPX);
		// create circle
		self.makeNewCircle(targetImage, radiusPX, radiusTextString, componentColour);
	}

	/* Imaging & Processing Panel Functions */
	
	void DarkFieldImageButtonPress (object self)
	{
		if(!AllowControl){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(dataObject.getTracker()<2)
		{
			Throw("No spots are stored.");
		}
		number shadowDistanceNM = dataObject.getShadowDistanceNM();
		number integrationDistance = 45;
		number integration = TwoButtonDialog("Use integrated images? Can help when taking an entire ring.", "Yes", "No");
		if(integration==true){
			getNumber("How many results should each image be made of?", integrationDistance, integrationDistance);
		}
		self.darkFieldImage (shadowDistanceNM, integration, integrationDistance)
	}
	
	void ProcessDirectoryButtonPress (object self) // Makes binaries for a collection of images.
	{
		// If you want to apply the binary process to an entire directory without file structure then use the binaryAllImages() function
		number ignoreStructure = 0;
		if(TwoButtonDialog("Make binaries of ALL images in directory?", "Yes", "No")){
			ignoreStructure = 1;
		}
		
		if(ignoreStructure==1){
			TagGroup fileList = makeFileListGroup()
			string directory;
			fileList.TagGroupGetTagAsString( "Directory" , directory )
			TagGroup imageList = makeImageIDList( fileList );
			number targetPercentage = 99;
			if(!getNumber("Enter % of dimmest pixels to be ignored", targetPercentage, targetPercentage)){
				throw("User Cancelled Process")
			}
			number ExportImages = 0;
			if(TwoButtonDialog("Export Binaries as Gifs?", "Yes","No")){
				ExportImages = 1;
			}
			self.binaryAllImages(imageList, targetPercentage, ExportImages, directory)
			result("Directory Processed");
			exit(0);
		}		
		
		/* This function will take a TagGroup of stored images and then process them based on the input arguments.
		The input TagGroup is the output of makeDFFileListGroup()
		useShadowImages 0/1 - use the shadowing method. This will only use the higher/lower images of a darkfield set. If 0 it will only use the Middle images.
		makeBinaries 0/1 - Run the levelAndDespeckleImage() function on the images before addition or multiplication. If set to 0 it assumes the input images are all ready binaries.
		targetPercentage - number. The % of the dimmest pixels to be removed. 99 is generally used. Is the input for levelAndDespeckleImage function.
		DisplayImages 0/1 - show binary images on screen after processing
		SaveImages 0/1/2 - 	2 = Will automatically save binary images, shadow images and summed images to a directory.
							1 = Will save binaries and summed images (not individual shadowed binaries)
							0 = Will not save anything
			If DisplayImages and SaveImages are both 0 then only the sum total image will be returned and the others will be lost.
		ExportImages 0/1/2 - 	0 = no additional action
								1 = save any binary images that are saved in gatan format in gif format as well.
								2 = save ALL binary images produced as gif format as well.
		debugMode 0/1 - Lots of feedback.
		
		image processDarkFieldImages(TagGroup DFList, number useShadowImages, number makeBinaries, number targetPercentage,\
		number DisplayImages, number SaveImages, number ExportImages, number debugMode ) */
		
		TagGroup DFList = self.makeDFFileListGroup();
		
		number saveImages = 0;
		if(TwoButtonDialog("Save useful Binaries in Gatan DM3 format?", "Yes", "No")){
			saveImages = 1;
			if(TwoButtonDialog("Save ALL thresholded binaries in Gatan DM3 format?", "Yes", "No")){
				saveImages = 2;
			}
		}
		
		number useShadowImages;
		DFList.TagGroupGetTagAsNumber("ShadowMode" , useShadowImages);
		if(useShadowImages == 1){
			if(!TwoButtonDialog( "Would you like to use Shadowing?", "Yes", "No" )){
				useShadowImages = 0;
			}
		}
		number makeBinaries = 1;
		if(TwoButtonDialog("Are the images binary Images?", "Yes", "No")){
			makeBinaries = 0;
		}
		
		number targetPercentage = 99; // default value for targetPercentage.
		if(makeBinaries){
			getNumber("What % of dim pixels do you want to ignore?", targetPercentage, targetPercentage);
		}
		
		number ExportImages = 0;
		if(TwoButtonDialog("Export Binaries as Gifs?", "Yes", "No")){
			ExportImages = 1;
			if(TwoButtonDialog("Save ALL thresholded binaries as Gifs?", "Yes", "No")){
				ExportImages = 2;
			}
		}
		
		number DisplayImages = 0;
		if(TwoButtonDialog("Open images for viewing?", "Yes", "No")){
			displayImages = 1;
		}
		
		image binarySum = self.processDarkFieldImages(DFList, useShadowImages, makeBinaries, targetPercentage,\
		DisplayImages, SaveImages, ExportImages)
		result("\nDirectory Processing Complete")
	}
	
	// Select an open image and make a binary out of it.
	void ProcessSingleFileButtonPress (object self)	
	{
		// Pick a single image and apply the despeckle + level function to it.
		image im1, im2;
		if(!GetTwoImages( "Select an Image.", im1, im2 )){
			throw("Cancelled by user")
		}
		number targetPercentage = 99;
		getNumber("Enter % of dimmest pixels to be ignored", targetPercentage, targetPercentage);
		image filteredImage := self.levelAndDespeckleImage(im1, targetPercentage);
		showImage(filteredImage);
	}

	// Ask for 2 images and align them with the manual alignment dialog.
	void alignImagesButtonPress (object self)
	{
		image imagea, imageb;
		if(!gettwoimages("Select two images",imagea, imageb)){
			exit(0);
		} else {
			number offsetX, offsetY, useValues;
			useValues = imageAlignmentDialog.alignTwoImages(imagea,imageb,offsetX, offsetY);
			number imageaWidth, imageaHeight, imagebWidth, imagebHeight;
			imagea.GetSize(imageaWidth, imageaHeight);
			imageb.GetSize(imagebWidth, imagebHeight);
			if(useValues == 1){
				result("\nThe offsets recorded were " + offsetX + ", " + offsetY);
				number minXShift = (offsetX > 0 ? 0 : offsetX)
				number maxXShift = (offsetX <= 0 ? 0 : offsetX)
				number minYShift = (offsetY > 0 ? 0 : offsetY)
				number maxYShift = (offsetY <= 0 ? 0 : offsetY)
				
				number widthDifference = imageaWidth - imagebWidth;
				number heightDifference = imageaHeight - imagebHeight;
				showImage(imageAlignmentDialog.createAlignedImage(imagea, minXShift, minYShift, maxXShift, maxYShift, offsetX, offsetY));
				
				showImage(imageAlignmentDialog.createAlignedImage(imageb, minXShift, minYShift, maxXShift + widthDifference, maxYShift + heightDifference, -offsetX, -offsetY));
			} else {
				result("\nOffsets were not recorded. Cancelled by User");
			}
		}
	}
	
	// Select a directory and align all the images inside it with the generic alignment functions
	void alignDirectoryButtonPress(object self)
	{
		TagGroup imageList = makeImageIDList( makeFileListGroup() );
		self.alignAllImages(imageList);
	}
	
	void mapDirectoryButtonPress(object self){
		TagGroup fileList = makeFileListGroup()
		string directory;
		fileList.TagGroupGetTagAsString( "Directory" , directory )
		TagGroup imageList = makeImageIDList( fileList );
		self.createMap(imageList);	
	}
	/* OPTION PANEL BUTTON FUNCTIONS */
	
	void debugToggleButtonPress(object self)
	{
		string state = (debugMode==0) ? "Deactivated" : "Activated" ;
		result("\nDebugMode Button pressed to make debug mode " + state);
		self.ToggleDebugMode();
	}
		
	void saveDirButtonPress(object self)
	{
		result("\nThe auto-save directory has been set to " + setAutoSaveDir())
	}

	void enterScaleButtonPress (object self) // Set the scale to something more awesome. Adjust for Binning.
	{
		result("\n\nThe scale factor is the number of (1/nm) per pixel on an UNBINNED image at these microscope settings." + \
				"\nEach camera length will have a different scale.");
		number useValues = scaleCalibrationDialog.inputNewCalibration();
		if(useValues){result("\n\nNew values loaded into memory. Please restart the Toolkit.");}
		else {result("\nCalibration input cancelled by user. No data has been changed.");}
	}
		
	void manualTiltCalibrationButtonPress (object self)
	{
		result("\n\nThis allows the entry of tilt calibration data without going through the full calibration process." + \
			"\nThe numbers required are the number of pixels that the diffraction pattern moves as the beam tilt is changed." + \
			"\nGenerally it should be easier to use the full calibration method.");
		number useValues = tiltCalibrationDialog.inputNewCalibration();
		if(useValues){result("\n\nNew values loaded into memory. Please restart the Toolkit.");}
		else {result("\nTilt Calibration input cancelled by user. No data has been changed.");}
	}
	
	void captureViewButtonPress (object self)
	{
		self.captureViewScreen();
	}
	
	// Saves the DataObject variables into a settings file. Any gaps will be filled from permanent memory.
	void saveToolKitVariablesToFilePress (object self)
	{
		string path;
		if(SaveAsDialog( "Save Settings As...", "Darkfield_Settings", path )){
			TagGroupSaveToFile( dataObject.createPersistent(1), path );
		}
	}
	
	// Loads variables from a settings file and into the dataObject (not to permanent memory)
	void loadToolkitVariablesFromFilePress (object self)
	{
		string path;
		if(OpenDialog( path )){
			TagGroup ToLoad = NewTagGroup();
			if(TagGroupLoadFromFile( ToLoad, path )){
				dataObject.loadPersistent(ToLoad); // Loads into the dataObject
			}		
		}	
	}
	
	// Stores the current dataObject variables in the permanent memory
	void saveVariablesToMemoryPress(object self){
		dataObject.updatePersistent(dataObject.createPersistent(1));
	}
}


//****************************************************
// STARTUP FUNCTIONS
//****************************************************

// This function is called when the toolkit starts.
// The data object will be made, a reference DP taken, key handler started and the dataObject returned to be installed in the dialogue object.
object startToolkit () {
	
	result("\nCreating toolkit data store...")
	object dataObject = alloc(MyDataObject); // This is the object that will contain everything else.
	
	result("\nSetting Variables.")
	// Set Variables
	dataObject.setDFExposure(30); // # of seconds to expose the camera for taking DarkField images.
	dataObject.setBFExposure(1); // # of seconds to expose the camera for taking Diffraction Pattern images.
	dataObject.setDPExposure(0.5); // # of seconds to expose the camera for taking BrightField images.
	dataObject.setMaxDeviation(0.2); // difference (in 1/nm) allowed during pattern matching operations
	image dataArray; // Array of values that are stored for future reference.
	dataArray := RealImage( "Data Array", 4, 5000, 10 ); // 5000 x 10 sized
	dataObject.setDataArray(dataArray);
	
	result("\nLoading Image Set Tools...")
	object theImageSetTools = alloc(ImageSetTools);
	
	result("\nCreating KeyListener for shortcut commands...")
	// Create objects that will be used later but must be created now before the class drops from scope
	object KeyListener=alloc(MyKeyHandler) // Key handler for the view Window for shortcut key presses. Not attached yet.
	
	result("\nCreating Alignment Dialog System...")
	object alignmentDialog = alloc(alignmentdialog); // The aligning image dialog. Is not displayed or created yet.
	
	result("\nCreating Calibration Input Dialog...")
	object calibrationDialog = alloc(ScaleValueDialog);
	
	result("\nCreating Tilt Calibration Input Dialog...")
	object tiltDialog = alloc(TiltValueDialog);
	
	if(dataObject.checkPersistent()==false){
		TagGroup persistentSave = dataObject.createDefaultPersistent(); // make a blank set of data
		dataObject.updatePersistent(persistentSave); // save it to memory
	}
	dataObject.overWriteDataObject(); // load variables from permanent memory into the dataObject.

	// Construct the Toolkit. This automatically creates the toolkit dialog.
	object Toolkit = alloc(CreateDF360DialogClass);
	// Toolkit.ToggleDebugMode() // comment out to deactivate debugMode on startup. Can be toggled on toolkit manually
	result("\nAttaching data store to Toolkit...")
	Toolkit.storeDataObject(dataObject);
	Toolkit.storeImageSetTools(theImageSetTools);
	Toolkit.storeKeyListener(KeyListener); 	// Insert it into toolkit. To make it listen for key presses on a display use Toolkit.startListening(ImageDisplay);
	Toolkit.storeAlignmentDialog(alignmentDialog); // Stored in toolkit object.
	Toolkit.storeCalibrationDialog(calibrationDialog);
	Toolkit.storeTiltDialog(tiltDialog);
	
	Toolkit.updateDialog();
	return Toolkit;
}

// This function is triggered by the script being run and begins everything.
void main()
	{
	OpenResultsWindow(); // Shortcut to open the results window.
	result("\n-----------------------");
	result("\nDarkField360 Toolkit");
	result("\n-----------------------");
	result("\nLoading Toolbar ...");

	object ToolKit = startToolkit();		
	
	result("\nLoading complete.");
	Toolkit.printAllValues();
		// Note: The script looks for a view window here.
	image viewImage;
	if(!returnViewImage(0, viewImage)){
		result("\nNo View Window detected. Many controls will not be accessible or could cause crashes."\
		+ "\nIf you open a live View window later you can 'capture' it on the Options panel.");
	} else {
		Toolkit.captureViewScreen();
	}
	
	// Forces the user to choose the save directory
	result("\nPlease select an auto-save directory for images made by this script.")
	result("\nThis can be changed later in the toolkit options menu");
	result("\nThe auto-save directory has been set to " + setAutoSaveDir())
	
	printGreeting(); // Basic Instructions
	printCommands(); // Shortcut keys
}

main();