params ["_leaflet"];

[
	_leaflet,														// Object the action is attached to
	"View torn paper",													// Title of the action
	"\a3\ui_f\data\igui\cfg\actions\talk_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",									// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; // code Completed
		
		if (missionNamespace getVariable ["grad_interrogation_lastIntelRead", false]) then {
			"There is an area marked north west of here on that map." call CBA_fnc_notify;
		} else {
			missionNamespace setVariable ["grad_interrogation_lastIntelRead", true, true];
			"There is an area marked north west of here on that map." call CBA_fnc_notify;
			"mrk_cia_hideout" setMarkerAlpha 1;
			"mrk_cia_hideout_2" setMarkerAlpha 1;
		};

	},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	12,																// Action duration in seconds
	0,																// Priority
	false,															// Remove on completion
	false															// Show in unconscious state
] call BIS_fnc_holdActionAdd;
