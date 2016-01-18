/*
	This file goes at the very start of the DF360 script. It contains functions and variables that can be used globally.
	The toolkit buttons are also defined here.
*/


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
// However, it helps avoid the problem of classes calling class methods in other, not-yet-defined classes.
// Ideally these should not be used and the dependancies should be fixed.

// All classes need to be able to reference the following methods in the Toolkit class before it is defined.

/* -- no longer used, but kept here for reference ---
interface ToolkitInterface
{
	void toggleMarkerRing(object self); // Used in Keyhandler
	void setRingRadius(object self, number desiredRadiusNM); // Used in Keyhandler
	void updateRadius(object self); // Used in Keyhandler
}
*/

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
	Tag group structure
		|-	[Directory]: the directory path
		|-	[files]:
				|- [0]:
				|	|- [Name]: filename
				|
				|- [1]:
				|	|- [Name]: fileName
				|
				...
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

/* Function to open a list of files, open the files and then record their ImageIDs in an indexed TagList for use in other functions
	the input list is the output of makeFileListGroup();
	
	Taggroup format:
		|- [0]: imageID
		|- [1]: imageID
		|- ...
	
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

// The dataObject contains variables that are used by other objects.
// Holds the toolkit settings.
// This is always available, even in offline systems, so it does not rely on the Camera module for resolution information.
// Performs a variety of calculations for tilt control and image processing.
// Loads and saves persistent tags, but not for the individual image sets or images.

class ToolkitDataObject
{
	number dataObjectID;
	number ToolkitID; // DataObject will be kept inside this object
	image referenceDP; // A Diff. Pattern taken with the beam centred. Used to extract calibration data in some functions. Needs standardizing.
	
	number ROITracker; // A variable to keep track of which ROI a user looked at last. Used in Toolkit function moveToROI();
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
	number digitalMicrographVersion; //1 or 2. 2 is newer and uses different close dialog codes.
	number DFExposure;
	number BFExposure;
	number DPExposure;
	number DisableModeWarnings; // 0 or 1. If 1, the imaging functions will not check to see if the microscope is in an imaging or diffraction mode. 0 by default

	number getDigitalMicrographVersion(object self){
		return digitalMicrographVersion;
	}
	number setDigitalMicrographVersion(object self, number value){
		digitalMicrographVersion = value;
		return value;
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
	
	image getReferenceDP(object self){
		return ReferenceDP;
	}
	image setReferenceDP(object self, image ReferenceDPImage){
		ReferenceDP := ReferenceDPImage;
		return ReferenceDP;
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
	
	number getDFExposure(object self) {
		return DFExposure;
	}
	void setDFExposure(object self, number newValue) {
		DFExposure = newValue;
	}

	number getBFExposure(object self) {
		return BFExposure;
	}
	void setBFExposure(object self, number newValue) {
		BFExposure = newValue;
	}

	number getDPExposure(object self) {
		return DPExposure;
	}
	void setDPExposure(object self, number newValue) {
		DPExposure = newValue;
	}
	
	number getDisableModeWarnings(object self){
		return DisableModeWarnings;
	}
	
	void setDisableModeWarnings(object self, number newValue){
		DisableModeWarnings = newValue;
	}

	void initialise(object self, number theToolkitID){
		ToolkitID = theToolkitID;
		if(debugMode==1){result("\nDatastore has been connected to Toolkit ID:" + theToolkitID);}
	}
	
	number getDataObjectID(object self){
		return dataObjectID;
	}
	
	// Function to print out the object's stored values.
	void printAll(object self){
		result("\n\nDataObject Debug Values");
		result("\n------------------------------");
		string textString = "\nROITracker: " + ROITracker +\
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
		"\nDisableModeWarnings: " + DisableModeWarnings +\
		"\nshadowDistanceNM: " + shadowDistanceNM;
		
		result(textString);
		result("\n-------End----------------");
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
	
	TagGroup getImagingModes(object self){
		return ImagingModes;
	}
	
	void setImagingModes(object self, TagGroup input){
		ImagingModes = input;
	}
	
	TagGroup getDiffractionModes(object self){
		return DiffractionModes;
	}
	
	void setDiffractionModes(object self, TagGroup input){
		DiffractionModes = input;
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
	
	/* Function to save the persistent tag group in memory. Input is the entire Darkfield360 tag group to be saved. */
	number updatePersistent(object self, TagGroup updatedTagGroup){
		string tagPath = "Darkfield360";
		if(self.checkPersistent()==1) {
			// Yes the tag does exist - so delete it
			taggroupdeletetagwithlabel(GetPersistentTagGroup(), tagPath)
		}
		taggroupaddlabeledtaggroup(GetPersistentTagGroup(), tagPath, updatedTagGroup);	
	}

	/* Function to load data from a Darkfield360 tag group (usually from persistent memory) into the dataObject
		used in the loadToolkitVariablesFromFilePress() function
	*/
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
		}
		
		// Diffraction modes
		tagPath = "DiffractionModes";
		number DiffractionModesDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(ImageSetsDoesExist==1){
			TagGroupGetTagAsTagGroup(persistentTG, tagPath, DiffractionModes);
			result("\n\tLoaded Diffraction Mode list");
		}
		
		// Diffraction Alert mode
		tagPath = "DisableModeWarnings";
		number DisableModeWarningsDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(DisableModeWarningsDoesExist==1){
			TagGroupGetTagAsNumber(persistentTG, tagPath, DisableModeWarnings);
			result("\n\tLoaded DisableModeWarnings options");
		}
		
		tagPath = "DFExposure";
		number DFExposureDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(DFExposureDoesExist==1){
			TagGroupGetTagAsNumber(persistentTG, tagPath, DFExposure);
			result("\n\tLoaded DF Exposure");
		}
		tagPath = "DPExposure";
		number DPExposureDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(DPExposureDoesExist==1){
			TagGroupGetTagAsNumber(persistentTG, tagPath, DPExposure);
			result("\n\tLoaded DP Exposure");
		}
		tagPath = "BFExposure";
		number BFExposureDoesExist = TagGroupDoesTagExist(persistentTG, tagPath);
		if(BFExposureDoesExist==1){
			TagGroupGetTagAsNumber(persistentTG, tagPath, BFExposure);
			result("\n\tLoaded BF Exposure");
		}
		
		//TagGroupOpenBrowserWindow(cameraLengths, 0);
		return 1;
	}
	
	/* Function to create a 'default' tag group for storage
		Used if no existing Darkfield360 tags are found or to reset the stored data
	*/
	TagGroup createDefaultPersistent(object self){
		TagGroup persistentTG = NewTagGroup();
		persistentTG.TagGroupCreateNewLabeledTag("Toolkit Version");
		persistentTG.TagGroupSetTagAsNumber("Toolkit Version", versionNumber);
		
		persistentTG.TagGroupSetTagAsNumber("DFExposure", 30);
		persistentTG.TagGroupSetTagAsNumber("BFExposure", 1);
		persistentTG.TagGroupSetTagAsNumber("DPExposure", 0.5);
		persistentTG.TagGroupSetTagAsNumber("DisableModeWarnings", 0);
		
		
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
		number loadedBFExposure, loadedDFExposure, loadedDPExposure, loadedDisableModeWarnings; // These will be 0 if a failed load anyway.
		
		if(persistentExists == true)
		{
			// Check to see if the relevent tags are found and load them.
			if(debugMode==1){result("\nLoading persistent tags:");}
			TagGroupGetTagAsTagGroup(GetPersistentTagGroup(), "Darkfield360", darkfield360);
			
			TagGroupGetTagAsNumber(darkfield360, "DFExposure", loadedDFExposure);
			TagGroupGetTagAsNumber(darkfield360, "BFExposure", loadedBFExposure);
			TagGroupGetTagAsNumber(darkfield360, "DPExposure", loadedDPExposure);
			TagGroupGetTagAsNumber(darkfield360, "DisableModeWarnings", loadedDisableModeWarnings);
			
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
		
		if(DPExposure != 0 && loadedDPExposure != 0) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving DPExposure from DataObject");}
				persistentTG.TagGroupSetTagAsNumber("DPExposure", DPExposure);
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving DPExposure from Persistent Memory");}
				persistentTG.TagGroupSetTagAsNumber("DPExposure", loadedDPExposure);
				if(debugMode==1){result(". Done.");}
			}
		} else if(DPExposure != 0) {
			if(debugMode==1){result("\n\t Saving DPExposure from DataObject");}
			persistentTG.TagGroupSetTagAsNumber("DPExposure", DPExposure);
			if(debugMode==1){result(". Done.");}
		} else if(loadedDPExposure != 0) {
			if(debugMode==1){result("\n\t Saving DPExposure from Persistent Memory");}
			persistentTG.TagGroupSetTagAsNumber("DPExposure", loadedDPExposure);
			if(debugMode==1){result(". Done.");}
		} else {
			// neither exist, so do nothing to keep default values.
		}
		
		if(DFExposure != 0 && loadedDFExposure != 0) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving DFExposure from DataObject");}
				persistentTG.TagGroupSetTagAsNumber("DFExposure", DFExposure);
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving DFExposure from Persistent Memory");}
				persistentTG.TagGroupSetTagAsNumber("DFExposure", loadedDFExposure);
				if(debugMode==1){result(". Done.");}
			}
		} else if(DFExposure != 0) {
			if(debugMode==1){result("\n\t Saving DFExposure from DataObject");}
			persistentTG.TagGroupSetTagAsNumber("DFExposure", DFExposure);
			if(debugMode==1){result(". Done.");}
		} else if(loadedDFExposure != 0) {
			if(debugMode==1){result("\n\t Saving DFExposure from Persistent Memory");}
			persistentTG.TagGroupSetTagAsNumber("DFExposure", loadedDFExposure);
			if(debugMode==1){result(". Done.");}
		} else {
			// neither exist, so do nothing to keep default values.
		}
		
		if(BFExposure != 0 && loadedBFExposure != 0) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving BFExposure from DataObject");}
				persistentTG.TagGroupSetTagAsNumber("BFExposure", BFExposure);
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving BFExposure from Persistent Memory");}
				persistentTG.TagGroupSetTagAsNumber("BFExposure", loadedBFExposure);
				if(debugMode==1){result(". Done.");}
			}
		} else if(BFExposure != 0) {
			if(debugMode==1){result("\n\t Saving BFExposure from DataObject");}
			persistentTG.TagGroupSetTagAsNumber("BFExposure", BFExposure);
			if(debugMode==1){result(". Done.");}
		} else if(loadedBFExposure != 0) {
			if(debugMode==1){result("\n\t Saving BFExposure from Persistent Memory");}
			persistentTG.TagGroupSetTagAsNumber("BFExposure", loadedBFExposure);
			if(debugMode==1){result(". Done.");}
		} else {
			// neither exist, so do nothing to keep default values.
		}
		
		if(DisableModeWarnings != 0 && loadedDisableModeWarnings != 0) // This means that there is a choice of two values
		{
			if(dataDominant == true) { // the dataObject will be chosen.
				if(debugMode==1){result("\n\t Saving DisableModeWarnings from DataObject");}
				persistentTG.TagGroupSetTagAsNumber("DisableModeWarnings", DisableModeWarnings);
				if(debugMode==1){result(". Done.");}
			} else { // The persisten memory value will be chosen
				if(debugMode==1){result("\n\t Saving DisableModeWarnings from Persistent Memory");}
				persistentTG.TagGroupSetTagAsNumber("DisableModeWarnings", loadedDisableModeWarnings);
				if(debugMode==1){result(". Done.");}
			}
		} else if(DisableModeWarnings != 0) {
			if(debugMode==1){result("\n\t Saving DisableModeWarnings from DataObject");}
			persistentTG.TagGroupSetTagAsNumber("DisableModeWarnings", DisableModeWarnings);
			if(debugMode==1){result(". Done.");}
		} else if(loadedDisableModeWarnings != 0) {
			if(debugMode==1){result("\n\t Saving DisableModeWarnings from Persistent Memory");}
			persistentTG.TagGroupSetTagAsNumber("DisableModeWarnings", loadedDisableModeWarnings);
			if(debugMode==1){result(". Done.");}
		} else {
			// neither exist, so do nothing to keep default values.
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
	ToolkitDataObject(object self)
		{
			dataObjectID = self.ScriptObjectGetID(); // Tell the dataObject its own ID number
			if(EMIsReady()){ // If there is a microscope attached, then record tilt.
				setCentreTiltHere(self); // Store the Tilt values IMMEDIATELY to avoid referencing a null value or 0.
			}
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
	~ToolkitDataObject(object self)
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

	/* Function to generate the filename for an image in an imageset based only on its DF360 tags */
	
	string generateFileName(object self, TagGroup ImageTags){
		if(debugmode==true){result("\n  Generating the Image Filename.");}
				
		string imageSetID
		number ImageSpotNumber, shadowValue;
		string ImageType, shadowName, fileName;
		
		ImageTags.TagGroupGetTagAsString("Darkfield360:ImageSetID", imageSetID);
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
		if(debugmode==true){result("\n  Image Filename: " + FileName);}
		return fileName;
	}
		
	/*
	Function to generate the filename for an image in an ImageSet and then check if it can be saved without over-writting an existing image.
		Passes the filename to a variable.
		Passes the full filepath to a variable.
		Does not modify/save anything
		Based entirely on persistent image tags and not on any loaded imageSets
		Returns 1 if the file is safe to be saved, 0 if there is a problem.
		Will add _2 to the filename if there is an existing file, but will only go to _2, since anymore than one duplicate means something has gone wrong.
	*/

	number generateFileNameForImageInImageSet(object self, TagGroup ImageTags, string &fileName, string &filePath, string &imageSetDir)
	{
		fileName = self.generateFileName(ImageTags);

		if(debugmode==true){result("\n  Generating the Image Path.");}
		string imageSetID
		ImageTags.TagGroupGetTagAsString("Darkfield360:ImageSetID", imageSetID);
		string saveDir = GetApplicationDirectory( 1100, 1 ); // index 1100 = autosave
		imageSetDir = PathConcatenate(saveDir, ImageSetID);
		number imageSetDirExists = DoesDirectoryExist( imageSetDir );

		if(debugmode==true && imageSetDirExists == false){result("\n Image Set Directory not yet made.");}
		
		filePath = PathConcatenate(imageSetDir, fileName);
		
		if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
			result("\n" + filePath + " already exists. File name changed to ");
			fileName = fileName + "_2";
			filePath = PathConcatenate(imageSetDir, fileName);
			result(fileName);
			if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
				result("\n Multiple Versions of " + filename + " found.");
				imageSetDirExists = 2;
			}
		}
		return imageSetDirExists; //(0, 1, 2), 2 means duplicates
	}

	
	/*	Function to save an image using image set data and to feed those values into the image tags and imageset tags
		returns 0 on a failure/cancellation, 1 on success.
		Will save all images for an image set in a subfolder with the imageset ID
		After saving it will check to see if the imageSet is currently loaded. 
			If it is then it will update the imageSet with the file name and file save status
	*/
	number saveImageInImageSet(object self, image &theImage)
	{
		if(debugmode==true){result("\nSaving Image " + theImage.ImageGetID());}
		if(self.doImageTagsExist(theImage) == false){
			result("\n\t Image tags not found when saving image in image set");
			return 0;
		}
		TagGroup PersistentTags = theImage.ImageGetTagGroup();
		
		string imageSetID
		PersistentTags.TagGroupGetTagAsString("Darkfield360:ImageSetID", imageSetID);
		if(debugMode==true){result("\n\t ImageSetID: " + imageSetID);}
		
		string fileName, filePath, imageSetDir;
		number imageSetDirExists;
		
		//number generateFileNameForImageInImageSet(object self, TagGroup ImageTags, string &filename, string &filePath)
		ImageSetDirExists = self.generateFileNameForImageInImageSet( PersistentTags, fileName, filePath, imageSetDir);
		
		// ImageSetDirExists will be 0 if the directory is not there, 1 if ready to save or 2 if there are duplicates.
		if(ImageSetDirExists == 0){
			// need to create directory
			CreateDirectory( imageSetDir );
			imageSetDirExists = DoesDirectoryExist( imageSetDir );
			if(imageSetDirExists == false){
				result("\n\nCould not create a save directory when generating the folder for an image set!")
				return 0;
			}
		}
		if (ImageSetDirExists == 2) {
			result("\n Multiple Versions of " + filename + " found."); // duplicate filenames means something went wrong, so stop.
			return 0;
		}
		
		SaveAsGatan(theImage, filePath);
		
		// Check to see if the file saved correctly
		number saveCheck;
		if(DoesFileExist(filePath + ".dm4") || DoesFileExist(filePath + ".dm3")){
			result("\n\t " + filePath + " saved.");
			saveCheck = true;
		} else {	
			result("\n\n It looks like the file " + filePath + " did not save. \nIt might have saved, but is no longer reachable by the toolkit. You should check.")
			saveCheck = false;
		}
		
		if(debugMode == true){result("\n\t Attempting to open ImageSet to update image information");}
		TagGroup ImageSet
		number imageSetFound = self.getImageSetByID(ImageSetID, ImageSet);
		if(imageSetFound == false){
			result("\n Image Set with ID " + ImageSetID + " not found after saving an image. Data was not updated.");
			return 0;
		}
		
		// Load identifying data for this image in its imageSet
		//number identifyImageInImageSet(object self, image &theImage, string &ImageSetID, string &ImageType, number &SpotNumber, number &ShadowValue)
		string ImageType;
		number SpotNumber, ShadowValue;
		self.identifyImageInImageSet(theImage, ImageSetID, ImageType, SpotNumber, ShadowValue);
		
		// Record the saved file name in the ImageSet for future recall.
		//number getImageDataFromImageSet (object self, TagGroup ImageSet, String ImageType, Number SpotNumber, Number ShadowValue, TagGroup &ImageData)
		TagGroup ImageData;
		self.getImageDataFromImageSet(ImageSet, ImageType, SpotNumber, ShadowValue, ImageData);
		ImageData.TagGroupSetTagAsString("FileName", fileName);
		ImageData.TagGroupSetTagAsNumber("SavedAsFile", saveCheck);
		
		result("\nImageSet " + imageSetID + " updated with image file name.")
		return 1;
	}
	
	
	/* Function that will look at an image with DF360 image tags an rename it to the correct name. */
	void nameDisplayedImageInImageSet(object self, Image &theImage)
	{
		TagGroup ImageTags = theImage.ImageGetTagGroup();
		string fileName = self.generateFileName(ImageTags);
		theImage.ImageSetName(fileName);	
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
	
	// The destructor
	~ScaleValueDialog(object self)
	{
		if(debugMode == 1){result("\nScale Calibration Dialog with ID: "+self.ScriptObjectGetID()+" closed.");}
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

	/* These are components displayed on the Live View Window which the user interacts with */
	component markerRing;
	component ringRadiusText;
	
	/* The various aspects of the View Window the toolkit needs to know about */
	DocumentWindow ViewWindow;
	Image ViewImage;
	ImageDocument ViewImageDocument;
	ImageDisplay ViewImageDisplay;
	
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
	
	/* Function to locate and store the VIEW window and its various components.
			It will return 1 if the window is found and 0 if it is not present
	*/
	
	number findLiveView (object self){
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
			viewImageDocument = viewWindow.ImageWindowGetImageDocument();
			viewImage := viewImageDocument.ImageDocumentGetImage(0);
			viewImageDisplay = viewImage.ImageGetImageDisplay(0);
			return 1;
		}
	}
	
	// Check if the microscope is online and if there is a Live View Image captured
	void updateEMstatus(object self)
	{
		EMOnline = EMIsReady();
		if(EMOnline == false){
			AllowControl = 0;
		} else {
			image viewImage
			if(viewImage.ImageIsValid() == false){
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
	
	/* Function to centre beam */
	void beamCentre(object self){
		if(AllowControl == true){
			number centreXTilt = GetScriptObjectFromID(dataObjectID).getCentreXTilt();
			number centreYTilt = GetScriptObjectFromID(dataObjectID).getCentreYTilt();
			moveBeamTilt ( centreXTilt, centreYTilt );
		}
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
		if(viewImage.ImageIsValid() == false){
			result("\nView Image is invalid.")
			return 0;
		}
		number viewWidth, viewHeight;
		ViewImage.getSize(viewWidth, viewHeight);
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
	
	number getCameraHeight(object self) {
		return cameraHeight;
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

	// ************************************
	//  IMAGE / WINDOW ID AND POSITIONING
	// ************************************
	
	/* Function to return the VIEW window to a variable.
		It will return 1 if the window is real and 0 if it has not been set. */
	
	number returnViewWindow(object self, DocumentWindow &theViewWindow)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewWindow = viewWindow;
			return 1;
		}
	}
	
	/* Function to pass the VIEW window's image document to other functions.
			It will return 1 if the window is real and 0 if it has not been set. */
	
	number returnViewImageDocument(object self, ImageDocument &theViewImageDocument)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImageDocument = ViewImageDocument;
			return 1;
		}
	}

	/* Function to pass the VIEW window's image to other functions.
		It will return 1 if the window is real and 0 if it has not been set. */
		
	number returnViewImage(object self, image &theViewImage)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImage := ViewImage;
			return 1;
		}
	}

	/* Function to pass the VIEW window's imageDisplay to other functions.
		It will return 1 if the window is real and 0 if it has not been set. */
		
	number  returnViewImageDisplay(object self, imageDisplay &theViewImageDisplay)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImageDisplay = ViewImageDisplay;
			return 1;
		}
	}

	/* Function to reposition the window */
	
	void positionViewWindow(object self)
	{
		//void WindowSetFramePosition( DocumentWindow window, Number x, Number y ) 
		//Sets the position of the top-left corner of the frame area of the 'window'.
		//void WindowGetFramePosition( DocumentWindow window, NumberVariable x, NumberVariable y ) 
		//Gets the position of the top-left corner of the frame area of the 'window'.
		//void WindowSelect( DocumentWindow window )
		//Brings 'window' to the front. 
		if(!ViewWindow.WindowIsValid()){
			return;
		} else {
			WindowSelect( ViewWindow );
			UpdateImage(ViewImage);
		}
	}
	
	/* Function to get VIEW image xscale despite the mis-calibration of our 2100 and the use of a binning multiplier */
	number getViewScale(object self){
		number xscale=1;
		xscale = binningMultiplier * GetScriptObjectFromID(dataObjectID).getRefScale();
		return xscale;
	}
	
	
	// ************************************
	//  Component Drawing (no dependancies)
	// ************************************
	
	/* Function to draw the lines on an image used to centre the beam and pick spots (not the central ring marker)
		canEdit = 0 sets the lines to be non-selectable.
	*/
	
	void drawReticle(object self, image targetImage, number canEdit)
	{
		number centrex, centreY, radius, width, height;
		getSize(targetImage, width, height );
		
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

		if(canEdit == false)
		{
			// Make the lines not selectable.
			line1.ComponentSetSelectable(0);
			line2.ComponentSetSelectable(0);
			circle1.ComponentSetSelectable(0);
		}
	}
	
	/* Function to make the reticle, lines, etc. of any image deletable and selectable */
	void cleanReticle(object self, image targetImage)
	{
		ImageDisplay imageDisp = targetImage.ImageGetImageDisplay( 0 );
		Number compCount =  ComponentCountChildren( imageDisp );
		for(number i=0;i < compCount;i++){
			component annotid=imageDisp.ComponentGetChild(i);	
			annotid.ComponentSetSelectable(1);
			annotid.ComponentSetDeletable(1);
		}	
	}
	
	/* Function to draw the lines on the View Window used to centre the beam and pick spots.
		If updateToolkit = 1, Adds the ring marker and stores it in the toolkit.
		Also creates a text component to update with ring diameter.
	*/
	
	void drawReticleOnLiveView(object self)
	{		
		self.drawReticle(ViewImage, 0); // draw the aiming lines.
		
		Component comp = ViewImageDisplay;
		
		number width, height;
		getSize(ViewImage, width, height );
		
		number centreX = (width) / 2;
		number centreY = (height) / 2;
		
		/* This is the ring used to mark out a target for the ring collection method. */
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		number radius = 100; // Radius of the circle in pixels.
		number cTop, cBottom, cLeft, cRight;
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
		
		markerRing = newMarkerRing; // stores the marker ring object in the toolkit for future reference.

		/* This is the text component to display the ring radius. */
		string textString = "D-Spacing: ";
		// Add text annotations and set their colour, display mode and font
		component newRingRadiusText;
		newRingRadiusText=newtextannotation(10,height - 32, textString, 16);
		newRingRadiusText.componentsetfillmode(2);
		newRingRadiusText.componentsetdrawingmode(2);
		newRingRadiusText.componentsetforegroundcolor(1,0,0);
		newRingRadiusText.componentsetbackgroundcolor(0,0,0);
		newRingRadiusText.componentsetfontfacename("Microsoft Sans Serif");
	
		// Add the component to the image document
		comp.ComponentAddChildAtEnd( newRingRadiusText );
		ComponentSetVisible( newRingRadiusText, 1 ); // Show it initially
		newRingRadiusText.ComponentSetSelectable(0);
		ringRadiusText = newRingRadiusText;
	}
	
	/* Code run to link an active View image / window to the Toolkit and set up short cut keys and things.
		Requires DataObject	
	*/
	
	void captureViewScreen (object self)
	{
		self.findLiveView();
		self.updateEMstatus();
		
		if(AllowControl == false){
			result("\n\nNo Control Permitted. Ensure a live view window is active and the microscope is online.");
			return;
		}
		GetScriptObjectFromID(dataObjectID).setCentreTiltHere(); // set this here to avoid false tilt values.
		if(debugMode == true){result("\nCapturing View Window...");}
		if(self.storeCameraDetails() == 0){  // Stores camera width, height and binning multiplier.
			result("\nError finding camera information.");
			throw("Error finding Camera Information");
		}
		
		self.drawReticleOnLiveView();
		if(debugMode==1){result("\n\tReticle added to View window.");}

		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScaleString(scaleString);
		if(debugMode==1){
			result("\n\tThe View window scale was initially set to " + GetScriptObjectFromID(dataObjectID).getOriginalScale() + " " + GetScriptObjectFromID(dataObjectID).getOriginalScaleString());
		}
		return;
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
		component greenCircle;
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
		Select the component to make it easy to see and work with. */
	
	void toggleMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
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
		return;
	}
	
	/* Function to update a text component with the radius of a diffraction ring. */
	void updateRadius (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		if(debugMode==true){result("\n\tUpdating Radius...");}
		// void ComponentGetBoundingRect( Component comp, NumberVariable t, NumberVariable l, NumberVariable b, NumberVariable r )
		number measuredRadiusPX, measuredRadiusNM, top, bottom, left, right, scaleX, scaleY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		if(debugMode==true){result("\nmeasuredRadiusPX = " + measuredRadiusPX);}
		scaleX = self.getViewScale();
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		measuredRadiusNM = measuredRadiusPX * scaleX;
		number measureRadiusAngstrom = 10 / measuredRadiusNM;
		ringRadiusText.TextAnnotationSetText("D-Spacing: " + measuredRadiusNM + " (1/nm)   /   " + measureRadiusAngstrom + " A");
		return;
	}
	
	/* Function to set the markerRing to a desired radius (in 1/nm) */
	
	void setRingRadius (object self, number desiredRadiusNM)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		number measuredRadiusPX, desiredRadiusPX, top, bottom, left, right, scaleX, scaleY, centreX, centreY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		centreX = right - measuredRadiusPX;
		centreY = bottom - measuredRadiusPX;
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = self.getViewScale();
		desiredRadiusPX = desiredRadiusNM / scaleX;
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		if(debugMode==true){result("\ndesiredRadiusNM: " + desiredRadiusNM + " (1/nm)");}
		
		top = centreY + desiredRadiusPX;
		bottom = centreY - desiredRadiusPX;
		right = centreX + desiredRadiusPX;
		left = centreX - desiredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
		return;
	}

	/* Function to put the marker ring back on the central spot and make it circular. */
	void recenterMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		number top, bottom, left, right, centreX, centreY;
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
		return;
	}

	/* Function to return the radius of the marker ring in pixels for unbinned images */
	
	 number markerRingRadius(object self)
	 {
		number beamPixelCentreX, beamPixelCentreY, tiltVectorX, tiltVectorY, targetRadiusPX, scaleX, scaleY;
		scaleX = GetScriptObjectFromID(dataObjectID).getRefScale(); // Scales for an unbinned image
		scaleY = GetScriptObjectFromID(dataObjectID).getRefScale(); 
		beamPixelCentreX = cameraWidth / 2;
		beamPixelCentreY = cameraHeight / 2;
		
		number top, bottom, left, right;
		markerRing.ComponentGetRect(top, left, bottom, right );
		if(debugMode==true){result("\nRing rectangle: " + top + ", " + left + ", " + bottom + ", " + right);}
		
		targetRadiusPX = ( right - left )/2;
		if(debugMode==true){result("\nRing radius measured as: " + targetRadiusPX + "px");}
		targetRadiusPX = targetRadiusPX * binningMultiplier;
		if(debugMode==true){result("\nAt full scale this is: " + targetRadiusPX + "px");}
		return targetRadiusPX;
	 }
	
	void initialise(object self, number theToolkitID, number theDataObjectID){
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		
		self.findLiveView(); // Look for a Live View window and store it.
		self.updateEMstatus(); // set the AllowControl variable. Uses results of findLiveView and checks if microscope is turned on.
		
		DFExposure = GetScriptObjectFromID(dataObjectID).getDFExposure(); // # of seconds to expose the camera for taking DarkField images.
		DPExposure = GetScriptObjectFromID(dataObjectID).getDPExposure(); // # of seconds to expose the camera for taking Diffraction Pattern images.
		BFExposure = GetScriptObjectFromID(dataObjectID).getBFExposure(); // # of seconds to expose the camera for taking BrightField images.

		// Default starting values for the different imaging modes. A way to edit these can be added later.
		DiffractionModes = GetScriptObjectFromID(dataObjectID).getDiffractionModes();
		ImagingModes = GetScriptObjectFromID(dataObjectID).getImagingModes();
		
		// The CameraControlObject can try to capture the view screen here since this initialisation is done on start up only.
		if(ViewImage.ImageIsValid()){
			self.captureViewScreen();
		}
	}
	
	// constructor
	CameraControl(object self){
		CameraControlID = self.ScriptObjectGetID();
	}
	
	// destructor
	~CameraControl(object self){
		if(debugMode == 1){result("\nCameraControl object " + self.ScriptObjectGetID() + " deleted.");}
	}
}

