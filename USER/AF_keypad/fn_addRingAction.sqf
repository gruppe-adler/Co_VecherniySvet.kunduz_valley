params ["_bell"];

_bell addAction
[
    "Ring Door",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        if (_target getVariable ["AF_KP_keyPadInUse", false]) then {
            "Bell already in use" call CBA_fnc_notify;
        };

		_target setVariable ["AF_KP_keyPadInUse", true, true];

		[_target, "alarm"] remoteExec ["say3D"];

		[{
			_this setVariable ["AF_KP_keyPadInUse", false, true];
		}, _target, 3] call CBA_fnc_waitAndExecute;
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "true",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];