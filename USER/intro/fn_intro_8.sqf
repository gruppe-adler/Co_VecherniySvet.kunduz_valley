/*

    SCENE 8 - tilt on flyby

    

*/

params ["_camera", "_yaw"];

private _duration = 1;

private _pitch = 180; 
private _roll = 180;
private _vectorDir = [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch];
private _vectorUp = [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D;


// [_camera, 0.01, 2] spawn grad_intro_fnc_camShake; // does not work

[_camera, [_vectorDir, _vectorUp], _duration, _duration] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_9;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;