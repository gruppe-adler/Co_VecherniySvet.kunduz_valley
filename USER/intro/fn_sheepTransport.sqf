
/* intro sheepTransport that is seen by players end of intro */
private _sheeps = [];
for "_i" from 1 to 25 do {
	private _singleSheep = createAgent["Sheep_Random_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_sheeps pushback _singleSheep;
	_singleSheep setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_singleSheep disableAI "ALL";
};

{ 
	[intro_sheepTransport, _x] call  grad_animalTransport_common_fnc_vehicle_loadAnimal;
} forEach _sheeps;

/* intro sheepTransport that is first seen in intro */
private _sheeps2 = [];
for "_i" from 1 to 24 do {
	private _singleSheep = createAgent["Sheep_Random_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_sheeps2 pushback _singleSheep;
	_singleSheep setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_singleSheep disableAI "ALL";
};

{ 
	[intro_sheepTransport2, _x] call  grad_animalTransport_common_fnc_vehicle_loadAnimal;
} forEach _sheeps2;




private _path = [];

for "_i" from 0 to 29 do {

	private _name = ("intro_sheeptransport_path_" + str _i);
	private _object = missionNamespace getVariable _name;
	private _pos = getPos _object;

	if (_i < 5) then {
		_pos pushback 30;
	} else {
		_pos pushback (30 + _i);
	};

	_path pushback _pos;
};

[{
	!isNil "sheepTransportGo"
},{
	params ["_path"];

	intro_sheepTransport setDriveOnPath _path;
	intro_sheepTransport forceSpeed 60;
}, [_path]] call CBA_fnc_waitUntilAndExecute;


[{
	intro_sheepTransport distance introConvoy1 < 10 &&
	!isNil "sheepTransportGo"
},{
	introConvoy1 setdamage 1;
	intro_sheepTransport setdamage 1;
}] call CBA_fnc_waitUntilAndExecute;