// ********************************************************************************
//  Live View Controls
// ********************************************************************************

// Requires functions/data from:
//		DataObject
// 		Camera Control Object

// functions relating to the Live view window.
//		Markers and components
//		Identifying the view window

class LiveViewControlsClass
{
	number LiveViewControlsID;
	number dataObjectID;
	number ToolkitID;
	number CameraControlObjectID;
	number debugMode;
	
	/* These are components displayed on the Live View Window which the user interacts with */
	component markerRing;
	component ringRadiusText;
	
	/* The various aspects of the View Window the toolkit needs to know about */
	DocumentWindow ViewWindow;
	Image ViewImage;
	ImageDocument ViewImageDocument;
	ImageDisplay ViewImageDisplay;
	
	
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in LiveViewControls");}
	}
	
	// ************************************
	//  IMAGE / WINDOW ID AND POSITIONING
	// ************************************

	/* Function to locate and store the VIEW window and its various components.
			It will return 1 if the window is found and 0 if it is not present
	*/
	
	number findLiveView (object self){
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
			viewImageDocument = viewWindow.ImageWindowGetImageDocument();
			viewImage := viewImageDocument.ImageDocumentGetImage(0);
			viewImageDisplay = viewImage.ImageGetImageDisplay(0);
			return 1;
		}
	}
	
	/* Function to return the VIEW window to a variable.
		It will return 1 if the window is real and 0 if it has not been set. */
	
	number returnViewWindow(object self, DocumentWindow &theViewWindow)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewWindow = viewWindow;
			return 1;
		}
	}

	
	/* Function to pass the VIEW window's image document to other functions.
			It will return 1 if the window is real and 0 if it has not been set. */
	
	number returnViewImageDocument(object self, ImageDocument &theViewImageDocument)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImageDocument = ViewImageDocument;
			return 1;
		}
	}

	/* Function to pass the VIEW window's image to other functions.
		It will return 1 if the window is real and 0 if it has not been set. */
		
	number returnViewImage(object self, image &theViewImage)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImage := ViewImage;
			return 1;
		}
	}

	/* Function to pass the VIEW window's imageDisplay to other functions.
		It will return 1 if the window is real and 0 if it has not been set. */
		
	number  returnViewImageDisplay(object self, imageDisplay &theViewImageDisplay)
	{
		if(!ViewWindow.WindowIsValid()){
			result("\nView window not present.");
			return 0;
		} else {
			theViewImageDisplay = ViewImageDisplay;
			return 1;
		}
	}

	/* Function to reposition the window positions when debug mod */
	
	void positionViewWindow(object self)
	{
		//void WindowSetFramePosition( DocumentWindow window, Number x, Number y ) 
		//Sets the position of the top-left corner of the frame area of the 'window'.
		//void WindowGetFramePosition( DocumentWindow window, NumberVariable x, NumberVariable y ) 
		//Gets the position of the top-left corner of the frame area of the 'window'.
		//void WindowSelect( DocumentWindow window )
		//Brings 'window' to the front. 
		if(!ViewWindow.WindowIsValid()){
			return;
		} else {
			WindowSelect( ViewWindow );
			UpdateImage(ViewImage);
		}
	}
	
	// ************************************
	//  Component Drawing (no dependancies)
	// ************************************
	
	/* Function to draw the lines on an image used to centre the beam and pick spots (not the central ring marker)
		canEdit = 0 sets the lines to be non-selectable.
	*/
	
	void drawReticle(object self, image targetImage, number canEdit)
	{
		number centrex, centreY, radius, width, height;
		getSize(targetImage, width, height );
		
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

		if(canEdit == false)
		{
			// Make the lines not selectable.
			line1.ComponentSetSelectable(0);
			line2.ComponentSetSelectable(0);
			circle1.ComponentSetSelectable(0);
		}
	}
	
	/* Function to make the reticle, lines, etc. of any image deletable and selectable */
	void cleanReticle(object self, image targetImage)
	{
		ImageDisplay imageDisp = targetImage.ImageGetImageDisplay( 0 );
		Number compCount =  ComponentCountChildren( imageDisp );
		for(number i=0;i < compCount;i++){
			component annotid=imageDisp.ComponentGetChild(i);	
			annotid.ComponentSetSelectable(1);
			annotid.ComponentSetDeletable(1);
		}	
	}
	
	/* Function to draw the lines on the View Window used to centre the beam and pick spots.
		If updateToolkit = 1, Adds the ring marker and stores it in the toolkit.
		Also creates a text component to update with ring diameter.
	*/
	
	void drawReticleOnLiveView(object self)
	{		
		self.drawReticle(ViewImage, 0); // draw the aiming lines.
		
		Component comp = ViewImageDisplay;
		
		number width, height;
		getSize(ViewImage, width, height );
		
		number centreX = (width) / 2;
		number centreY = (height) / 2;
		
		/* This is the ring used to mark out a target for the ring collection method. */
		//Component NewOvalAnnotation( Number top, Number left, Number bottom, Number right )
		number radius = 100; // Radius of the circle in pixels.
		number cTop, cBottom, cLeft, cRight;
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
		
		markerRing = newMarkerRing; // stores the marker ring object in the toolkit for future reference.

		/* This is the text component to display the ring radius. */
		string textString = "D-Spacing: ";
		// Add text annotations and set their colour, display mode and font
		component newRingRadiusText;
		newRingRadiusText=newtextannotation(10,height - 32, textString, 16);
		newRingRadiusText.componentsetfillmode(2);
		newRingRadiusText.componentsetdrawingmode(2);
		newRingRadiusText.componentsetforegroundcolor(1,0,0);
		newRingRadiusText.componentsetbackgroundcolor(0,0,0);
		newRingRadiusText.componentsetfontfacename("Microsoft Sans Serif");
	
		// Add the component to the image document
		comp.ComponentAddChildAtEnd( newRingRadiusText );
		ComponentSetVisible( newRingRadiusText, 1 ); // Show it initially
		newRingRadiusText.ComponentSetSelectable(0);
		ringRadiusText = newRingRadiusText;
	}
	
	/* Code run to link an active View image / window to the Toolkit and set up short cut keys and things.
		Requires CameraControlObject and DataObject	
	*/
	void captureViewScreen (object self)
	{
		GetScriptObjectFromID(CameraControlObjectID).updateEMstatus();
		if(GetScriptObjectFromID(CameraControlObjectID).getAllowControl() == 0){
			result("\nNo Control Permitted. Ensure a live view window is active.")
			return;
		}
		GetScriptObjectFromID(dataObjectID).setCentreTiltHere(); // set this here to avoid false tilt values.
		if(debugMode){result("\nCapturing View Window...");}
		if(GetScriptObjectFromID(CameraControlObjectID).storeCameraDetails() == 0){  // Stores camera width, height and binning multiplier.
			result("\nError finding camera information.");
			throw("Error finding Camera Information");
		}
		
		if( self.findLiveView() == 0){
			result("\nNo View Display found.");
			return;
		}
		
		self.drawReticleOnLiveView();
		if(debugMode==1){result("\n\tReticle added to View window.");}

		number scaleX = ImageGetDimensionScale( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScale(scaleX);
		string scaleString = ImageGetDimensionUnitString( viewImage, 0 );
		GetScriptObjectFromID(dataObjectID).setOriginalScaleString(scaleString);
		if(debugMode==1){result("\n\tThe View window scale was initially set to " + GetScriptObjectFromID(dataObjectID).getOriginalScale() + " " + GetScriptObjectFromID(dataObjectID).getOriginalScaleString());}
		return;
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
		component greenCircle;
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
		Select the component to make it easy to see and work with. */
	
	void toggleMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
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
		return;
	}
	
	/* Function to update a text component with the radius of a diffraction ring. */
	void updateRadius (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		if(debugMode==true){result("\n\tUpdating Radius...");}
		// void ComponentGetBoundingRect( Component comp, NumberVariable t, NumberVariable l, NumberVariable b, NumberVariable r )
		number measuredRadiusPX, measuredRadiusNM, top, bottom, left, right, scaleX, scaleY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		if(debugMode==true){result("\nmeasuredRadiusPX = " + measuredRadiusPX);}
		scaleX = GetScriptObjectFromID(CameraControlObjectID).getViewScale();
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		measuredRadiusNM = measuredRadiusPX * scaleX;
		number measureRadiusAngstrom = 10 / measuredRadiusNM;
		ringRadiusText.TextAnnotationSetText("D-Spacing: " + measuredRadiusNM + " (1/nm)   /   " + measureRadiusAngstrom + " A");
		return;
	}
	
	/* Function to set the markerRing to a desired radius (in 1/nm) */
	void setRingRadius (object self, number desiredRadiusNM)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		number measuredRadiusPX, desiredRadiusPX, top, bottom, left, right, scaleX, scaleY, centreX, centreY;
		markerRing.ComponentGetBoundingRect( top, left, bottom, right );
		measuredRadiusPX = (bottom - top) / 2;
		centreX = right - measuredRadiusPX;
		centreY = bottom - measuredRadiusPX;
		number binningMultiplier = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		if((binningMultiplier==0) || (binningMultiplier.isNaN())){
			throw("Please calibrate the toolkit first");
		}
		scaleX = GetScriptObjectFromID(CameraControlObjectID).getViewScale();
		desiredRadiusPX = desiredRadiusNM / scaleX;
		if(debugMode==true){result("\nscaleX = " + scaleX);}
		if(debugMode==true){result("\ndesiredRadiusNM: " + desiredRadiusNM + " (1/nm)");}
		
		top = centreY + desiredRadiusPX;
		bottom = centreY - desiredRadiusPX;
		right = centreX + desiredRadiusPX;
		left = centreX - desiredRadiusPX;
		markerRing.ComponentSetRect( top, left, bottom, right );
		return;
	}

	/* Function to put the marker ring back on the central spot and make it circular. */
	void recenterMarkerRing (object self)
	{
		if(!markerRing.ComponentIsValid()){
			result("\nNo marker ring found");
			return;
		}
		number top, bottom, left, right, centreX, centreY;
		number binningMultiplier = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
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
		return;
	}

	/* Function to return the radius of the marker ring in pixels for unbinned images */
	
	 number markerRingRadius(object self)
	 {
		number cameraWidth = GetScriptObjectFromID(CameraControlObjectID).getCameraWidth();
		number cameraHeight = GetScriptObjectFromID(CameraControlObjectID).getCameraHeight();
		number binning = GetScriptObjectFromID(CameraControlObjectID).getBinningMultiplier();
		number beamPixelCentreX, beamPixelCentreY, tiltVectorX, tiltVectorY, targetRadiusPX, scaleX, scaleY;
		scaleX = GetScriptObjectFromID(dataObjectID).getRefScale(); // Scales for an unbinned image
		scaleY = GetScriptObjectFromID(dataObjectID).getRefScale(); 
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
	 
	 

	// Constructor
	LiveViewControlsClass(object self)
	{
		LiveViewControlsID = self.ScriptObjectGetID(); // Tell the object its own ID number
	}
	
	// Destructor
	~LiveViewControlsClass(object self)
	{
		result("\nLiveViewControl object with ID " + self.ScriptObjectGetID() + " deleted.");
	}
	
	// loads important variables into the object
	void initialise(object self, number theToolkitID, number theDataObjectID, number theCameraControlObjectID)
	{
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		CameraControlObjectID = theCameraControlObjectID;
		self.findLiveView();
		if(debugMode==1){result("\n LiveViewControls initialised.");}
	}
	
	void printAllValues(object self)
	{
		result("\n\n Live View Window Controls Debug Values");
		result("\n------------------------")
		string textstring;
		textstring = "\n LiveViewControlsIDObjectID: " + LiveViewControlsID +\
			"\n CameraControlObjectID: " + CameraControlObjectID +\
			"\n DebugMode: " + debugMode +\
			"\n dataObjectID: " + dataObjectID;			
		result(textstring);
		result("\n-------End----------------");
	}
	 
}

