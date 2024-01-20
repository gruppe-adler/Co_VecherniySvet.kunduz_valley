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


