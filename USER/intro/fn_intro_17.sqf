params ["_camera"];

private _duration = 5;

_camera camPreparePos (getPos introMarker_6_4);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_6_4, vectorUp introMarker_6_4], _duration, 1.5] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;