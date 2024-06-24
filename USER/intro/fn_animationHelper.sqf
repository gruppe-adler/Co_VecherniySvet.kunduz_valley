params ["_unit", "_anim"];

if (isServer) then {
	_unit disableAI "MOVE";
	_unit setVariable ["lambs_danger_disableGroupAI", true, true];
};

_unit switchMove _anim;

_unit addEventHandler ["AnimDone", {
	params ["_unit", "_anim"];

	_unit switchMove _anim;
}];
