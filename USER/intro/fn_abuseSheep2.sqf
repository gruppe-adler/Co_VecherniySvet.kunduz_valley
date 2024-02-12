params ["_unit"];

private _sheep = createAgent ["Sheep_Random_F", getpos _unit, [], 0, "NONE"];
_unit addEventHandler ["AnimDone",{
	params ["_unit"];

	_unit switchMove "MountSideProne";
}];


{
	_x params ["_classname", "_offset", "_yawPitchRoll"];
	
	_yawPitchRoll params ["_yaw", "_pitch", "_roll"];

	private _item = createVehicle [_classname, [0,0,0], [], 0, "NONE"];
	_item attachTo [_sheep, _offset];

	_item setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];

} forEach 
[
	["gm_shell_122mm_he_of462_static",
		[0.2768237,0.18462,0.59986],
		[0,90,0]
	],
	["gm_placeableItem_gc_army_vest_80_belt_str",
		[0.0,-0.132538,0.57],
		[0,0,0]
	],
	["Item_muzzle_antenna_02_f",
		[-0.6,0,0.65],
		[0,0,-90]
	]
];

_sheep switchMove "Sheep_Stop";
_sheep disableAI "FSM";

/*
[{
	{ deleteVehicle _x } forEach (attachedObjects _this);
	deleteVehicle _this;
}, _sheep, 7] call CBA_fnc_waitAndExecute;
*/