// ********************************
//	Imaging Configuration Dialog
// ********************************
// When creating a new image set and preparing to take darkfield images this dialog can be used to select the image set settings.
// Not used to process or view completed image sets, which will have to show images and things.
// an imageset is created ouside the dialog and passed to this local store. If values are kept it will create a new image set or overwrite the existing image set of the same ID.
// when starting to save DPs it will create a new image set. All settings can be changed except set ID.
// when starting darkfield imaging it will over-write or update. At this point it can only change image save settings (and notes when i get them working)

class ImageConfiguration : uiframe
{
	// Global variables
	number imageConfigurationID; // Used by child dialog to return values to parent.
	object childDialog; // Store a clone of this dialog here for repeated use.
	TagGroup returnedSettings; // Used by child dialog to return values to parent.
	number dataObjectID;
	number toolkitID;
	number ImageSetToolsID;
	number debugMode;
	TagGroup LocalImageSet; 
	
	void takeImageConfiguration(object self, tagGroup settingsGroup){ // updates the returnedSettings object
		if(debugMode == true){
			result("\n Image Configuration from a child object has been handed to the parent object. Stored in returnedSettings");
		}
		returnedSettings = settingsGroup;
	}
	
	// Uses the LocalImageSet with the Image Tool function addImageSet().
	// The Image Tool function decides what to do with the data, so it does not matter to the Image Config function what Tag group is sent forwards.
	void addImageSetToImageList(object self){
		if(debugMode == true){
			result("\n The stored imageConfig settings will now be used to update/create an ImageSet");
		}
		GetScriptObjectFromID(ImageSetToolsID).addImageSet(returnedSettings);
	}
	
