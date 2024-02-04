params ["_camera", "_newVector", "_duration", ["_strength", 2]];

private _oldVectorDir = vectorDir _camera;
private _oldVectorUp =  vectorUp _camera;
_newVector params ["_newVectorDir","_newVectorUp"];
private _initTime = CBA_missionTime;

private _tiltPFH = [{
	params ["_args", "_handle"];
	_args params [
		"_oldVectorDir", 
		"_oldVectorUp", 
		"_newVectorDir", 
		"_newVectorUp", 
		"_initTime", 
		"_duration", 
		"_camera",
		"_strength"
	];

	if (CBA_missionTime > (_initTime + _duration)) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		// [_camera] call grad_intro_fnc_intro_2;
	};

	// systemchat ("rotating cam.." + str _oldVectorDir + " " + str _oldVectorUp + str _newVectorDir + " " + str _newVectorUp);

	private _progress = (CBA_missionTime - _initTime) / _duration;
	private _vectorDirActual = [_oldVectorDir, _newVectorDir, _progress, _strength] call BIS_fnc_easeInOutVector;
	private _vectorUpActual = [_oldVectorUp, _newVectorUp, _progress, _strength] call BIS_fnc_easeInOutVector;
	
	
	// systemchat ("rotating cam.." + str _oldVectorDir + " " + str _oldVectorUp + " " + str _newVectorDir + " " + str _newVectorUp + " " + str _progress);

	_camera setVectorDir _vectorDirActual;
	_camera setVectorUp _vectorUpActual;

}, 0, [_oldVectorDir, _oldVectorUp, _newVectorDir, _newVectorUp, _initTime, _duration, _camera, _strength]] call CBA_fnc_addPerFrameHandler;