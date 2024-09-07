params ["_keypad"];
 
private _gate = nearestObject [position _keypad, "land_vn_embassy_gate_01"];
 
// model = "vn\structures_f_vietnam_04\civ\embassy\vn_embassy_gate_01.p3d";
private _gateNew = "land_vn_embassy_gate_01" createVehicle [0,0,0];
_gateNew setDir getDir _gate;

private _pos = getPosWorld _gate;
_gateNew setPosWorld _pos;

deleteVehicle _gate;


_gateNew setVariable ["BIS_Disabled_Door_1",0,true]; 
_gateNew setVariable ["BIS_Disabled_Door_2",0,true]; 

_gateNew animatesource ["door_01_sound_source", 1, .2];
_gateNew animatesource ["door_02_sound_source", 1, .2];
