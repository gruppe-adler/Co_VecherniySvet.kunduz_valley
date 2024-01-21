/*
params ["_camera"];

_camera camPreparePos (getPos introMarker_3_4);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_3_4;
private _vectorUp = vectorUp introMarker_3_4;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 10;
_camera camPreparePos (getPos introMarker_3_5);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_3_5, vectorUp introMarker_3_5], _duration-1] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_7;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;


*/