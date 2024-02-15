params ["_camera", "_markers", "_duration", ["_strength", 2], ["_maxRoll", 0]];

private _initTime = CBA_missionTime;
private _currentIndex = 0;

private _tiltPFH = [{
	params ["_args", "_handle"];
	_args params [
		"_camera",
		"_markers",
		"_duration",
		"_strength",
		"_maxRoll",
		"_initTime",
		"_currentIndex"
	];

	if (CBA_missionTime > (_initTime + _duration)) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		// [_camera] call grad_intro_fnc_intro_2;
	};

	private _markerCount = count _markers;
	private _progress = (CBA_missionTime - _initTime) / _duration;
	private _currentIndex = floor(_progress * (_markerCount - 1));
	private _segmentProgress = (_progress * (_markerCount - 1)) - (_currentIndex);

	if (_currentIndex > (_markerCount - 1))  exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	private _startMarker = _markers select _currentIndex;
	private _endMarker = _markers select (_currentIndex + 1);

	private _startPos = getPosASL _startMarker;
	private _endPos = getPosASL _endMarker;
	private _startVector = [vectorDir _startMarker, vectorUp _startMarker];
	private _endVector = [vectorDir _endMarker, vectorUp _endMarker];

	// vectorLinearConversion
	// vectorLinearConversion [rangeFrom, rangeTo, rangeValue, vectorFrom, vectorTo, clip]
	// systemChat str _segmentProgress;
	private _markersPositions = _markers apply { getPosASL _x };
	private _markersDir = _markers apply { vectorDir _x };
	private _markersUp = _markers apply { vectorUp _x };
	
	// systemchat str _markersPositions;
	private _interpolatedPos = _progress bezierInterpolation _markersPositions; // vectorLinearConversion [0, 1, _segmentProgress, _startPos, _endPos, true];
	_camera setPosASL _interpolatedPos;


	// createSimpleObject ["Sign_sphere100cm_EP1", _interpolatedPos, true];
	
	private _vectorDirActual = _progress bezierInterpolation _markersDir;
	private _vectorUpActual = _progress bezierInterpolation _markersUp;

	private _roll = if (_segmentProgress < 0.5) then {
		linearConversion [0, 0.5, _segmentProgress, 0, _maxRoll, true]
	} else {
		linearConversion [0.5, 1, _segmentProgress, _maxRoll, 0, true]
	};

	private _vectorTilt = [[_vectorDirActual, _vectorUpActual], 0, 0, _roll] call BIS_fnc_transformVectorDirAndUp;
	_vectorTilt params ["_vectorDirFinal", "_vectorUpFinal"];
	

	_camera setVectorDir _vectorDirFinal;
	_camera setVectorUp _vectorUpFinal;

}, 0, [_camera, _markers, _duration, _strength, _maxRoll, _initTime, _currentIndex]] call CBA_fnc_addPerFrameHandler;
