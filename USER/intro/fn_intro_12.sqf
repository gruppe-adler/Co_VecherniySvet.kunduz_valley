params ["_camera"];

private _duration = 7;

_camera camSetTarget objNull;
_camera camSetPos getpos introMarker_5_2;
_camera camCommit _duration;

[_camera, [vectorDir introMarker_5_2, vectorUp introMarker_5_2], _duration, 1.5] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_13;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;