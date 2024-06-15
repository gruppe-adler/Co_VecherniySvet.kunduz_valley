params ["_unit"];

private _actionId = _unit addAction
[
	"Interrogate",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[_target] call grad_interrogation_fnc_interrogate;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"!(_originalTarget getVariable ['grad_interrogation_answering', false]) && !local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_unit setUserActionText [_actionId, "Interrogate", "<img size='2' image='\A3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa'/>"];



_unit addAction
[
	"<t color='#ff0000'>Say No</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom [_gender + "_no", _gender + "_no_2", _gender + "_no_3"];
		private _answerArray = [_answer + "_en", _answer + "_arab"];
		[_target, _answerArray] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_unit addAction
[
	"<t color='#00ff00'>Say Yes</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom [_gender + "_yes", _gender + "_yes_2", _gender + "_yes_3"];
		private _answerArray = [_answer + "_en", _answer + "_arab"];
		[_target, _answerArray] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_unit addAction
[
	"<t color='#ffffff'>Say Followme</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom [_gender + "_followme", _gender + "_followme_2", _gender + "_followme_3"];
		private _answerArray = [_answer + "_en", _answer + "_arab"];
		[_target, _answerArray] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_unit addAction
[
	"<t color='#0000FF'>This is the one</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom [_gender + "_thisistheone", _gender + "_thisistheone_2", _gender + "_thisistheone_3"];
		private _answerArray = [_answer + "_en", _answer + "_arab"];
		[_target, _answerArray] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_unit addAction
[
	"<t color='#0000FF'>Hamdullila</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom [_gender + "_hamdullila", _gender + "_hamdullila_2"];
		private _answerArray = [_answer + "_en", _answer + "_arab"];
		[_target, _answerArray] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_unit addAction
[
	"<t color='#0000FF'>Dont know</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom (call compile ("GRAD_INTERROGATION_SOUNDS_DONTKNOW_" + _gender));
		[_target, _answer] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];


_unit addAction
[
	"<t color='#0000FF'>Stop hurting</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		private _gender = if (typeOf _target in [
                "Max_Tak_woman1",
                "Max_Tak_woman2",
                "Max_Tak_woman3",
                "Max_Tak_woman4",
                "Max_Tak_woman5",
                "Max_Tak_woman6"
            ]) then { "female" } else { "male" };
		private _answer = selectRandom (call compile ("GRAD_INTERROGATION_SOUNDS_STOPHURTING_" + _gender));
		[_target, _answer] remoteExec ["grad_interrogation_fnc_answer"];
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"player == (_originalTarget getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && local _originalTarget",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];