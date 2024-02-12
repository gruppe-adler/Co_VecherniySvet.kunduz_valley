private _camera = "camera" camCreate [0, 0, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera camSetFOV 0.55; // 0.25
_camera camCommitPrepared 0;

private _duration = 4;


_camera camSetTarget objNull;
_camera camCommit 0;
_camera camPreparePos (getPos introMarker_5_1);
_camera camCommitPrepared 0;
private _vectorDir = vectorDir introMarker_5_1;
private _vectorUp = vectorUp introMarker_5_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

20 fadeSound 0;




[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_11;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;