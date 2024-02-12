params ["_unit"];

if (!isServer) exitWith {};

[_unit,"ace_dragging_rifle_limpB"] remoteExec ["switchMove"];

_unit addEventhandler ["AnimDone", {
	[(_this select 0),"ace_dragging_rifle_limpB"] remoteExec ["switchMove"];
}];  

private _drill = createSimpleObject ["Land_DrillAku_F", getPosASL _unit, false];
_drill attachTo [_unit, [0,0,0], "righthand", true];


_unit disableAI "AUTOCOMBAT";