params ["_camera", "_butterfly"];

private _duration = 10;

private _yaw = getDir grad_intro_mi24_1 - 180; // look at mi24
private _pitch = 0; 
private _roll = 0;
private _vectorDir = [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch];
private _vectorUp = [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D;



// [_camera, _mi24, _duration-1, 2, true] call GRAD_INTRO_fnc_camTilt;
[_camera, [_vectorDir, _vectorUp], _duration-1, 2] call GRAD_INTRO_fnc_camTilt;


[{
    params ["_camera"];
    // params ["_camera", ["_strength", 0.01], ["_duration", 0.7], ["_pos", []]];
    [_camera, 0.2, 2.9] call grad_intro_fnc_camShake;
}, [_camera], _duration-3] call CBA_fnc_waitAndExecute;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_8;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
