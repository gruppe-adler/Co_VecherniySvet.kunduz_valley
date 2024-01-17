params ["_unit", "_name"];

// only add once / failsafe
if (_unit getVariable ["grad_SR_actionsAdded", false]) exitWith {};
_unit setVariable ["grad_SR_actionsAdded", true];

// name is used for sound file identification of voice

_unit addEventHandler ["GestureDone", {
	params ["_unit", "_gesture"];

	_unit setVariable ["grad_SR_gestureRunning", false, true];
}];


if (_name == "nadia") then {

	_unit setVariable ["grad_SR_name", "nadia"];
	_unit setVariable ["grad_SR_emotion", "calm"];

	// CHANGE EMOTION
	_unit addAction
	[
		"<t color='#3366FF'>Change Emotion (CALM)</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] call grad_SR_fnc_customInteractions_changeEmotion;
			
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (_this getVariable ['GRAD_SR_emotion', 'calm']) == 'calm'", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"<t color='#33FF66'>Change Emotion (FEAR)</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] call grad_SR_fnc_customInteractions_changeEmotion;
			
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (_this getVariable ['GRAD_SR_emotion', 'none']) == 'fear'", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"<t color='#FF3366'>Change Emotion (SEDUCE)</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] call grad_SR_fnc_customInteractions_changeEmotion;
			
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (_this getVariable ['GRAD_SR_emotion', 'none'] == 'seduce')", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"Pee After",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "peeafter"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'peeAfter', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"<t color='#FFD966'>Pee Now (Animation)</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] remoteExecCall ["grad_SR_fnc_hooker_animSquatStart", 0];
			
		},
		nil,		// arguments
		2,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !(_this getvariable ['grad_SR_animationRunning', false])", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"<t color='#FFD966'>Dance (Animation)</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] remoteExecCall ["grad_SR_fnc_hooker_dance", 0];
			
		},
		nil,		// arguments
		2,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !(_this getvariable ['grad_SR_animationRunning', false])", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"<t color='#FFD966'>End animation</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, ""] remoteExecCall ["switchmove", 0];
			
		},
		nil,		// arguments
		2,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !(_this getvariable ['grad_SR_animationRunning', false])", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"Pee Before",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "peebefore"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'peeBefore', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"Confused",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "confused"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'confused', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"Greet",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "greet"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'greet', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];


	_unit addAction
	[
		"dontknow",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "dontknow"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'dontknow', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];



	_unit addAction
	[
		"Phone Friend Start",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller] call grad_SR_fnc_hooker_call;
			
		},
		nil,		// arguments
		2.5,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && !(_originalTarget getVariable ['grad_SR_hookerPhoning', false])", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

		_unit addAction
	[
		"Phone Friend Abort",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			_caller setVariable ['grad_SR_hookerPhoning', false, true];
			
		},
		nil,		// arguments
		2.5,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (_originalTarget getVariable ['grad_SR_hookerPhoning', false])", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];



	_unit addAction
	[
		"no",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "no"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1.1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'no', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"quasimdead",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "quasimdead"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		.8,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'quasimdead', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"quasimlove",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "quasimlove"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		.4,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'quasimlove', (_originalTarget getVariable ['grad_SR_emotion', 'seduce'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"whatshappening",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "whatshappening"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'whatshappening', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

	_unit addAction
	[
		"yes",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			[_caller, "yes"] call grad_SR_fnc_customInteractions_play;
			
		},
		nil,		// arguments
		1.2,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"player == (_this getVariable ['BIS_fnc_moduleRemoteControl_owner', objNull]) && (['nadia', 'yes', (_originalTarget getVariable ['grad_SR_emotion', 'fear'])] call grad_SR_fnc_customInteractions_getSoundCount) > 0", 	// condition
		0,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
};
