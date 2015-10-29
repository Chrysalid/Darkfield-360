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

