private _path = [];

for "_i" from 0 to 29 do {

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
	intro_sheepTransport2 setDriveOnPath _path;
	intro_sheepTransport2 forceSpeed 60;
}, [_path]] call CBA_fnc_waitUntilAndExecute;


[{
	intro_sheepTransport2 distance introConvoy1 < 10 &&
	!isNil "sheepTransportGo"
},{
	introConvoy1 setdamage 1;
	intro_sheepTransport2 setdamage 1;
}] call CBA_fnc_waitUntilAndExecute;