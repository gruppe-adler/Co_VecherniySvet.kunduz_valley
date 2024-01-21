/*
_camera camPreparePos (getPos introMarker_3);
// _camera camPrepareTarget (intro_tractor);
private _vectorDir = vectorDir introMarker_3;
private _vectorUp = vectorUp introMarker_3;
_camera camCommitPrepared 0;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

_camera camPreparePos (getPos introMarker_4);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared 25;
[_camera, [vectorDir introMarker_4, vectorUp introMarker_4], 24] call GRAD_INTRO_fnc_camTilt;

*/

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], 20] call CBA_fnc_waitAndExecute;


