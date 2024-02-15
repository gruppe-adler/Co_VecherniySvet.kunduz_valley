
private _path = [];

for "_i" from 1 to 30 do {

	private _name = ("intro_convoy_path_" + str _i);
	private _object = missionNamespace getVariable _name;
	private _pos = getPos _object;

	_path pushback _pos;

};

[{
	!isNil "convoyTransportGo"
},{
	params ["_path"];
		
	private _vehicles = [
		introConvoy1,introConvoy2,introConvoy3,introConvoy4
	];

	{
		_x setDriveOnPath _path;
		_x forceSpeed 15/3.6;
		_x limitSpeed 15/3.6;
	} forEach _vehicles;


	[{
		params ["_args", "_handle"];
		_args params ["_vehicles"];

		if (!alive introConvoy1) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		{ 
			if (_x != introConvoy1) then {
				private _vehicleAhead = _vehicles select (_forEachIndex-1);
				private _distance = _vehicleAhead distance _x;

				_x forceSpeed (_distance/3.6);
			};
		} forEach _vehicles;

	}, 0, [_vehicles]] call CBA_fnc_addPerFrameHandler;
	
	[{
		sheepConvoyGo = true;
		// private _data_1 = call compile loadFile ("USER\intro\fn_sheepTransportPath.sqf");
		// intro_sheepTransport engineOn true;
		// intro_sheepTransport disableBrakes true; 
		// [intro_sheepTransport, _data_1, [], true, nil, nil, 10] spawn BIS_fnc_unitPlay;
	}, [], 40] call CBA_fnc_waitAndExecute;

}, [_path]] call CBA_fnc_waitUntilAndExecute;


