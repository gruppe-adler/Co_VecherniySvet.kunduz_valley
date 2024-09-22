params ["_keypadAffected"];

_keypadAffected setVariable ["AF_KP_keyPadInUse", false, true];

// reset input vars
AF_KP_keypad_InputText = "";
AF_KP_keypad_OutputText = "";
AF_KP_keypad_clearText = "Enter Keycode";