params ["_camera"];

_camera camPreparePos (getPos introMarker_5_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_5_1;
private _vectorUp = vectorUp introMarker_5_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 23;
_camera camPreparePos (getPos introMarker_5_2);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_5_2, vectorUp introMarker_5_2], _duration-1, 2] call GRAD_INTRO_fnc_camTilt;

{
    _x hideObject false;    
} forEach [intro_texture_1, intro_texture_2];

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_8;
}, [_camera], _duration - 0.5] call CBA_fnc_waitAndExecute;
