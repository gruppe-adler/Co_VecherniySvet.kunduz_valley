private _camera = "camera" camCreate [0, 0, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera camSetFOV 0.55; // 0.25
_camera camCommitPrepared 0;

private _duration = 4;


_camera camSetTarget objNull;
_camera camCommit 0;
_camera camPreparePos (getPos introMarker_5_1);
_camera camCommitPrepared 0;
private _vectorDir = vectorDir introMarker_5_1;
private _vectorUp = vectorUp introMarker_5_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

20 fadeSound 0;

private _spawnPos = getPos introMarker_5_1;
_spawnPos set [2, 40];

[_spawnPos] call grad_intro_fnc_eagleFeathers;

drop [
/* Sprite */			["insects\data\eaglefeather3d.p3d", 1, 0, 1, 0], // File,Ntieth,Index,Count,Loop
/* Animation */			"",
/* Type */				"spaceObject",
/* TimerPer */			0.01,
/* Lifetime */			60,
/* Position */			_spawnPos,
/* MoveVelocity */		[0,0,-0.25],
/* Simulation */		1, 1.3, 1, 0, // rotationVel, weight, volume, rubbing
/* Scale */				[2],
/* Color */				[[1,1,1,1], [1,1,1,1]],
/* AnimSpeed */			[1.5, 0.5],
/* randDirPeriod */		0.01,
/* randDirIntensity */	0.08,
/* onTimerScript */		"",
/* DestroyScript */		"",
/* object */			_this,
/* Angle */				0,
/* onSurface */			true,
/* bounceOnSurface */	0,
/* emissiveColor */		[[0,0,0,0]]
];

diag_log format ["butterfly drop started"];




[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_11;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;