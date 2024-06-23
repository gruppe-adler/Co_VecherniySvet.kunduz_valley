params ["_vehicle"];

_vehicle setVariable ["lambs_danger_disableAI", true, true];
_vehicle limitSpeed 50;

private _path = [];

private _index = missionNamespace getVariable ["grad_reinforcements_index", 0];
_index = (_index + 1) mod 3;
missionNamespace setVariable ["grad_reinforcements_index", _index, true];
diag_log format ["setting convoy index to %1", _index];

for "_i" from 1 to 42 do {

	private _name = format ["reinforcements_convoy_path_%1", _i];
	private _position = getPos (call compile _name);
	
	// slow down vehicles in a sharp turn
	if (_i > 14 && _i < 21) then {
		_position pushBack (25/3.6);
	};
	
	_path pushBack _position;

};


switch (_index) do {
	case 0: {
		for "_i" from 43 to 46 do {
			private _name = format ["reinforcements_convoy_path_%1", _i];
			private _position = getPos (call compile _name);
			_path pushBack _position;
		};
	};
	case 1: {
		for "_i" from 47 to 52 do {
			private _name = format ["reinforcements_convoy_path_%1", _i];
			private _position = getPos (call compile _name);
			_path pushBack _position;
		};
	};
	case 2: {
		for "_i" from 53 to 57 do {
			private _name = format ["reinforcements_convoy_path_%1", _i];
			private _position = getPos (call compile _name);
			_path pushBack _position;
		};
	};
	default { };
};

_vehicle setDriveOnPath _path;
