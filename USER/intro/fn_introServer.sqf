private _duration = 120;

// skiptime 3;
setTimeMultiplier 1;
skiptime -1.5;

[_duration] remoteExec ["grad_intro_fnc_intro_start", 0, true];



[{
	setTimeMultiplier 120;
}, [], 33] call CBA_Fnc_waitAndExecute;

// tractor
[{
	private _path = [];
	for "_i" from 1 to 17 do {
		private _marker = call(compile format ["GRAD_intro_path_%1", _i]);
		// private _speed = _marker getVariable ["VLF_speed", 9];
		// private _entry = (getPos _marker) + [_speed];
		private _entry = getPos _marker;
		_path pushBack _entry;
	};
	intro_tractor setDriveOnPath _path;
}, [], 50] call CBA_Fnc_waitAndExecute;


// mi24
[{
	private _dir = [9186.05,-313.992,160.601] getDir [8876.11,5312.67,42.2603]; // direction of action

	private _result = [[9186.05,-313.992,160.601], _dir, "UK3CB_CW_SOV_O_LATE_Mi_24P", east] call BIS_fnc_spawnVehicle;
	_result params ["_mi24_1", "_crew", "_group"];
	[
		_mi24_1,
		["SOV_2",1], 
		["exhaust_hide",1]
	] call BIS_fnc_initVehicle;
	_mi24_1 allowDamage false;

	(creategroup east) createVehicleCrew _mi24_1;

	grad_intro_mi24_1 = _mi24_1;
	publicVariable "grad_intro_mi24_1";

	private _data_1 = call compile loadFile ("USER\intro\fn_mi24_data_1.sqf");
	[_mi24_1, _data_1] spawn BIS_fnc_unitPlay;


	private _result = [[9220.49,-43.9566,160.978], _dir, "UK3CB_CW_SOV_O_LATE_Mi_24P", east] call BIS_fnc_spawnVehicle;
	_result params ["_mi24_2", "_crew", "_group"];
	[
		_mi24_2,
		["SOV",1], 
		["exhaust_hide",1]
	] call BIS_fnc_initVehicle;
	_mi24_2 allowDamage false;
	(creategroup east) createVehicleCrew _mi24_2;

	grad_intro_mi24_2 = _mi24_2;
	publicVariable "grad_intro_mi24_2";

	private _data_2 = call compile loadFile ("USER\intro\fn_mi24_data_2.sqf");
	[_mi24_2, _data_2] spawn BIS_fnc_unitPlay;

}, [], 45] call CBA_fnc_waitAndExecute;


[{
	setTimeMultiplier 1;
}, [], 60] call CBA_Fnc_waitAndExecute;

