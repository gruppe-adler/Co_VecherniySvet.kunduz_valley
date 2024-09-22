params ["_book"];

[
	_book,														// Object the action is attached to
	"Take closer look",													// Title of the action
	"\a3\ui_f\data\igui\cfg\actions\talk_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",									// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; // code Completed
		
		"Quran Edition of the Mosque Gerdan." call CBA_fnc_notify;
			

	},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	1,																// Action duration in seconds
	0,																// Priority
	false,															// Remove on completion
	false															// Show in unconscious state
] call BIS_fnc_holdActionAdd;
