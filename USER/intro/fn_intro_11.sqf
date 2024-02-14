params ["_camera"];

private _duration = 2;



[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_12;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;