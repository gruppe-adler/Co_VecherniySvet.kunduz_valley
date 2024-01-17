/*
private _logics = entities "Logic";
private _syncHelpers = [];

{
	if (_x getVariable ["grad_isPowerline", false]) then {
		_syncHelpers pushBackUnique _x;
	};
} foreach _logics;

{
	private _clusters = synchronizedObjects _x;
	_clusters params [["_object1", objNull], ["_object2", objNull]];
	[_object1, _object2] call grad_sr_fnc_powerline_createPowerline;
} forEach _syncHelpers;

*/