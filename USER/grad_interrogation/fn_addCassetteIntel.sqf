/*

needs array of en/arab sound

*/

params ["_object", "_intelsound"];

_object setVariable ["grad_intelsound", _intelsound];

// adds the action to every client and JIP, but also adds it when it was already removed. E.g., Laptop has already been hacked by a player
[
	_object,														// Object the action is attached to
	"Play Answering Machine",													// Title of the action
	"\a3\ui_f\data\igui\cfg\actions\talk_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3 && !(_this getVariable ['grad_playing', false])",	// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; // code Completed
		
		private _sound = _target getVariable ['grad_intelsound', []];
		[_target, _sound] remoteExec ["grad_interrogation_fnc_playCassetteSoundLocalised", 0];

	},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	0,															// Action duration in seconds
	0,																// Priority
	false,															// Remove on completion
	false															// Show in unconscious state
] call BIS_fnc_holdActionAdd;
