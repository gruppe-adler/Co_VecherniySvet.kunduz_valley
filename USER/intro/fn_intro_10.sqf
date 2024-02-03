params ["_camera"];

private _duration = 2;

_camera camSetTarget objNull;
_camera camPreparePos (getPos introMarker_5_1);
_camera camCommitPrepared 0;
_camera setVectorDirAndUp [vectorDir introMarker_5_1, vectorUp introMarker_5_1];


[_camera, [vectorDir introMarker_5_2, vectorUp introMarker_5_2], _duration, 1.5] call GRAD_INTRO_fnc_camTilt;

20 fadeSound 0;

[{
	
	private _spawnPos = getPos introMarker_5_1;
	_spawnPos set [2, 40];

	drop [
	/* Sprite */			["\A3\animals_f\butterfly.p3d", 1, 0, 1, 0], // File,Ntieth,Index,Count,Loop
	/* Animation */			"",
	/* Type */				"spaceObject",
	/* TimerPer */			0.01,
	/* Lifetime */			60,
	/* Position */			_spawnPos,
	/* MoveVelocity */		[0,0,-0.25],
	/* Simulation */		1, 1.31, 1, 0, // rotationVel, weight, volume, rubbing
	/* Scale */				[1],
	/* Color */				[[1,1,1,1], [1,1,1,1]],
	/* AnimSpeed */			[1.5, 0.5],
	/* randDirPeriod */		0.01,
	/* randDirIntensity */	0.08,
	/* onTimerScript */		"USER\intro\fn_butterflyPos.sqf",
	/* DestroyScript */		"",
	/* object */			_this,
	/* Angle */				0,
	/* onSurface */			true,
	/* bounceOnSurface */	0,
	/* emissiveColor */		[[0,0,0,0]]
	];

}, [], 6] call CBA_fnc_waitAndExecute;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_11;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;