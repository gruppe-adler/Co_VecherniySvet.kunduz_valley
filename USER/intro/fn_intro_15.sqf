params ["_camera"];

private _duration = 4;

_camera camPreparePos (getPos introMarker_5_5);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_5_5, vectorUp introMarker_5_5], _duration, 1.5, 0] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;