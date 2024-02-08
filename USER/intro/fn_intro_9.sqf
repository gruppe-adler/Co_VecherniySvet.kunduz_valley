params ["_camera"];

private _duration = 5;
private _startTime = CBA_missionTime;

fnc_SetPitchBankYaw = {
	private ["_object", "_rotations", "_aroundX", "_aroundY", "_aroundZ", "_dirX", "_dirY",
	"_dirZ", "_upX", "_upY", "_upZ", "_dir", "_up", "_dirXTemp", "_upXTemp"];
	_object = _this select 0;
	_rotations = _this select 1;
	_aroundX = _rotations select 0;
	_aroundY = _rotations select 1;
	_aroundZ = (360 - (_rotations select 2)) - 360;
	_dirX = 0;
	_dirY = 1;
	_dirZ = 0;
	_upX = 0;
	_upY = 0;
	_upZ = 1;
	if (_aroundX != 0) then {
		_dirY = cos _aroundX;
		_dirZ = sin _aroundX;
		_upY = -sin _aroundX;
		_upZ = cos _aroundX;
	};
	if (_aroundY != 0) then {
		_dirX = _dirZ * sin _aroundY;
		_dirZ = _dirZ * cos _aroundY;
		_upX = _upZ * sin _aroundY;
		_upZ = _upZ * cos _aroundY;
	};
	if (_aroundZ != 0) then {
		_dirXTemp = _dirX;
		_dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
		_dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);
		_upXTemp = _upX;
		_upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
		_upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
	};
	_dir = [_dirX,_dirY,_dirZ];
	_up = [_upX,_upY,_upZ];
	_object setVectorDirAndUp [_dir,_up];
};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
(driver grad_intro_mi24_1) switchCamera "INTERNAL";

private _eagleWindScreen = createSimpleObject ["\a3\Data_F_Curator\Eagle\eagle.p3d", [0,0,0], true];

[_eagleWindScreen] spawn {
    params ["_eagleWindScreen"];
    
	for "_i" from -100 to 0 do {
		private _position = grad_intro_mi24_1 modelToWorldVisualWorld [0.0688477,6.3743+_i,-0.63159];
		_eagleWindScreen setPosASL _position;
		sleep 0.01;
	};
    playSound "impact_bird";
    // _eagleWindScreen attachTo [grad_intro_mi24_1, [-0.0688477,6.3743,-0.63159]];

    for "_i" from 0 to 100 do {
		private _position = grad_intro_mi24_1 modelToWorldVisualWorld [0.0688477,6.3743+_i,-0.63159-_i*0.02];
		_eagleWindScreen setPosASL _position;
		sleep 0.01;
	};

    sleep 1;
	playSound3D ["A3\data_f_curator\sound\cfgNonAiVehicles\eagle_f_1.wss", grad_intro_mi24_1];

};



[{
	params ["_eagleWindScreen"];
	
 	deleteVehicle _eagleWindScreen;

    [] call grad_intro_fnc_intro_10;
}, [_eagleWindScreen], _duration+0.1] call CBA_fnc_waitAndExecute;
