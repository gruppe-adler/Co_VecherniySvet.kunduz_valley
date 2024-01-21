/*

    SCENE 2 - destroyed mosque - country horizon

    0:18 - This land is mine
    0:24 - God gave this land to me
    0:31 - This brave and ancient land to me

*/

params ["_camera"];

// _camera camPreparePos (getPos introMarker_1_5);
// _camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
// private _vectorDir = vectorDir introMarker_5;
// private _vectorUp = vectorUp introMarker_5;
// _camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 24;
_camera camPreparePos (getPos introMarker_5);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_5, vectorUp introMarker_5], _duration, 5] call GRAD_INTRO_fnc_camTilt;


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
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
