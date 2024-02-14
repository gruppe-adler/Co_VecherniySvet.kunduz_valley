if (!isServer) exitWith {};

params ["_object", "_scale"];

private _helper = "Sign_Sphere25cm_F" createVehicle [0,0,0];
_helper setPosASL getPosASL _object;
_helper setObjectTextureGlobal [0,"#(argb,8,8,3)color(1,1,1,0,ca)"];

[{
    CBA_missionTime > 10
}, {
    params ["_object", "_scale", "_helper"];

    // necessary to work on dedicated! (simpleobject might be fine but placement might be off)
    // attachToRelative makes sure rotation/dir is correct
    [_object, _helper, true] call BIS_fnc_attachToRelative;
    
	[{
		params ["_object", "_scale"];

    	[_object, _scale] remoteExec ["setObjectScale", 0, _object];

    	private _allObjects = missionNamespace getVariable ["GRAD_scaledObjects", []];
    	_allObjects pushBackUnique [_object, _scale];
    	missionNamespace setVariable ["GRAD_scaledObjects", _allObjects, true];

	}, [_object, _scale], 1] call CBA_fnc_waitAndExecute;

}, [_object, _scale, _helper]] call CBA_fnc_waitUntilAndExecute;
