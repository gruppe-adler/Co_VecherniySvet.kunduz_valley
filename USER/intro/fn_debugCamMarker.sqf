params ["_name", "_duration", ["_strength", 2], ["_maxRoll", 0]];

private _potentialCamMarkers = [];

{
	private _array = _x;
	_array params ["_object"];
	// systemchat typeName _object;

	if (typeName _object != "OBJECT") exitWith {};

	if (typeOf _object == "Sign_Arrow_Direction_Cyan_F") then {
		private _3denName = (_object get3DENAttribute "name") select 0;
		
		if ((_3denName find _name) > -1) then {
			_potentialCamMarkers pushBack _object;
			systemchat _3denName;
		};
	};
} forEach (all3DENEntities select 0); // only objects

systemChat str count _potentialCamMarkers;


private _existingDebugMarkers = missionNameSpace getVariable ["GRAD_debugCamMarkers", []];

{
	deleteVehicle _x;
} forEach _existingDebugMarkers;



private _initTime = diag_tickTime; // 3den does not have cba_missiontime
private _currentIndex = 0;

for "_i" from 1 to 1000 do {

	if (diag_tickTime > (_initTime + _duration)) exitWith {
	};

	private _markerCount = count _potentialCamMarkers;
	private _progress = (diag_tickTime - _initTime) / _duration;
	private _currentIndex = floor(_progress * (_markerCount - 1));
	private _segmentProgress = (_progress * (_markerCount - 1)) - (_currentIndex);

	if (_currentIndex > (_markerCount - 1))  exitWith {
	};

	private _startMarker = _potentialCamMarkers select _currentIndex;
	private _endMarker = _potentialCamMarkers select (_currentIndex + 1);

	private _startPos = getPosASL _startMarker;
	private _endPos = getPosASL _endMarker;
	private _startVector = [vectorDir _startMarker, vectorUp _startMarker];
	private _endVector = [vectorDir _endMarker, vectorUp _endMarker];

	// vectorLinearConversion
	// vectorLinearConversion [rangeFrom, rangeTo, rangeValue, vectorFrom, vectorTo, clip]
	systemChat str _segmentProgress;
	private _markersPositions = _potentialCamMarkers apply { getPosASL _x };
	private _markersDir = _potentialCamMarkers apply { vectorDir _x };
	private _markersUp = _potentialCamMarkers apply { vectorUp _x };
	

	

	// systemchat str _markersPositions;
	private _interpolatedPos = _progress bezierInterpolation _markersPositions; // vectorLinearConversion [0, 1, _segmentProgress, _startPos, _endPos, true];
	private _debugMarker = createSimpleObject ["Sign_Arrow_Direction_Green_F", _interpolatedPos, true];
	private _existingDebugMarkers = missionNameSpace getVariable ["GRAD_debugCamMarkers", []];
	missionNameSpace setVariable ["GRAD_debugCamMarkers", (_existingDebugMarkers + [_debugMarker])];
	
	private _vectorDirActual = _progress bezierInterpolation _markersDir;
	private _vectorUpActual = _progress bezierInterpolation _markersUp;

	private _roll = if (_segmentProgress < 0.5) then {
		linearConversion [0, 0.5, _segmentProgress, 0, _maxRoll, true]
	} else {
		linearConversion [0.5, 1, _segmentProgress, _maxRoll, 0, true]
	};

	private _vectorTilt = [[_vectorDirActual, _vectorUpActual], 0, 0, _roll] call BIS_fnc_transformVectorDirAndUp;
	_vectorTilt params ["_vectorDirFinal", "_vectorUpFinal"];
	

	_debugMarker setVectorDir _vectorDirFinal;
	_debugMarker setVectorUp _vectorUpFinal;

	sleep 0.01;
};
