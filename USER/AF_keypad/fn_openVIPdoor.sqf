params ["_keypad"];
 
private _gate = nearestObject [position _keypad, "grad_extras_shootHouseDoor"];
 
_gate setVariable ["BIS_Disabled_Door_1",0,true];

_gate animatesource ["Door_1_sound_source", 1, 1];
