params ["_camera"];

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
