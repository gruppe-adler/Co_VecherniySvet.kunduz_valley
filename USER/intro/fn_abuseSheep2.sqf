params ["_unit", "_pos", "_dir"];



[_unit, "MountSideProne"] remoteExec ["switchmove"];
_unit addEventHandler ["AnimDone",{
	params ["_unit"];

	[_unit, "MountSideProne"] remoteExec ["switchmove"];
}];




private _sheep = createAgent ["Sheep_Random_F", getpos _unit, [], 0, "CAN_COLLIDE"];
_sheep setVariable ["BIS_fnc_animalBehaviour_disable", true];
_sheep setDir 180;
_sheep setPos _pos;
_sheep setDir _dir;
_sheep disableAI "ALL";// [_sheep, "Sheep_Stop"] remoteExec ["switchmove"];

_unit setDir (_unit getDir _sheep);

// [_unit, ""] remoteExec ["switchmove"];

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
		[-0.2268237,0.68462,0.73986],
		[0,90,0]
	],
	["gm_placeableItem_gc_army_vest_80_belt_str",
		[0.0,0.332538,0.74],
		[0,0,0]
	],
	["Item_muzzle_antenna_02_f",
		[-0.55,0.49,0.8],
		[0,0,-90]
	]
];



[_sheep, "Sheep_Stop"] remoteExec ["switchmove"];
_sheep disableAI "FSM";
_sheep disableAI "MOVE";


/*
[{
	{ deleteVehicle _x } forEach (attachedObjects _this);
	deleteVehicle _this;
}, _sheep, 7] call CBA_fnc_waitAndExecute;
*/