params ["_toilet"];

_toilet addAction
[
    "Flush",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

		if (_target getVariable ['GRAD_flushed', false]) exitWith {
			"Water is still running, wait a bit." call CBA_fnc_notify;
		};

		[_target,["GRAD_flush", 15]] remoteExec ["say3d", [0,-2] select isDedicated];
        
		_target setVariable ["GRAD_flushed", true, true];

		// disconnect proof
		[{
			_this setVariable ["GRAD_flushed", false, true];
		}, _target, 50] remoteExec ["CBA_fnc_waitAndExecute", 2];
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "!(_target getVariable ['GRAD_flushed', false]);",     // condition
    1.5,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];
