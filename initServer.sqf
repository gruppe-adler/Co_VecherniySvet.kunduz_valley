["Initialize"] call BIS_fnc_dynamicGroups;

// EH to enable Stinger guidance for independent
["CAManBase", "init", {
	
	private _unit = (_this select 0);
	
	if ((side _unit) != independent) exitWith {};

	[_unit] remoteExec ["GRAD_SR_fnc_addStingerEH", 0];
}, true, [], true] call CBA_fnc_addClassEventHandler;