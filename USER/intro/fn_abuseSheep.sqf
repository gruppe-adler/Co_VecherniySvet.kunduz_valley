/*

	testing func

*/


sheep = createSimpleObject ["Sheep_F_Random", [0,0,0], true];
unit = cursorObject;


private _position = unit getpos [1.25, getdir unit];
_position set [1, _position#1+0.05];
_position set [2, _position#2 + 1.8];
sheep setpos _position;
sheep setdir getdir unit;

grenade = createSimpleObject ["gm_shell_122mm_he_of462_static", [0,0,0], true];
grenade attachTo [unit, [-0.1,0.01,0.05], "righthand", true];
_yaw = 00; _pitch = 180; _roll = 45;
grenade setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];


unit switchMove "gm_uaz469_cargo_04_in_wuna_to_in_wpstsras";

unit addEventHandler ["AnimDone", {
	params ["_unit", "_anim"];

	if (_anim == "gm_uaz469_cargo_04_in_wuna_to_in_wpstsras") then {
		_unit switchMove "gm_uaz469_cargo_05_in_wpstsras_to_in_wuna";
		deleteVehicle grenade;
	};

	if (_anim == "gm_uaz469_cargo_05_in_wpstsras_to_in_wuna") then {
		_unit switchMove "gm_uaz469_cargo_04_in_wuna_to_in_wpstsras";
	};
}];
