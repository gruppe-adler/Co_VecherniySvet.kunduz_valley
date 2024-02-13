params ["_unit"];

if (!isServer) exitWith {};

[_unit,"ace_dragging_static"] remoteExec ["switchMove"];

_unit addEventhandler ["AnimDone", {
	[(_this select 0),"ace_dragging_static"] remoteExec ["switchMove"];
}];  

private _drill = createSimpleObject ["Land_DrillAku_F", getPosASL _unit, false];
_drill attachTo [_unit, [-0.08,0,0], "righthand", true];

private _yaw = 0; private _pitch = -90; private _roll = 0;
_drill setVectorDirAndUp [ 
 [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch], 
 [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D 
];


_unit disableAI "AUTOCOMBAT";