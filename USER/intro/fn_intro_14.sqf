params ["_camera"];

private _duration = 12;

_camera camSetTarget objNull;
_camera camPreparePos (getPos introMarker_5_4);
_camera camCommitPrepared 0;

[_camera, [vectorDir introMarker_5_4, vectorUp introMarker_5_4], _duration, 1.5] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;