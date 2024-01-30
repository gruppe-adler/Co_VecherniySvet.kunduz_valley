params ["_camera"];

private _duration = 20;
["GRAD_butterfly", getPos introButterfly_3, getPos introButterfly_4, 3] call grad_intro_fnc_butterfly;
private _butterfly = ["GRAD_butterfly", getPos introButterfly_5_1, getPos introButterfly_5_2, _duration] call grad_intro_fnc_butterfly;


_camera camPreparePos (getPos introMarker_4_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_4_1;
private _vectorUp = vectorUp introMarker_4_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];


_camera camPreparePos (getPos _butterfly);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_4_2, vectorUp introMarker_4_2], _duration-1, 2] call GRAD_INTRO_fnc_camTilt;


[{
    params ["_camera", "_butterfly"];
    [_camera, _butterfly] call grad_intro_fnc_intro_7;
}, [_camera, _butterfly], _duration-1] call CBA_fnc_waitAndExecute;
