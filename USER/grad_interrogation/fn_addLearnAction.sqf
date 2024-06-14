params ["_book"];

// needs to be in init on object all clients

// adds the action to every client and JIP, but also adds it when it was already removed. E.g., Laptop has already been hacked by a player
[
	_book,														// Object the action is attached to
	"Learn Pashtu",													// Title of the action
	"\a3\ui_f\data\igui\cfg\actions\talk_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",									// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; // code Completed
		
		private _alreadyLearned = _target getVariable ["grad_interrogation_triedToLearn", 0];

		if (_alreadyLearned < 1) then {
			if (random 2 > 1) then {
				"This is great, I can understand pashtun now." call CBA_fnc_notify;
				 _target setVariable ["grad_interrogation_triedToLearn", 2, true];
				 _target setVariable ["grad_interrogation_isTranslator", true, true];
			} else {
				_target setVariable ["grad_interrogation_triedToLearn", 1, true];
				"I am too dumb to learn pashtun :(" call CBA_fnc_notify;
			};
		} else {
			if (_alreadyLearned == 1) then {
				"I am too dumb to learn pashtun :(" call CBA_fnc_notify;
			} else {
				"I already know pashtun." call CBA_fnc_notify;
			};
		};

	},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	12,																// Action duration in seconds
	0,																// Priority
	false,															// Remove on completion
	false															// Show in unconscious state
] call BIS_fnc_holdActionAdd;
