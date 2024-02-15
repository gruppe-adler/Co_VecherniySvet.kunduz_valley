params [["_camera", objNull]];

if (!isNull _camera) then {
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
};

private _camera = "camera" camCreate [0, 0, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera camSetFOV 0.55; // 0.25
_camera camSetPos (getPos introMarker_6_1);
_camera setVectorDirAndUp [vectorDir introMarker_6_1, vectorUp introMarker_6_1];
_camera camCommitPrepared 0;


private _duration = 50;
/*
_camera camPreparePos (getPos introMarker_6_2);
_camera camCommitPrepared _duration;
*/

private _array = [
	introMarker_6_1,
	introMarker_6_2,
	introMarker_6_3,
	introMarker_6_4,
	introMarker_6_5,
	introMarker_6_6,
	introMarker_6_7,
	introMarker_6_8,
	introMarker_6_9,
	introMarker_6_10
];

[_camera, _array, _duration, 1.5] execvm "USER\intro\fn_camTiltMultiple.sqf";

/*
[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
*/