	// Tells the dialog what Toolkit it belongs to and which dataObject to use.
	// Uses Weak Referencing so it can go out of scope once the Toolkit is destroyed.
	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		ImageSetToolsID = theImageSetToolsID;
	}
	
	/* Function to create the dialog (minus the OK/Cancel buttons)
		In order to set the field valus etc. the dialog must be displayed, but as a modal dialog this cannot be done easily.
		Therefore this function must also pre-load the initial values using the LocalImageSet tag group.
			LocalImageSet must be set before calling this function.
	
	*/
	TagGroup createFields (object self){
		if(debugMode==1){result("\n\tCreating fields for ImageSet Config dialog.");}
		taggroup box_items
		taggroup box=dlgcreatebox("Configure Image Set", box_items)
		box.dlgexternalpadding(5,3).dlginternalpadding(12,5)
		
		// Get the variables...
		string imageSetNameString, imageSetID, imageSetNotes;
		number RingMode, NumberOfRingPoints, RingDSpacing, DegreeStep, IntegratedImage, NumberOfIntegrations;
		number AutoSaveNonInt, AutoDisplayNonInt, shadowMode, ShadowDistance, AutoSaveImages, AutoDisplayImages;
		
		// ring mode values
		LocalImageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		LocalImageSet.TagGroupGetTagAsNumber("NumberOfRingPoints", NumberOfRingPoints);
		LocalImageSet.TagGroupGetTagAsNumber("RingDSpacing", RingDSpacing);
		LocalImageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// integration
		LocalImageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		LocalImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		LocalImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", AutoSaveNonInt);
		LocalImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", AutoDisplayNonInt);
		
		// shadow settings
		LocalImageSet.TagGroupGetTagAsNumber("ShadowMode", ShadowMode);
		LocalImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		
		// save image settings
		LocalImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages);
		LocalImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages);
		LocalImageSet.TagGroupGetTagAsString("SetName", imageSetNameString);
		LocalImageSet.TagGroupGetTagAsString("ImageSetID", imageSetID);
		LocalImageSet.TagGroupGetTagAsString("ImageNotes", imageSetNotes);
		
		number ImagesTaken, DPsTaken;
		LocalImageSet.TagGroupGetTagAsNumber("ImagesTaken", ImagesTaken);
		LocalImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken);
		
		TagGroup ImageSetNameLabel = DLGCreateLabel("Image Set Name: ");
		TagGroup ImageSetNameField = DLGCreateStringField(imageSetNameString, 20, "changedImageSetName" ).dlgidentifier("ImageSetNameField");		
		TagGroup ImageSetIDLabel = DLGCreateLabel("Image Set ID: ");
		TagGroup ImageSetIDField = DLGCreateStringField(imageSetID, 20).dlgidentifier("ImageSetIDField");
		taggroup ImageSetTitle = dlggroupitems(ImageSetNameLabel, ImageSetNameField, ImageSetIDLabel, ImageSetIDField ).dlgtablelayout(4,1,0);
		
		// Integration Mode
		TagGroup IntegrationLabel = DLGCreateLabel("Integration Title");
		TagGroup IntegrationMode = DLGCreateCheckBox( "Integrated Images", IntegratedImage, "changedIntegrationMode" ).dlgidentifier("IntegrationModeCheckBox");
		TagGroup IntegrationDistanceLabel = DLGCreateLabel("# of images per integration:")
		TagGroup IntegrationNumber = DLGCreateIntegerField(  NumberOfIntegrations, 10, "changedIntegrationDistance" ).dlgidentifier("IntegrationDistanceField");
		TagGroup IntDistArea = dlggroupitems(IntegrationDistanceLabel, IntegrationNumber).dlgtablelayout(2,1,0);
		TagGroup SaveNonInt = DLGCreateCheckBox( "Save Non-Integrated Images", AutoSaveNonInt, "changedSaveNonIntImages" ).dlgidentifier("SaveNonIntImagesCheckBox");
		TagGroup DisplayNonInt = DLGCreateCheckBox( "Display Non-Integrated Images", AutoDisplayNonInt, "changedDisplayNonIntImages" ).dlgidentifier("DisplayNonIntImagesCheckBox");
		TagGroup IntSavesArea = dlggroupitems(SaveNonInt, DisplayNonInt).dlgtablelayout(1,2,0)
		TagGroup IntegrationArea = dlggroupitems(IntegrationLabel, IntegrationMode, IntDistArea, IntSavesArea).dlgtablelayout(1,4,0)
		
		// Shadow Mode
		TagGroup ShadowLabel = DLGCreateLabel("Shadowing Title");
		TagGroup ShadowState = DLGCreateCheckBox( "Shadow Images", shadowMode, "changedShadowMode" ).dlgidentifier("ShadowModeCheckBox");
		TagGroup ShadowDistanceLabel = DLGCreateLabel("Shadow Distance (1/nm):");
		TagGroup ShadowDistanceField = DLGCreateRealField(  shadowDistance, 10, 1, "changedShadowDistance" ).dlgidentifier("ShadowDistanceField");
		TagGroup ShadowDistanceValues = dlggroupitems(ShadowDistanceLabel, ShadowDistanceField).dlgtablelayout(2,1,0);
		TagGroup ShadowArea = dlggroupitems(ShadowLabel, ShadowState, ShadowDistanceValues).dlgtablelayout(1,3,0);
		
		// Ring Mode
		TagGroup RingLabel = DLGCreateLabel("Ring Title");
		TagGroup RingState = DLGCreateCheckBox( "Ring Mode", RingMode, "changedRingMode" ).dlgidentifier("RingModeCheckBox");
		TagGroup DSpacingLabel = DLGCreateLabel("DSpacing (Angstroms):")
		TagGroup DSpacingField = DLGCreateRealField(  RingDSpacing, 10, 1, "changedDSpacing" ).dlgidentifier("DSpacingField");
		TagGroup DSpacingValues = dlggroupitems(DSpacingLabel, DSpacingField).dlgtablelayout(2,1,0);
		TagGroup NumberOfRingPointsLabel = DLGCreateLabel("# of spots to image:")
		TagGroup NumberOfRingPointsLabelField = DLGCreateIntegerField(  numberOfRingPoints, 10, "changedNumberOfRingPoints" ).dlgidentifier("NumberOfRingPointsLabelField");
		TagGroup NumberOfRingsValue = dlggroupitems(NumberOfRingPointsLabel, NumberOfRingPointsLabelField).dlgtablelayout(2,1,0)
		TagGroup RingArea = dlggroupitems(RingLabel, RingState, DSpacingValues, NumberOfRingsValue).dlgtablelayout(1,4,0)
		
		// Save/Display General
		TagGroup autoSaveMode = DLGCreateCheckBox( "Auto-Save Images", AutoSaveImages, "changedSaveMode" ).dlgidentifier("SaveModeCheckBox");
		TagGroup displayImagesMode = DLGCreateCheckBox( "Display Images", AutoDisplayImages, "changedDisplayImagesMode" ).dlgidentifier("DisplayImagesModeCheckBox");
		TagGroup FileArea = dlggroupitems(autoSaveMode, displayImagesMode).dlgtablelayout(1,2,0);
 
		TagGroup ImageNotes = DLGCreateStringField( imageSetNotes, 20, "changedImageSetNotes" ).dlgidentifier("ImageNotesTextBox");
		
		box_items.DLGAddElement(ImageSetTitle);
		box_items.DLGAddElement(IntegrationArea);
		box_items.DLGAddElement(ShadowArea);
		box_items.DLGAddElement(RingArea);
		box_items.DLGAddElement(FileArea);
		box_items.DLGAddElement(ImageNotes);
	
		// Enable / Disable inputs based on image set values. Taken from updateDialog() function.
		
		// use self.LookUpElement("StopButton").DLGEnabled(0)
		
		ImageSetIDField.DLGEnabled(0); // this is always auto-generated
		
		if(IntegratedImage==1){ // can always change these values, as it does not affect the others.
			SaveNonInt.DLGEnabled(1);
			DisplayNonInt.DLGEnabled(1);
			IntegrationNumber.DLGEnabled(1);
		} else {
			SaveNonInt.DLGEnabled(0);
			DisplayNonInt.DLGEnabled(0);
			IntegrationNumber.DLGEnabled(0);
		}
		
		if(shadowMode==1 && DPsTaken == 0){
			ShadowDistanceField.DLGEnabled(1);
		} else {
			ShadowDistanceField.DLGEnabled(0);
		}
		
		if(RingMode==1 && DPsTaken == 0){
			DSpacingField.DLGEnabled(1);
			NumberOfRingPointsLabelField.DLGEnabled(1);	
		} else {
			DSpacingField.DLGEnabled(0);
			NumberOfRingPointsLabelField.DLGEnabled(0);
		}
		
		if(DPsTaken == 1){
			if(debugMode==true){result("\nDPs taken, disabling most switches.");}
			IntegrationMode.DLGEnabled(0);
			ShadowState.DLGEnabled(0);
			RingState.DLGEnabled(0);
		}

	
		return box;
	}
	
	/* Fills the fields with the data from an ImageSet and enables/disables the fields */
	/* Feed it the LocalImageSet to update it. */
	
	number updateDialog(object self, TagGroup ImageSet){
		if(debugMode==true){result("\nUpdating image set configuration dialog.");}
		number ImagesTaken, DPsTaken;
		string ImageSetID
		ImageSet.TagGroupGetTagAsNumber("ImagesTaken", ImagesTaken);
		ImageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken);
		if(ImagesTaken == 1){
			result("\nAttempted to load Image set " + ImageSetID + " in the configuration dialog, but image set has all ready been taken and cannot be configured.");
			return 0;
		}
		
		// Get the variables...
		number RingMode, NumberOfRingPoints, RingDSpacing, DegreeStep, IntegratedImage, NumberOfIntegrations;
		number AutoSaveNonInt, AutoDisplayNonInt, shadowMode, ShadowDistance, AutoSaveImages, AutoDisplayImages;
		
		// ring mode values
		ImageSet.TagGroupGetTagAsNumber("RingMode", RingMode);
		ImageSet.TagGroupGetTagAsNumber("NumberOfRingPoints", NumberOfRingPoints);
		ImageSet.TagGroupGetTagAsNumber("RingDSpacing", RingDSpacing);
		ImageSet.TagGroupGetTagAsNumber("DegreeStep", DegreeStep);
		
		// integration
		ImageSet.TagGroupGetTagAsNumber("IntegratedImage", IntegratedImage);
		ImageSet.TagGroupGetTagAsNumber("NumberOfIntegrations", NumberOfIntegrations);
		ImageSet.TagGroupGetTagAsNumber("AutoSaveNonInt", AutoSaveNonInt);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayNonInt", AutoDisplayNonInt);
		
		// shadow settings
		ImageSet.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		ImageSet.TagGroupGetTagAsNumber("ShadowMode", ShadowMode);
		
		ImageSet.TagGroupGetTagAsNumber("AutoSaveImages", AutoSaveImages);
		ImageSet.TagGroupGetTagAsNumber("AutoDisplayImages", AutoDisplayImages);
		
		string imageSetNameString, imageSetNotes;
		ImageSet.TagGroupGetTagAsString("SetName", imageSetNameString);
		ImageSet.TagGroupGetTagAsString("ImageNotes", imageSetNotes);
		
		self.SetElementIsEnabled("ImageSetIDField", 0); // this is always auto-generated
		self.SetElementIsEnabled("ImageNotesTextBox", 1); // this is always available for editing.
		
		if(IntegratedImage==1){ // can always change these values, as it does not affect the others.
			self.SetElementIsEnabled("SaveNonIntImagesCheckBox", 1);
			self.SetElementIsEnabled("DisplayNonIntImagesCheckBox", 1);
			self.SetElementIsEnabled("IntegrationDistanceField", 1);
		} else {
			self.SetElementIsEnabled("SaveNonIntImagesCheckBox", 0);
			self.SetElementIsEnabled("DisplayNonIntImagesCheckBox", 0);
			self.SetElementIsEnabled("IntegrationDistanceField", 0);
		}
		
		if(shadowMode==1 && DPsTaken == 0){
			self.SetElementIsEnabled("ShadowDistanceField", 1);
		} else {
			self.SetElementIsEnabled("ShadowDistanceField", 0);
		}
		
		if(RingMode==1 && DPsTaken == 0){
			self.SetElementIsEnabled("DSpacingField", 1);
			self.SetElementIsEnabled("NumberOfRingPointsLabelField", 1);	
		} else {
			self.SetElementIsEnabled("DSpacingField", 0);
			self.SetElementIsEnabled("NumberOfRingPointsLabelField", 0);
		}
		
		if(DPsTaken == 1){
			if(debugMode==true){result("\nDPs taken, disabling most switches.");}
			self.SetElementIsEnabled("IntegrationModeCheckBox", 0);
			self.SetElementIsEnabled("ShadowModeCheckBox", 0);
			self.SetElementIsEnabled("RingModeCheckBox", 0);
		}
		GetScriptObjectFromID(imageConfigurationID).takeImageConfiguration(LocalImageSet); // send changes to the parent object to be remembered.
		
	}
	
	/* Called when image set name is changed. This will update the LocalImageSet and then refresh the dialog with it. */
	void changedImageSetName(object self, tagGroup tg){ // tg is the source of the call
		string theValue = tg.DLGGetStringValue();
		LocalImageSet.TagGroupSetTagAsString("SetName", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedImageSetNotes(object self, tagGroup tg){ // tg is the source of the call
		string theValue = tg.DLGGetStringValue();
		LocalImageSet.TagGroupSetTagAsString("ImageNotes", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedIntegrationMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("IntegratedImage", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedIntegrationDistance(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("NumberOfIntegrations", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedSaveNonIntImages(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoSaveNonInt", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedDisplayNonIntImages(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoDisplayNonInt", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedShadowMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("ShadowMode", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedShadowDistance(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("ShadowDistance", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedRingMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("RingMode", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedDSpacing(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("RingDSpacing", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedNumberOfRingPoints(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("NumberOfRingPoints", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedSaveMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoSaveImages", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	void changedDisplayImagesMode(object self, tagGroup tg){ // tg is the source of the call
		number theValue = tg.DLGGetValue();
		LocalImageSet.TagGroupSetTagAsNumber("AutoDisplayImages", theValue);
		self.updateDialog(LocalImageSet);
	}
	
	/* Create the Dialog. Must be called before showScaleValueDialog. Uses the CreateFields function output */
	void generateDialog(object self){
	TagGroup position;
		position = DLGBuildPositionFromApplication();
		position.TagGroupSetTagAsTagGroup( "Width", DLGBuildAutoSize() );
		position.TagGroupSetTagAsTagGroup( "Height", DLGBuildAutoSize() );
		position.TagGroupSetTagAsTagGroup( "X", DLGBuildRelativePosition( "Inside", 1 ) );
		position.TagGroupSetTagAsTagGroup( "Y", DLGBuildRelativePosition( "Inside", 1 ) );
		self.super.init( self.createFields().dlgposition(position) );
	}
	
	/* Function to make the dialog visible on screen after it is constructed. */
	number showImageSettingsDialog(object self){
		// The local image set value has been assigned an image set by this point.
		return self.pose(); // displays dialog as modal; it will make the script wait until it is done, so the loops etc. must be started before this.
		// returns 1 if ok is pressed, 0 if cancelled
	}

	// Function used to summon forth the dialog for external functions. Dialog is Modal.
	// Returns 1 if ok button pressed, 0 if cancelled.
	// ImageSetID string is either an existing image set or "New" to create a new one.
	number inputNewCalibration(object self, string ImageSetID)
	{	
		if(debugMode==1){result("\nLoading Image Set: " + ImageSetID);}
		if(ImageSetID == "New"){
			LocalImageSet = GetScriptObjectFromID(ImageSetToolsID).createNewImageSet();
		} else {
			TagGroup OriginalImageSet;
			if( GetScriptObjectFromID(ImageSetToolsID).getImageSetByID(ImageSetID, OriginalImageSet) == 0){
				result("\nImageSetID " + ImageSetID + " was not found while trying to load an existing ImageSet for the InputNewCalibration function.")
				return 0;
			}
			LocalImageSet = TagGroupClone( OriginalImageSet ); // getImageSetByID will point at the set, so a copy is made here to prevent changing the imageSet data prematurely.
		}
		
		if(debugMode==1){result("\nCreating child dialog Object (image set configuration options)");}
		childDialog = self.ScriptObjectClone(); // Make a copy of itself and store it.
		if(debugMode==1){result("\nGenerating child dialog");}
		childDialog.generateDialog(); // Make the dialog for this copy
		if(debugMode==1){result("\nShowing child dialog");}
		number useValues = childDialog.showImageSettingsDialog();	// Display the child with Pose() system
		if(useValues == true){
		
		}
		childDialog = NULL; // NULL the childDialog so it will always go out of scope.
		return useValues; // Note, the image set from the childdialog will be stored in returnedSettings. It will either be an updated one, a new one or maybe nothing.
	}

	// The constructor
	ImageConfiguration(object self)
	{
		imageConfigurationID = self.ScriptObjectGetID();
	}
	
	// The destructor (does nothing)
	~ImageConfiguration(object self)
	{
		result("\nImage set configuration Dialog with ID: "+self.ScriptObjectGetID()+" closed.");
	}
		
	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Imageset configuration dialog.");}
	}
	
	/* Prints out the stored variables in the object */
	void printAll(object self)
	{
		result("\n\nImageConfiguration Debug Values")
		result("\n------------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + imageConfigurationID +\
			"\n DebugMode: " + debugMode +\
			"\n ToolkitID: " + ToolkitID +\
			"\n DataObjectID: " + DataObjectID +\
			"\n ImageSetToolsID: " + ImageSetToolsID;
		result(textstring);
		result("\n-------End----------------")
	}
}
// ********************************************************************************
//  Image Processing class.
// ********************************************************************************
// Taking this outside of Toolkit because it is getting crowded.
// Insert this class before the toolkit.
// Do not add any online-only functions. Used for data processing, not live imaging.

// NOT updated to use image tags or image set data.

class ImageProcessing
{
	number ImageProcessingID; // the ID of this object
	number ToolkitID; // the ID of the toolkit
	number dataObjectID;
	number imageSetToolsID;
	number imageAlignmentDialogID;
	number debugMode;	

	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID, number theAlignmentDialogID){
		ToolkitID = theToolkitID;
		dataObjectID = theDataObjectID;
		imageSetToolsID = theImageSetToolsID;
		imageAlignmentDialogID = theAlignmentDialogID;
	}

	void setDebugMode(object self, number input)
	{
		debugMode = input;
		if(debugMode == 1){result("\n\tDebug Mode Activated in Image Processing Object");}
	}
	
		/* Prints out the stored variables in the object */
	void printAll(object self)
	{
		result("\n\nImageProcessing Debug Values")
		result("\n------------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ImageProcessingID +\
			"\n DebugMode: " + debugMode +\
			"\n ToolkitID: " + ToolkitID +\
			"\n DataObjectID: " + DataObjectID +\
			"\n ImageSetToolsID: " + ImageSetToolsID +\
			"\n imageAlignmentDialogID: " + imageAlignmentDialogID;
		result(textstring);
		result("\n-------End----------------")
	}
	
	
	
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
		
		/* This part needs fixing to not use the raw camera size. */
		
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
			if(! GetScriptObjectFromID(imageAlignmentDialogID).alignTwoImages(thisImage, baseImage, offsetX, offsetY)){
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
			image alignedImage :=  GetScriptObjectFromID(imageAlignmentDialogID).createAlignedImage (thisImage, minXShift, minYShift, maxXShift, maxYShift, XShift, YShift);
			showImage(alignedImage);
		}
	}
	
	
		// constructor
	ImageProcessing(object self){
		ImageProcessingID = self.ScriptObjectGetID();
	}
	
	// destructor
	~ImageProcessing(object self){
		if(debugMode == 1){result("\nImageProcessing object deleted.");}
	}
}

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
	void initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID)
	{
		dataObjectID = theDataObjectID; // The ID of the dataObject
		ToolkitID = theToolkitID; // ID of the toolkit object this object will be kept inside of.
		ImageSetToolsID = theImageSetToolsID;
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
		number shadowValue, shadowDistance, DSpacingAng;
		DPImageTags.TagGroupGetTagAsNumber("ShadowValue", ShadowValue);
		DPImageTags.TagGroupGetTagAsNumber("ShadowDistance", ShadowDistance);
		DPImageTags.TagGroupGetTagAsNumber("DSpacingAng", DSpacingAng);
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
	
	void finalizeImageSet(object self){
		if(debugMode==true){result("\nFinalizing Image Set...");}
		
		/* These checking functions should be run before this function is called and inside the Toolkit.
		if(GetScriptObjectFromID(CameraControlObjectID).getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			exit(0);
		}
		if(GetScriptObjectFromID(ToolkitID).getIsCalibrated() == 0){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		ImageDisplay viewDisplay
		if(!returnViewImageDisplay(debugMode, viewDisplay)){
			throw("No Live View window found");
		}
		*/
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
		
		// Generate Ring Mode Coordinates
		if(RingMode == true){
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
			number RefScale = GetScriptObjectFromID(dataObjectID).getRefScale();
			
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
			
		number i;
		for(i=0; i < NumberOfSpots; i++){
			if(debugMode==true){result("\n\t Recording spot " + i + " (Middle)...");}
			TagGroup newDFImageData;
			image DPImage := self.takeDPImage( targetImageSet, i, "Middle", newDFImageData)
			if(debugMode==true){result("\n\t Exposure done.");}
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
				
				if(debugMode==true){result("\n\t Shadowing spot " + i + " (Lower)...");}
				DPImageLower := self.takeDPImage( targetImageSet, i, "Lower", lowerImageData);
				NewLowerDF = GetScriptObjectFromID(ImageSetToolsID).createNewImageForImageSet(lowerImageData);
				NewLowerDF.TagGroupSetTagAsString("ImageType", "DF");
				NewLowerDF.TagGroupSetTagAsNumber("ExposureTime", GetScriptObjectFromID(CameraControlObjectID).getDFExposure());
				// add the tag group to the new 'image' spot set
				NewSpotSet.TagGroupSetTagAsTagGroup("Lower", NewLowerDF);
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
		
		if(debugMode==true){result("\nAll Diffraction Patterns imaged. Setting DPsTaken flag to 1");}
		// update the image set to show that DP were taken.
		targetImageSet.TagGroupSetTagAsNumber("DPsTaken", 1);
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
						showImage( middleIntegratedImage.ImageClone() );
					}
					if(saveImages == true){
						fileName = "Integrated_Image_" + im + "_Middle";
						string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
						SaveAsGatan(middleIntegratedImage, filePath);
					}
					result("\nIntegrated " + NumberOfIntegrations + " exposures into Integrated Image " + im);
					middleIntegratedImage = middleIntegratedImage * 0; // Set old image to 0 for next integration sequence.
										
					if(HigherImage.TagGroupIsValid() == true){
						higherSumImage = higherSumImage + higherIntegratedImage;
						higherIntegratedImage.ImageSetName( "Integrated Image " + im + " Higher" );
						if(displayImages == true){
							showImage( higherIntegratedImage.ImageClone() );
						}
						if(saveImages == true){
							fileName = "Integrated_Image_" + im + "_Higher";
							string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
							SaveAsGatan(higherIntegratedImage, filePath);
						}
						higherIntegratedImage = higherIntegratedImage * 0; // Set old image to 0 for next integration sequence.
					}
					if(LowerImage.TagGroupIsValid() == true){
						lowerSumImage = lowerSumImage + lowerIntegratedImage;
						lowerIntegratedImage.ImageSetName( "Integrated Image " + im + " Lower" );
						if(displayImages == true){
							showImage( lowerIntegratedImage.ImageClone() );
						}
						if(saveImages == true){
							fileName = "Integrated_Image_" + im + "_Lower";
							string filePath = PathConcatenate(fileDirectory, fileName); // Construct the full file path for the save command.
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
	result("\n\t's' to store a diffraction spot's coordinates. (Disabled for testing)");
	result("\n\t'n' to cycle through any marked ROI points and the central beam location.")
	result("\n\t'p' to view the stored image sets.");
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
	number ImagingFunctionsID; // ID of the imagingFunctions object
	number CameraControlObjectID;
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
	image initialise(object self, number theToolkitID, number theDataObjectID, number theImageSetToolsID, number theImagingFunctionsID, number theCameraControlObjectID)
	{
			ToolkitID = theToolkitID;  // the ID of the Object which this entire handler is contained inside.
			dataObjectID = theDataObjectID;
			ImageSetToolsID = theImageSetToolsID;
			ImagingFunctionsID = theImagingFunctionsID;
			CameraControlObjectID = theCameraControlObjectID;
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

			if(keydescription.MatchesKeyDescriptor( "s" )) // STORE POINT
				{
					if(debugMode==true){result("\nYou pressed s to store this tilt.");}
					GetScriptObjectFromID(ImagingFunctionsID).StoreDP();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "n" )) // CYCLE THROUGH ROI
				{
					if(debugMode==true){result("\nYou pressed n to cycle through marked ROI.");}
					GetScriptObjectFromID(ImagingFunctionsID).moveToROI();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "0" )) // CENTRE BEAM
				{
					if(debugMode==true){result("\nYou pressed 0 to centralize the beam.");}
					// Centralize Beam
					GetScriptObjectFromID(CameraControlObjectID).beamCentre();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "p" )) // PRINT DATA
				{	
					if(debugMode==true){result("\nYou pressed p to examine stored Tilt Values.");}
					GetScriptObjectFromID(ImageSetToolsID).showImageSets();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "1" )) // TOGGLE MARKER RING
				{	
					// Make the Marker Ring and radius display visible/hidden;
					GetScriptObjectFromID(CameraControlObjectID).toggleMarkerRing();
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "2" )) // SET RING TO TARGET RADIUS IN 1/NM UNITS
				{
					number desiredRadiusNM;
					getNumber("Set Marker Ring to (1/nm): ", 2.00, desiredRadiusNM);
					GetScriptObjectFromID(CameraControlObjectID).setRingRadius(desiredRadiusNM);
					return 0;
				}
			if(keydescription.MatchesKeyDescriptor( "3" )) // UPDATE RADIUS MEASUREMENT TEXT
				{
					GetScriptObjectFromID(CameraControlObjectID).updateRadius();
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
//****************************************************
// TOOLKIT FUNCTIONS & CLASS
//****************************************************

// Contains the dialog that acts as the main control interface for the toolkit.
// This is the highest level object, with the other objects contained inside it. When this one closes, they all go out of scope.
// Currently has a lot of functions that make use of the child objects, rather than putting them in their own classes.
// The Image-taking functions in particular need to be seperated out for ease of management.

class DF360Dialog : uiframe
{
	number ToolkitID; // the ID of this object
	number debugMode;
	number EMOnline; // Stores 1 if there is a microscope ready for use. 0 if not.
	number AllowControl; // Only allow control of the microscope if there is a live view image.
	number isCalibrated; // flag to test if the scope is calibrated or not.
	
	/* These objects are the various classes that are brought together in the toolkit to provide functions and record values. */
	object dataObject;
	number dataObjectID;
	object imageSetTools;
	number imageSetToolsID;
	object KeyListener;
	number KeyListenerID;
	object imageAlignmentDialog;
	number imageAlignmentDialogID;
	object scaleCalibrationDialog;
	number scaleCalibrationDialogID;
	object tiltCalibrationDialog;
	number tiltCalibrationDialogID;
	object CameraControlObject;
	number CameraControlObjectID;
	object ImageProcessingObject;
	number ImageProcessingObjectID;
	object ImageConfigDialog;
	number ImageConfigDialogID;
	object ProgressBarDialog;
	number ProgressBarDialogID;
	object ImagingFunctionsObject;
	number ImagingFunctionsObjectID;
	
	// Function to print out the various saved variables for debugging. Will only work in Debug Mode
	void printAllValues(object self)
	{
		if(debugMode != 1){
			return;
		}
		result("\n\nToolkit Debug Values")
		result("\n------------------------")
		string textstring;
		textstring = "\n\tObjectID: " + ToolkitID +\
			"\n DebugMode: " + debugMode +\
			"\n EMonline: " + EMOnline +\
			"\n AllowControl: " + AllowControl +\
			"\n DataObjectID: " + DataObjectID + " and " + (dataObject.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\n KeyListenerID: " + KeyListenerID + " and " + (KeyListener.ScriptObjectIsValid() ? "is" : "is not") +" valid" +\
			"\n imageAlignmentDialogID: " + imageAlignmentDialogID + " and " + (imageAlignmentDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n imageSetToolsID: " + imageSetToolsID + " and " + (imageSetTools.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n scaleCalibrationDialogID: " + scaleCalibrationDialogID + " and " + (scaleCalibrationDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n tiltCalibrationDialogID: " + tiltCalibrationDialogID + " and " + (tiltCalibrationDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n CameraControlObjectID: " + CameraControlObjectID + " and " + (CameraControlObject.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n ImageProcessingObjectID: " + ImageProcessingObjectID + " and " + (ImageProcessingObject.ScriptObjectIsValid() ? "is" : "is not") + " valid"+\
			"\n ImageConfigDialogID: " + ImageConfigDialogID + " and " + (ImageConfigDialog.ScriptObjectIsValid() ? "is" : "is not") + " valid";
		result(textstring);
		result("\n-------End----------------")
		CameraControlObject.printAllValues();
		ImageSetTools.printAll();
		DataObject.printAll();
		ImagingFunctionsObject.printAllValues();
		ProgressBarDialog.printAllValues();
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

	
	/* The Toolkit will store the ImageSetTools object for future use. */
	number storeImageSetTools(object self, object &theImageSetTools)
	{
		imageSetTools = theImageSetTools;
		imageSetToolsID = imageSetTools.ScriptObjectGetID();
		imageSetTools.initialise(ToolkitID, dataObjectID);
		imageSetTools.setDebugMode(debugMode);
		return imageSetToolsID;
	}
	
	/* The Toolkit will store the KeyListener for future use. */
	number storeKeyListener(object self, object &theKeyListener)
	{
		KeyListener = theKeyListener;
		KeyListenerID = KeyListener.ScriptObjectGetID();
		KeyListener.initialise(ToolkitID, dataObjectID, imageSetToolsID, ImagingFunctionsObjectID, CameraControlObjectID);
		KeyListener.setDebugMode(debugMode);
		return KeyListenerID;
	}
	/* Attach the KeyListener to a display so it can function */
	void attachKeyListener(object self, imageDisplay theDisplay)
	{
		number keyToken = theDisplay.ImageDisplayAddKeyHandler(KeyListener, "HandleKey");
		if(debugmode==1){result("\nToolkit function: Attached key handler object to display. KeyToken = " + keyToken);}
		if(debugmode==1){result("\nToolkit function: Attempting to set the Keyhandler to Listen to the view display....");}
		KeyListener.startListening(keyToken);
		if(debugmode==1){result("\nToolkit function: Keyhandler is now listening.");}
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

	/* Store the scale calibration dialog for future use. */
	number storeCalibrationDialog(object self, object theCalibrationDialog)
	{
		scaleCalibrationDialog = theCalibrationDialog;
		scaleCalibrationDialogID = scaleCalibrationDialog.ScriptObjectGetID();
		scaleCalibrationDialog.initialise(ToolkitID, dataObjectID); // Tell the object who it belongs to
		scaleCalibrationDialog.setDebugMode(debugMode);
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
	
	/* Store the Camera Control object */
	void storeCameraControlObject(object self, object theCameraControlObject)
	{
		CameraControlObject = theCameraControlObject;
		CameraControlObjectID = CameraControlObject.ScriptObjectGetID();
		CameraControlObject.initialise(ToolkitID, dataObjectID);
		CameraControlObject.setDebugMode(debugMode);
	}

	/* Store the Image Processing object */
	void storeImageProcessingObject(object self, object theImageProcessingObject)
	{
		ImageProcessingObject = theImageProcessingObject;
		ImageProcessingObjectID = ImageProcessingObject.ScriptObjectGetID();
		ImageProcessingObject.initialise(ToolkitID, dataObjectID, imageSetToolsID, imageAlignmentDialogID); // Tell the object who it belongs to
		ImageProcessingObject.setDebugMode(debugMode);
	}
	
	/* Store the Image Configuration dialog object */
	void storeImageConfigDialog(object self, object theImageConfigDialog)
	{
		imageConfigDialog = theImageConfigDialog;
		imageConfigDialogID = imageConfigDialog.ScriptObjectGetID();
		imageConfigDialog.initialise(ToolkitID, dataObjectID, imageSetToolsID); // Tell the object who it belongs to
		imageConfigDialog.setDebugMode(debugMode);
	}

	void storeProgressBarDialog(object self, object theProgressBarDialog)
	{
		ProgressBarDialog = theProgressBarDialog;
		ProgressBarDialogID = ProgressBarDialog.ScriptObjectGetID();
		ProgressBarDialog.initialise(ToolkitID, dataObjectID, imageSetToolsID); // Tell the object who it belongs to
		ProgressBarDialog.setDebugMode(debugMode);
	}
	
	void storeImagingFunctionsObject(object self, object theImagingFunctionsObject)
	{
		ImagingFunctionsObject = theImagingFunctionsObject;
		ImagingFunctionsObjectID = ImagingFunctionsObject.ScriptObjectGetID();
		ImagingFunctionsObject.initialise(ToolkitID, dataObjectID, imageSetToolsID, CameraControlObjectID, ProgressBarDialogID);
		ImagingFunctionsObject.setDebugMode(debugMode);
	}
	
		
	void UpdateDebugMode(object self){
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
		if(scaleCalibrationDialog.ScriptObjectIsValid()){
			scaleCalibrationDialog.setDebugMode(debugMode);
		}
		if(tiltCalibrationDialog.ScriptObjectIsValid()){
			tiltCalibrationDialog.setDebugMode(debugMode);
		}
		if(ImageSetTools.ScriptObjectIsValid()){
			ImageSetTools.setDebugMode(debugMode);
		}
		if(ProgressBarDialog.ScriptObjectIsValid()){
			ProgressBarDialog.setDebugMode(debugMode);
		}
		if(ImagingFunctionsObject.ScriptObjectIsValid()){
			ImagingFunctionsObject.setDebugMode(debugMode);
		}
		if(CameraControlObject.ScriptObjectIsValid()){
			CameraControlObject.setDebugMode(debugMode);
		}
		if(ImageProcessingObject.ScriptObjectIsValid()){
			ImageProcessingObject.setDebugMode(debugMode);
		}
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

		// BUTTON METHODS are to be defined in the class definition;

		// The first panel is for calibration
		taggroup panel1=dlgcreatepanel()
		panel1.dlgaddelement(dlgcreatelabel("Calibration")) // Label
		panel1.dlgaddelement(dlgcreatelabel("")) // Blank
		panel1.DLGAddElement(self.makeCameraDropDownMenu() )
		TagGroup tiltCalibrationAutoButton = DLGCreatePushButton("CALIBRATE TILT", "startCalibrationButtonPress")
		panel1.dlgaddelement(tiltCalibrationAutoButton)
		panel1.dlgaddelement(dlgcreatelabel("Darkfield Exposure:"))
		number initialDFExposure = CameraControlObject.getDFExposure();
		TagGroup DarkfieldImagingExposure = DLGCreateRealField( initialDFExposure, 10, 3, "onDFChange").dlgidentifier("DarkfieldExposureFieldInput")
		panel1.dlgaddelement(DarkfieldImagingExposure)
		panel1.dlgaddelement(dlgcreatelabel("Brightfield Exposure:")) // Label
		number initialBFExposure = CameraControlObject.getBFExposure();
		TagGroup BrightfieldImagingExposure = DLGCreateRealField( initialBFExposure, 10, 3, "onBFChange").dlgidentifier("BrightfieldExposureFieldInput")
		panel1.dlgaddelement(BrightfieldImagingExposure)
		panel1.dlgaddelement(dlgcreatelabel("Diffraction Pattern Exposure:")) // Label
		number initialDPExposure = CameraControlObject.getDPExposure();
		TagGroup DiffractionImagingExposure = DLGCreateRealField( initialDPExposure, 10, 3, "onDPChange").dlgidentifier("DiffractionExposureFieldInput")
		panel1.dlgaddelement(DiffractionImagingExposure)
		TagGroup captureViewButton = DLGCreatePushButton("Capture Live View Window", "captureViewButtonPress");
		panel1.dlgaddelement(captureViewButton);
		
			// Arrange the buttons and things
		panel1.dlgtablelayout(2,6,0);
		
		// The second panel is for Image Sets. They can be created and configured here, and can have points added to them.
		taggroup panel2=dlgcreatepanel()
		panel2.dlgaddelement(dlgcreatelabel("Define Image Sets")) // Label
		TagGroup editImageSetButton = DLGCreatePushButton("Create/Configure Image Set", "EditImageSetButtonPress")
		panel2.dlgaddelement(editImageSetButton)
		TagGroup storePointButton = DLGCreatePushButton("Add Single Spot", "StoreDPButtonPress")
		panel2.dlgaddelement(storePointButton)
		TagGroup DarkFieldROIButton = DLGCreatePushButton("Add All ROI", "storeROIButtonPress")
		panel2.dlgaddelement(DarkFieldROIButton)
		TagGroup TakeDPImagesButton = DLGCreatePushButton("Finalise Image Set", "FinalizeImageSetButtonPress")
		panel2.dlgaddelement(TakeDPImagesButton)
		
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
		TagGroup debugModeCheckBox = DLGCreateCheckBox( "Debug Mode", debugMode, "onDebugOptionChange");
		panel6.dlgaddelement(debugModeCheckBox);
		TagGroup changeSaveDir = DLGCreatePushButton("Save Directory", "saveDirButtonPress");
		panel6.dlgaddelement(changeSaveDir);
		TagGroup enterScaleButton = DLGCreatePushButton("Set Scale", "enterScaleButtonPress");
		panel6.dlgaddelement(enterScaleButton);
		TagGroup manualTiltEntryButton = DLGCreatePushButton("Tilt Calibration", "manualTiltCalibrationButtonPress");
		panel6.dlgaddelement(manualTiltEntryButton);
		TagGroup saveSettingsToFile = DLGCreatePushButton("Save Settings File", "saveToolKitVariablesToFilePress");
		panel6.dlgaddelement(saveSettingsToFile);
		TagGroup loadSettingsFromFile = DLGCreatePushButton("Load Settings File", "loadToolkitVariablesFromFilePress");
		panel6.dlgaddelement(loadSettingsFromFile);
		TagGroup saveSettingsToDM = DLGCreatePushButton("Set as Default", "saveVariablesToMemoryPress");
		panel6.dlgaddelement(saveSettingsToDM);
		number initialModeWarningOption = (dataObject.getDisableModeWarnings() == false) ? 1 : 0;
		TagGroup DisableModeWarnings = DLGCreateCheckBox( "Show Mode Warnings", initialModeWarningOption, "onModeWarningOptionChange");
		panel6.dlgaddelement(DisableModeWarnings);
		TagGroup ExamineGTGFile = DLGCreatePushButton("View GTG file", "ExamineGTGFilePress");
		panel6.dlgaddelement(ExamineGTGFile);

		panel6.dlgtablelayout(2,12,0); // Arrange the buttons
		
		// Panel 7 is for final Imaging steps
		taggroup panel7=dlgcreatepanel()
		panel7.dlgaddelement(dlgcreatelabel("Dark Field Imaging")) // Label
		TagGroup DarkFieldStoredButton = DLGCreatePushButton("Start Imaging", "DarkFieldImageButtonPress")
		panel7.dlgaddelement(DarkFieldStoredButton)
		panel7.dlgaddelement(dlgcreatelabel("Image Processing")) // Label
		panel7.dlgaddelement(dlgcreatelabel("")) // Blank
		TagGroup LoadImageSetButton = DLGCreatePushButton("Load Image Set File", "LoadImageSetButtonPress")
		panel7.dlgaddelement(LoadImageSetButton)
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
	DF360Dialog(object self)
	{
		ToolkitID = self.ScriptObjectGetID();
		debugMode = 1;
		isCalibrated = 0;		
	}
		
	// Function called on any destruction event.
	~DF360Dialog(object self)
	{
		imageDisplay imgdisp;
		if(CameraControlObject.returnViewImageDisplay(imgdisp) == true){
			component annotid=imgdisp.ComponentGetChild(0)
			while (annotid.ComponentIsValid()){
				annotid.componentremovefromparent();
				annotid=imgdisp.ComponentGetChild(0);
			}
			CameraControlObject.beamCentre();
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
		
		CameraControlObject.updateEMstatus();
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
		
		// update camera
		CameraControlObject.storeCameraDetails();
		
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
		if(!CameraControlObject.returnViewImage(viewImage)){
			if(debugMode==true){result("\nNo View Window detected.");}
			return; // Stop here if no view window is there.
		}
		
		// View image scale
		number binning = CameraControlObject.getBinningMultiplier();

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
		if(CameraControlObject.getAllowControl() == 0){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and it has been captured.")
			return;
		}
		if (!ContinueCancelDialog( "Please Centre the beam before continuing..." )){
			return;
		}
		isCalibrated = ImagingFunctionsObject.startDPStoring();
		ImagingFunctionsObject.setIsCalibrated(isCalibrated);
	}
	
	/* Functions to change the exposure times when the fields on the Calibration Panel are changed by the user. */
	
	void onDFChange (object self, TagGroup tg)
	{
		number newDFExposure = tg.dlggetvalue();
		CameraControlObject.setDFExposure(newDFExposure);
		if(debugMode==true){result("\nDarkField Exposure time set to " + newDFExposure + " seconds");}
	}
	void onBFChange (object self, TagGroup tg)
	{
		number newBFExposure = tg.dlggetvalue();
		CameraControlObject.setBFExposure(newBFExposure);
		if(debugMode==true){result("\nBrightField Exposure time set to " + newBFExposure + " seconds");}
	}
	void onDPChange (object self, TagGroup tg)
	{
		number newDPExposure = tg.dlggetvalue();
		CameraControlObject.setDPExposure(newDPExposure);
		if(debugMode==true){result("\nDiffraction Pattern Exposure time set to " + newDPExposure + " seconds");}
	}	
	
		
	/* CONTROL PANEL BUTTON FUNCTIONS*/
	void beamCentreButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active.")
			return;
		}
		if(debugMode==true){result("\nCentralizing Beam");}
		CameraControlObject.beamCentre();
	}

		
	/* IMAGE PANEL BUTTON FUNCTIONS */
	
	void EditImageSetButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			return;
		}
		number useValues;
		TagGroup ImageSet
		if( ImageSetTools.getCurrentImageSet(ImageSet) == 0){
			// There is no current image set, so we must make a new one.
			useValues = ImageConfigDialog.inputNewCalibration("New");
		} else {
			// There is an existing image set, so use that one or make a new one.
			if ( TwoButtonDialog( "Do you wish to edit the existing Image Set?", "Yes", "No, make a new one" ) == 0){
				// Do not use existing one...
				useValues = ImageConfigDialog.inputNewCalibration("New");
			} else {
				// Use existing one... 
				string imageSetID;
				if(ImageSetTools.getImageSetID(ImageSet, imageSetID) == 1){
					// If the imageSet has a valid ID
					useValues = ImageConfigDialog.inputNewCalibration(imageSetID);
				} else {
					// If no valid ID is found...
					result("\nImageSetID not found inside existing ImageSet tag group. Creating New Image Set.")
					useValues = ImageConfigDialog.inputNewCalibration("New");
				}
			}
		}
		
		// We now have an image set stored in the ImageConfig dialog object, but not here. If useValues is 1, the user pressed okay. The image set needs adding to the current list of imagesets or the existing set needs updating.
		// Determining which is needed is up to the ImageSetTools function, not here, since the Toolkit should not have any of its own imageSet tools.
		
		if( useValues == 1){
			if(debugMode==true){result("\nUser made or changed an image set. Updating imageset list.");}
			ImageConfigDialog.addImageSetToImageList();
		} else {
			if(debugMode==true){result("\nUser cancelled image set creation/edit. No changes made.");}
			return;
		}
		
		// Create the information for the image of the centre of the diffraction pattern. This will be used to make the central DP image later.
		TagGroup CentralImage = imageSetTools.createNewImageForImageSet();
		CentralImage.TagGroupSetTagAsString("ImageType", "DP");
		CentralImage.TagGroupSetTagAsNumber("ExposureTime", CameraControlObject.getDPExposure());
		CentralImage.TagGroupSetTagAsNumber("XTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("YTiltRelative", 0);
		CentralImage.TagGroupSetTagAsNumber("XTiltValue", dataObject.getCentreXTilt());
		CentralImage.TagGroupSetTagAsNumber("YTiltValue", dataObject.getCentreYTilt());
		CentralImage.TagGroupSetTagAsNumber("ShadowValue", 0);
		CentralImage.TagGroupSetTagAsNumber("DSpacingAng", 0);
		imageSetTools.addSpotToCurrentImageSet();
		imageSetTools.addImageDataToCurrentSpot(CentralImage, "Middle");
		
	}
	
	
	// This button saves the current tilt setting for the current ImageSet with the storeTiltCoord() function.
	// Does not create any images or move the beam.
	// Uses StoreDP() on ImagingFunctionsObject
	void StoreDPButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			return;
		}
		// Stores a diffraction spot's tilt coordinates and takes a picture to reference the spot in future.
		if(isCalibrated == 0)
		{
			Throw("Data not stored. Please Calibrate the system first.");
		}
		
		ImagingFunctionsObject.StoreDP();

	}
		
	// This button saves the ROI point coordinates on the Live view screen to the current ImageSet.
	// Uses the StoreAllROI function on the ImagingFunctionsObject.
	void storeROIButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			Throw("Toolkit Controls are offline. Ensure there is a live view window active and has been captured.");
		}
		if(isCalibrated == 0){ // Has the system been calibrated?
			Throw("The system must be calibrated before you store points.");
		}
		number isROIStored = ImagingFunctionsObject.StoreAllROI();
		
		if(isROIStored == true){
			OkDialog("All ROI have been stored. You may now Finalize the image set.");
			if(debugMode==true){
				imageSetTools.showImageSets();
			}
		}
		
		
	}
	
	/* This button will use the spot data stored in the current image set to create DP images.
			It will then update the image set with information about the images being taken.
			This step is the final phase before DF imaging begins.
			Function is kept in ImagingFunctionsObject
	*/
	
	void FinalizeImageSetButtonPress(object self)
	{
		ImagingFunctionsObject.finalizeImageSet();
	}
	
	
		
	/* RING PANEL BUTTON FUNCTIONS*/
	void RingToggleButtonPress (object self)
	{
		if(debugMode==1){result("\n\tYou have pressed to toggle the marker ring");}
		// Make the Marker Ring and radius display visible/hidden;
		CameraControlObject.toggleMarkerRing();
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
		CameraControlObject.setRingRadius (desiredRadiusNM);
		CameraControlObject.updateRadius();
	}
		
	void updateRingRadiusButtonPress(object self)
	{
		CameraControlObject.updateRadius();
	}

	void recenterRingButtonPress (object self)
	{
		CameraControlObject.recenterMarkerRing();
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
		if(CameraControlObject.returnViewImage(viewImage) == true){ // if View image present...
			number targetImageID = targetImage.ImageGetID();
			number viewImageID = viewImage.ImageGetID();
			if(targetImageID == viewImageID){ // AND the view image is being refered to
				//get scale from dataObject
				scaleX = dataObject.getRefScale() * CameraControlObject.getBinningMultiplier();
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
		CameraControlObject.makeNewCircle(targetImage, radiusPX, radiusTextString, componentColour);
	}

	/* Imaging & Processing Panel Functions */
	
	void DarkFieldImageButtonPress (object self)
	{
		if(CameraControlObject.getAllowControl() != true){
			result("\nToolkit Controls are offline. Ensure there is a live view window active and has been captured.")
			return;
		}
		TagGroup imageSet;
		ImageSetTools.getCurrentImageSet(imageSet);
		number DPsTaken
		imageSet.TagGroupGetTagAsNumber("DPsTaken", DPsTaken)
		
		if(DPsTaken == false)
		{
			Throw("Image Set has not been finalised");
		}
		
		ImagingFunctionsObject.startDarkfieldImaging(imageSet);
		//ProgressBarDialog.makeDialog(); //command to start the progress bar dialog.
	}
	
	void LoadImageSetButtonPress(object self)
	{
		ImageSetTools.importImageSetFile();
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
			return;
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
			return;
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
	
	void onDebugOptionChange(object self, TagGroup tg)
	{
		number setting = tg.dlggetvalue();
		if(setting == 0 || setting == 1){
			debugMode = setting;
			result("\nDebugMode set to " + debugMode);
			self.UpdateDebugMode();
		} else {
			result("\n There was an error setting the debug mode to " + setting);
		}
		
	}
	
	void onModeWarningOptionChange(object self, TagGroup tg)
	{
		number setting = tg.dlggetvalue();
		setting = (setting == 1) ? 0 : 1 ;
		dataObject.setDisableModeWarnings(setting);
		if(debugMode == true){result("\n\t DisableModeWarning option changed to " + dataObject.getDisableModeWarnings());}
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
		CameraControlObject.captureViewScreen();
		/* Needs to be in toolkit, not in CameraControlObject object */
		ImageDisplay frontdisp
		if(CameraControlObject.returnViewImageDisplay(frontdisp))
		{
			self.attachKeyListener(frontdisp) // attach the keylistener to the live-view display and start it up.
			if(debugMode==1){result("\n\tKeyListener created and attached. Shortcut keys available.");}
		}
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
	
	void ExamineGTGFilePress (object self){
		string path;
		if(OpenDialog( path )){
			TagGroup ToLoad = NewTagGroup();
			if(TagGroupLoadFromFile( ToLoad, path )){
				TagGroupOpenBrowserWindow( ToLoad , 0 );
			}		
		}	
	}
	
}
//****************************************************
// STARTUP FUNCTIONS
//****************************************************

// This function is called when the toolkit starts.
// It creates, configures and stores the dialogs and tag groups found in the other sections.

object startToolkit () {
	
	result("\nCreating toolkit data store...")
	object dataObject = alloc(ToolkitDataObject); // This is the object that will contain everything else.
	
	result("\nSetting Variables.")
	// Set Variables
	dataObject.setMaxDeviation(0.2); // difference (in 1/nm) allowed during pattern matching operations
	result("\nLoading Persistent Memory Settings.")
	TagGroup persistentSave
	if(dataObject.checkPersistent()==false){
		result("\n\t No Persistent Memory found. Using default settings.")
		persistentSave = dataObject.createPersistent(1); // make a default set of data
		dataObject.updatePersistent(persistentSave); // save it to persistent memory
		dataObject.loadPersistent(persistentSave); // Load it into data object
	} else { // load variables from permanent memory into the dataObject.
		result("\n\t Persistent Memory found. Loading settings.")
		persistentSave = dataObject.createPersistent(0); // create set of data from memory and dataObject
		dataObject.loadPersistent(persistentSave); // Load it into data object
	}
	
	result("\nLoading Image Set Tools...");
	object theImageSetTools = alloc(ImageSetTools);
	
	result("\nLoading Camera Controls...");
	object theCameraControlObject = alloc(CameraControl);
	
	result("\nCreating KeyListener for shortcut commands...");
	// Create objects that will be used later but must be created now before the class drops from scope
	object KeyListener=alloc(MyKeyHandler); // Key handler for the view Window for shortcut key presses. Not attached yet.
	
	result("\nCreating Alignment Dialog System...");
	object alignmentDialog = alloc(alignmentdialog); // The aligning image dialog. Is not displayed or created yet.
	
	result("\nCreating Calibration Input Dialog...");
	object calibrationDialog = alloc(ScaleValueDialog);
	
	result("\nCreating Tilt Calibration Input Dialog...");
	object tiltDialog = alloc(TiltValueDialog);
	
	result("\nLoading Image Processing Functions...");
	object ImageProcessingObject = alloc(ImageProcessing);
	
	result("\nLoading Image Set Configuration Dialog...");
	object ImageConfigDialog = alloc(ImageConfiguration);
	
	result("\nLoading Progress Bar Dialog...");
	object ProgressBarDialog = alloc(ProgressDialog);
	
	result("\nLoading Imaging Functions Object...");
	object ImagingFunctionsObject = alloc(ImagingFunctions);
	
	// Construct the Toolkit.
	object Toolkit = alloc(DF360Dialog);
	result("\nAttaching data store to Toolkit...");
	Toolkit.storeDataObject(dataObject); // Needs only Toolkit to be loaded.
	Toolkit.storeCameraControlObject(theCameraControlObject); // uses dataObject
	Toolkit.storeCalibrationDialog(calibrationDialog); // uses dataObject
	Toolkit.storeAlignmentDialog(alignmentDialog); // uses dataObject
	Toolkit.storeTiltDialog(tiltDialog); // uses DataObject
	Toolkit.storeImageSetTools(theImageSetTools); // uses DataObject
	
	Toolkit.storeImageConfigDialog(ImageConfigDialog); // uses Dataobject and ImageSetTools
	Toolkit.storeProgressBarDialog(ProgressBarDialog); // uses dataObject; ImageSetToolsID;
	
	Toolkit.storeImageProcessingObject(ImageProcessingObject); // uses dataObject, imageSetTools and imageAlignment
	Toolkit.storeImagingFunctionsObject(ImagingFunctionsObject); // uses dataObjectID; imageSetToolsID; CameraControlObjectID; ProgressBarDialogID;
	
	Toolkit.storeKeyListener(KeyListener); 	// Insert it into toolkit. To make it listen for key presses on a display use Toolkit.startListening(ImageDisplay);
	//	uses DataObject; ImageSetToolsID; ImagingFunctionsID; CameraControlObjectID
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
	result("\nLoading Toolkit ...");

	object ToolKit = startToolkit();		
	
	result("\nLoading complete.");
	Toolkit.printAllValues();
	
	// Forces the user to choose the save directory
	result("\nPlease select an auto-save directory for images made by this script.")
	result("\nThis can be changed later in the toolkit options menu");
	result("\nThe auto-save directory has been set to " + setAutoSaveDir())
	
	printGreeting(); // Basic Instructions
	printCommands(); // Shortcut keys
}

main(); // Run the script.