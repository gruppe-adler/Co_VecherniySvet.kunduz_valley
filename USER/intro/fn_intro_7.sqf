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

_camera camSetTarget _eagle;
_camera camSetRelPos [0,-3,0.25];
_camera camCommit 0;

[{
     params ["_eagle"];
     _eagle distance grad_intro_mi24_1 < 5
},{
    params ["_eagle"];

    [getPos _eagle] call grad_intro_fnc_eagleFeathers;

    private _camPos = getPos _eagle;
    private _camVectorDir = vectorDir _eagle;
    private _camVectorUp = vectorUp _eagle;
    
    _eagle cameraEffect ["terminate","back"];
    camDestroy _eagle;

    playSound "impact_bird";

    private _camera = "camera" camCreate [0, 0, 3];
    _camera cameraEffect ["internal","back"];
    _camera camCommand "inertia on";
    _camera camPreparePos (_camPos);
    _camera camSetFOV 0.55; // 0.25
    _camera camCommitPrepared 0;
    _camera setVectorDirAndUp [_camVectorDir, _camVectorUp];
    [_camera] call grad_intro_fnc_intro_8;

}, [_eagle]] call CBA_fnc_waitUntilAndExecute;
   


