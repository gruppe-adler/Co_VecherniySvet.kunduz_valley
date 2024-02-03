/*

    SCENE 7 - towards the mi24 + flyby

    

*/

params ["_camera", "_butterfly"];

private _duration = 2.5;

private _yaw = getDir grad_intro_mi24_1 - 180; // look at mi24
private _pitch = 0; 
private _roll = 0;
private _vectorDir = [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch];
private _vectorUp = [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D;

[_butterfly] spawn {
    params ["_butterfly"];

    for "_i" from 1 to 7 do {
        _butterfly camSetPos (getPos grad_intro_mi24_1);
        _butterfly camCommit 5;
        sleep 1;
    };
    deleteVehicle _butterfly;
};


// [_camera, _mi24, _duration-1, 2, true] call GRAD_INTRO_fnc_camTilt;
[_camera, [_vectorDir, _vectorUp], _duration, 2] call GRAD_INTRO_fnc_camTilt;


[{
    params ["_camera"];
    /* _cam, _strength, _duration */
    // [_camera, 0.03, 2.9] call grad_intro_fnc_camShake;
}, [_camera], _duration-3] call CBA_fnc_waitAndExecute;


[{
    params ["_camera"];
    [_camera, _yaw-180] call grad_intro_fnc_intro_8;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
