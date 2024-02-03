params ["_camera"];

private _duration = 9;

private _debugStartTime = CBA_missionTime;

[{
	!isNil "grad_intro_butterflyPos"
}, {
	params ["_camera"];

	[{
		params ["_args", "_handle"];
		_args params ["_camera"];

		if (grad_intro_butterflyPos#2 < .5) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		_camera camSetTarget grad_intro_butterflyPos;
		_camera camCommit 0.01;


	}, 0.01, [_camera]] call CBA_fnc_addPerFrameHandler;
	

}, [_camera]] call CBA_fnc_waitUntilAndExecute;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_12;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;