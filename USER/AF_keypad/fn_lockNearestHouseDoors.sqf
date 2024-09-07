params ["_position", ["_lockDoors", true]];

private _house = nearestBuilding _position;

if (isNull _house) exitWith {
	systemchat "no building close by";
};

if (_house distance2d _position > 20) exitWith {
	systemchat "no building close by";
};

private _lock = if (_lockDoors) then { 1 } else { 0 };

for "_door" from 1 to getNumber (configOf _house >> "numberOfDoors") do {
	_house setVariable [format ["bis_disabled_Door_%1", _door], _lock, true];

	if (_lockDoors) then {
		systemchat ("locked door: " + str _door + " of " + typeof _house);
	} else {
		systemchat ("unlocked door: " + str _door + " of " + typeof _house);
	};
};

