params ["_camera"];

_camera camPreparePos (getPos introMarker_5);
_camera camCommitPrepared 0;
_camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_5;
private _vectorUp = vectorUp introMarker_5;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 26;
_camera camPreparePos (getPos introMarker_6);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_6, vectorUp introMarker_6], _duration-1] call GRAD_INTRO_fnc_camTilt;

// intro_fx_ppBW_color = 0;

// [{
// 	params ["_args", "_handle"];

// 	private _ppBW = missionNameSpace getVariable ["intro_fx_ppBW", -1];
// 	_ppBW ppEffectAdjust
// 	[
// 		1,
// 		1,
// 		0,
// 		[0, 0, 0, 0],
// 		[1, 1, 1, intro_fx_ppBW_color min 1],
// 		[0.299, 0.587, 0.114, 0],
// 		[-1, -1, 0, 0, 0, 0, 0]
// 	];
// 	_ppBW ppEffectCommit 0;
// 	intro_fx_ppBW_color = intro_fx_ppBW_color + 0.005;


// 	if (camCommitted _camera) exitWith {
// 		[_handle] call CBA_fnc_removePerFrameHandler;
// 	};

// }, 0, []] call CBA_fnc_addPerFrameHandler;



[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_3;
}, [_camera], _duration-1] call CBA_fnc_waitAndExecute;
