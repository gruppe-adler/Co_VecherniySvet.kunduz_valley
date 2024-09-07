params ["_door"];

_door addAction
[
    "Unlock",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        private _isRemoteControlledUnit = false;
        {
            if (getAssignedCuratorUnit _x isEqualTo player) exitWith {
                _isRemoteControlledUnit = true;
                _isRemoteControlledUnit;
            };
        } forEach allCurators;

		if (_isRemoteControlledUnit) then {
			"Unlocked" call CBA_fnc_notify;
			_target setVariable ["BIS_Disabled_Door_1",0,true];
			[_target,["GRAD_lock", 15]] remoteExec ["say3d", [0,-2] select isDedicated];
		} else {
			"I have no keys." call CBA_fnc_notify;
		};
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


_door addAction
[
    "Lock",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        private _isRemoteControlledUnit = false;
        {
            if (getAssignedCuratorUnit _x isEqualTo player) exitWith {
                _isRemoteControlledUnit = true;
                _isRemoteControlledUnit;
            };
        } forEach allCurators;

		if (_isRemoteControlledUnit) then {
			"Locked" call CBA_fnc_notify;
			_target setVariable ["BIS_Disabled_Door_1",1,true];
			[_target,["GRAD_lock", 15]] remoteExec ["say3d", [0,-2] select isDedicated];
		} else {
			"I have no keys." call CBA_fnc_notify;
		};
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
