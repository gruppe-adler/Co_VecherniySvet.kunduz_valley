//This checks the variables passed in the execVM statments("number","enter" or "clear")

private _keypadAffected = nearestObject [position player, "land_gm_euro_furniture_telephone_02"]; // todo helper object that is unique for keypads
private _keycode = _keypadAffected getVariable ["AF_KP_keycode", "none"];
private _codeToUnlock = _keypadAffected getVariable ["AF_KP_codeToUnlock", {}];

[player, "beep_strobe"] remoteExec ["say3D", 0];

switch (_this select 0) do {
	case "number": {
		AF_KP_keypad_InputText = AF_KP_keypad_InputText + format["%1", _this select 1];
		ctrlSetText[1000, AF_KP_keypad_InputText];
	};
	
	case "clear": {
		AF_KP_keypad_InputText = "";
		ctrlSetText[1000, AF_KP_keypad_clearText];
	};
	
	case "enter": {
		AF_KP_keypad_OutputText = AF_KP_keypad_InputText;

		if (AF_KP_keypad_OutputText == _keycode) then {
			_keypadAffected call compile _codeToUnlock;
			 private _light = _keypadAffected getVariable ["AF_KP_light", objNull];
			 private _texture = "#(rgb,8,8,3)color(0,0.5,0,1)"; 
    		 _light setObjectTextureGlobal [0, _texture];

			[player, "target_locked"] remoteExec ["say3D", 0];
		} else {
			if (player getVariable ["grad_roles_thermals", false] && count AF_KP_keypad_OutputText > 7 ||
				player getVariable ["grad_roles_thermals", false] && AF_KP_keypad_OutputText == "1337") then {
				_keypadAffected call compile _codeToUnlock;
				[player, "target_locked"] remoteExec ["say3D", 0];
				"Hacked the System :]" call CBA_fnc_notify;

				private _light = _keypadAffected getVariable ["AF_KP_light", objNull];
			 	private _texture = "#(rgb,8,8,3)color(0,0.5,0,1)";
				_light setObjectTextureGlobal [0, _texture];

			} else {
				[player, "radioerror"] remoteExec ["say3D", 0];
				"Wrong code." call CBA_fnc_notify;
			 };
		};
		closeDialog 0;
	};
};
