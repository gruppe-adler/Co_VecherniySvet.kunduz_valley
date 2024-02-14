params ["_unitNext", "_unitBehind", "_pos", "_dir"];

/* unit next animation */
[_unitNext, ""] remoteExec ["switchmove"];
_unitNext addEventHandler ["AnimDone",{
	params ["_unitNext"];

	[_unitNext, "Acts_carFixingWheel"] remoteExec ["switchmove"];
}];
_unitNext disableAI "AUTOCOMBAT";

/* unit behind animation */
[_unitBehind,""] remoteExec ["switchMove"];
_unitBehind addEventhandler ["AnimDone", {
	[(_this select 0),"ace_dragging_static"] remoteExec ["switchMove"];
}];  


private _drill = createSimpleObject ["Land_DrillAku_F", getPosASL _unitBehind, false];
_drill attachTo [_unitBehind, [-0.08,0,0], "righthand", true];

private _yaw = 0; private _pitch = -90; private _roll = 0;
_drill setVectorDirAndUp [ 
 [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch], 
 [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D 
];


_unitBehind disableAI "AUTOCOMBAT";


private _sheep = createAgent ["Sheep_Random_F", _pos, [], 0, "CAN_COLLIDE"];
_sheep setVariable ["BIS_fnc_animalBehaviour_disable", true];
_sheep setPos _pos;
_sheep setDir _dir;
_sheep disableAI "ALL";// [_sheep, "Sheep_Stop"] remoteExec ["switchmove"];

_unitBehind setPos (_pos getPos [0.6, _dir - 110]);
_unitBehind setDir (_unitBehind getDir _sheep);
_unitBehind setFormDir ((_unitNext getDir _sheep));
_unitBehind disableAI "FSM";
[_unitBehind, _sheep, true] call BIS_fnc_attachToRelative;

_unitNext setPos (_pos getPos [0.6, _dir + 110]);
_unitNext setDir ((_unitNext getDir _sheep));
_unitNext setFormDir ((_unitNext getDir _sheep));
_unitNext disableAI "FSM";
[_unitNext, _sheep, true] call BIS_fnc_attachToRelative;
// [_unitNext, ""] remoteExec ["switchmove"];

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