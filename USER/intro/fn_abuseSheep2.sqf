params ["_unitBehind", "_pos", "_dir"];


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


_unitBehind setPos (_pos getPos [0.6, _dir - 20]);
_unitBehind setDir (_unitBehind getDir intro_sheepTransport2);
_unitBehind setFormDir ((_unitBehind getDir intro_sheepTransport2));
_unitBehind disableAI "FSM";
[_unitBehind, intro_attachHelperButcher] call BIS_fnc_attachToRelative;
// [_unitBehind, intro_sheepTransport2, true] call BIS_fnc_attachToRelative;




/*
[{
	{ deleteVehicle _x } forEach (attachedObjects _this);
	deleteVehicle _this;
}, _sheep, 7] call CBA_fnc_waitAndExecute;
*/