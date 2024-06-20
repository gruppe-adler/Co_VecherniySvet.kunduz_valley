private _path = [];

for "_i" from 0 to 20 do {

	private _name = ("intro_sheeptransport_path_" + str _i);
	private _object = missionNamespace getVariable _name;
	private _pos = getPos _object;

	if (_i < 5) then {
		_pos pushback 30;
	} else {
		if (_i > 14) then {
			_pos pushback (17);
		} else {
			_pos pushback (30 + _i);
		};
	};

	_path pushback _pos;
};

[{
	!isNil "sheepTransportGo"
},{
	params ["_path"];

	intro_sheepTransport2 setPos getPos intro_sheeptransport_start;
	intro_sheepTransport2 setDir getDir intro_sheeptransport_start;
	intro_sheepTransport2 engineOn true;
	intro_sheepTransport2 setDriveOnPath _path;
	intro_sheepTransport2 forceSpeed 60;
}, [_path]] call CBA_fnc_waitUntilAndExecute;


[{
	intro_sheepTransport2 distance introConvoy1 < 12 &&
	!isNil "sheepTransportGo"
},{
	private _pos1 = getPos intro_sheepTransport2;
	private _scriptedCharge = "Bo_GBU12_LGB" createVehicle _pos1;
	_scriptedCharge setPos _pos1;
	_scriptedCharge setDamage 1;
	intro_sheepTransport2 setDamage 1;
	[{
		private _pos = getPos introConvoy1;
		private _scriptedCharge = "DemoCharge_Remote_Ammo_Scripted" createVehicle _pos;
		_scriptedCharge setPos _pos;
		_scriptedCharge setDamage 1;
		introConvoy1 setDamage 1;
	}, [], 0.25] call CBA_fnc_waitAndExecute;

	// start Ambush
	[{
		{
			_x enableAI "ALL";
			_x setUnitPos "AUTO";
		} forEach ((units GRAD_AmbushGrp_1) + (units GRAD_AmbushGrp_2));
	}, [], 20] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_waitUntilAndExecute;