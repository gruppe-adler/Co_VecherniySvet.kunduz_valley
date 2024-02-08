/*

    SCENE 7 - towards the mi24 + flyby

    

*/

params ["_camera", "_eagle"];

private _duration = 3;
/*
private _yaw = getDir grad_intro_mi24_1 - 180; // look at mi24
private _yawFuture = getDir grad_intro_mi24_1;
private _pitch = 0; 
private _roll = 0;
private _vectorDir = [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch];
private _vectorUp = [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D;
*/


// [_camera, [_vectorDir, _vectorUp], _duration, 1.9] call GRAD_INTRO_fnc_camTilt;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
(_eagle) switchCamera "EXTERNAL";

[_eagle] spawn {
    params ["_eagle"];

    for "_i" from 1 to 7 do {
        _eagle camSetPos (getPos grad_intro_mi24_1);
        _eagle camCommit 5;
        sleep 1;
    };
    deleteVehicle _eagle;
    [_positionRotor] call grad_intro_fnc_eagleFeathers;
};

/*
[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_8;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
*/