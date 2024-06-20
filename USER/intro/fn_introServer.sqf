private _duration = 120;

// skiptime 3;
setTimeMultiplier 1;
// skiptime -1.5;

[_duration] remoteExec ["grad_intro_fnc_intro_start", 0, false];


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
	_mi24_1 disableAI "ANIM";
	_mi24_1 flyInHeightASL [20,20,20];
	_mi24_1 setBehaviour "CARELESS";
	_mi24_1 setCombatMode "BLUE";

	(creategroup east) createVehicleCrew _mi24_1;

	grad_intro_mi24_1 = _mi24_1;
	publicVariable "grad_intro_mi24_1";

	private _data_1 = call compile loadFile ("USER\intro\fn_mi24_data_3.sqf");
	[_mi24_1, _data_1] spawn BIS_fnc_unitPlay;

	/*

		// debug path
		_mi24_1 spawn {
		
		while {alive _this} do {
			createSimpleObject["Sign_sphere10cm_EP1", getPosASL _this, true];
			sleep 0.1;
			};
	
		};
	*/


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

}, [], 28] call CBA_fnc_waitAndExecute;

private _pos = getPos intro_sheep;
private _dir = getDir intro_sheep;

[intro_butcher2, _pos, _dir] call grad_intro_fnc_abuseSheep2;

[{
	setTimeMultiplier 1;
	[] call grad_intro_fnc_spawnRabbits;
}, [], 60] call CBA_Fnc_waitAndExecute;


[{
	{
		_x params ["_vehicle", "_arrow"];
		_vehicle setpos getpos _arrow;
		_vehicle setdir getDir _arrow;
	} forEach [
		[introConvoy1, intro_convoystart_1],
		[introConvoy2, intro_convoystart_2],
		[introConvoy3, intro_convoystart_3],
		[introConvoy4, intro_convoystart_4]
	]; 
	
}, [], 20] call CBA_Fnc_waitAndExecute;


[{
	
	convoyTransportGo = true;
	publicVariable "convoyTransportGo";
	
}, [], 75] call CBA_fnc_waitAndExecute;

[{
	
	sheepTransportGo = true;
	publicVariable "sheepTransportGo";
	
}, [], 174] call CBA_fnc_waitAndExecute;
