private _keypadAffected = nearestObject [position player, "land_gm_euro_furniture_telephone_02"];

_keypadAffected setVariable ["AF_KP_keyPadInUse", false, true];

// reset input vars
AF_KP_keypad_InputText = "";
AF_KP_keypad_OutputText = "";