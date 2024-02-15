/*

	deprecated / not used

*/

/* _newPosition needs to be code */ 
params ["_camera", "_newPosition", "_duration", ["_strength", 2], ["_forceVectorUp", false]];

private _oldVectorDir = vectorDir _camera;
private _oldVectorUp =  vectorUp _camera;

private _initTime = diag_tickTime;

private _tiltPFH = [{
	params ["_args", "_handle"];
	_args params [
		"_oldVectorDir", 
		"_oldVectorUp", 
		"_newPosition", 
		"_initTime", 
		"_duration", 
		"_camera",
		"_strength",
		"_forceVectorUp"
	];

	private _newPosition = call _newPosition;

	private _newVectorUp = [0,0,1];
	private _newVectorDir = (getPos _camera) vectorFromTo _newPosition;

	if (diag_tickTime > _initTime + _duration) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		// [_camera] call grad_intro_fnc_intro_2;
	};

	if (_forceVectorUp) then {
		_newVectorUp = [0,0,1];
	};

	// systemchat ("rotating cam.." + str _oldVectorDir + " " + str _oldVectorUp + str _newVectorDir + " " + str _newVectorUp);

	private _progress = (diag_tickTime - _initTime) / _duration;
	private _vectorDirActual = [_oldVectorDir, _newVectorDir, _progress, _strength] call BIS_fnc_easeInOutVector;
	private _vectorUpActual = [_oldVectorUp, _newVectorUp, _progress, _strength] call BIS_fnc_easeInOutVector;
	
	
	// systemchat ("rotating cam.." + str _oldVectorDir + " " + str _oldVectorUp + " " + str _newVectorDir + " " + str _newVectorUp + " " + str _progress);

	_camera setVectorDir _vectorDirActual;
	_camera setVectorUp _vectorUpActual;

}, 0, [_oldVectorDir, _oldVectorUp, _newPosition, _initTime, _duration, _camera, _strength, _forceVectorUp]] call CBA_fnc_addPerFrameHandler;