[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_end;
}, [_camera], 20] call CBA_fnc_waitAndExecute;
