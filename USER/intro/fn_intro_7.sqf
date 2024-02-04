/*

    SCENE 7 - towards the mi24 + flyby

    

*/

params ["_camera", "_butterfly"];

private _duration = 3;

private _yaw = getDir grad_intro_mi24_1 - 180; // look at mi24
private _yawFuture = getDir grad_intro_mi24_1;
private _pitch = 0; 
private _roll = 0;
private _vectorDir = [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch];
private _vectorUp = [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D;



// [_camera, _mi24, _duration-1, 2, true] call GRAD_INTRO_fnc_camTilt;
[_camera, [_vectorDir, _vectorUp], _duration, 1.9] call GRAD_INTRO_fnc_camTilt;

[_butterfly] spawn {
    params ["_butterfly"];

    for "_i" from 1 to 7 do {
        _butterfly camSetPos (getPos grad_intro_mi24_1);
        _butterfly camCommit 3;
        sleep 1;
    };
    deleteVehicle _butterfly;
};


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_8;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
