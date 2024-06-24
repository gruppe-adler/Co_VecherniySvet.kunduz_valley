params ["_unit", "_anim"];

if (isServer) then {
	_unit disableAI "MOVE";
	_unit allowDamage false;
	_unit setVariable ["lambs_danger_disableGroupAI", true, true];
};

if (local _unit) then {
	_unit switchMove _anim;
};

_unit addEventHandler ["AnimDone", {
	params ["_unit", "_anim"];

	if (local _unit) then {
		_unit switchMove _anim;
	};
}];
