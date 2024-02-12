params ["_unit"];

if (!isServer) exitWith {};

[_unit,"Acts_carFixingWheel"] remoteExec ["switchMove"];

_unit addEventhandler ["AnimDone", {
	[(_this select 0),"Acts_carFixingWheel"] remoteExec ["switchMove"];
}];  

_unit disableAI "AUTOCOMBAT";