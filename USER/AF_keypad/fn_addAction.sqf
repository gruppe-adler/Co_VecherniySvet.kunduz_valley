/*

	[this, "11333", {
		{
			private _selName = _x select 0;

			if (_selName select [0,5] == "door_") exitWith
			{
				_target setVariable ["bis_disabled_" + _selName, 0, true];
			};
		} forEach selectionNames (_this);
	}] execVM "USER\AF_keypad\AF_KP_addAction.sqf";

*/


params ["_keypad", ["_keycode", "none"], ["_unlockCode", { systemchat "no unlock code provided;" }]];

if (isServer) then {
    
    private _light = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
    _light attachTo [_keypad, [0.0830078,0.0302887,0.0180677]];
    _light setObjectMaterialGlobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
    private _texture = "#(rgb,8,8,3)color(1,0,0,1)"; 
    _light setObjectTextureGlobal [0, _texture];
    _keypad setVariable ["AF_KP_light", _light, true];

    _keypad setVariable ["AF_KP_keycode", _keycode, true];
    _keypad setVariable ["AF_KP_codeToUnlock", _unlockCode, true];

};


_keypad addAction
[
    "Show Keypad",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        if (_target getVariable ["AF_KP_keyPadInUse", false]) then {
            hint "KeyPad already in use";
        } else {
            _target setVariable ["AF_KP_keyPadInUse", true, true];
            createDialog "AF_Keypad";
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
