params ["_camera"];

_camera camPreparePos (getPos introMarker_4_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_4_1;
private _vectorUp = vectorUp introMarker_4_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 20;
_camera camPreparePos (getPos introMarker_4_2);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_4_2, vectorUp introMarker_4_2], _duration-1, 2] call GRAD_INTRO_fnc_camTilt;

["GRAD_butterfly", getPos introButterfly_3, getPos introButterfly_4, _duration] call grad_intro_fnc_butterfly;
["GRAD_butterfly", getPos introButterfly_5_1, getPos introButterfly_5_2, _duration] call grad_intro_fnc_butterfly;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_7;
}, [_camera], _duration-1] call CBA_fnc_waitAndExecute;
