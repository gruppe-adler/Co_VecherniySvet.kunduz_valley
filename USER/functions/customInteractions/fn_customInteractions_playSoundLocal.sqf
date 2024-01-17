params ["_unit", "_sound", ["_variableToAbort", "none"]];

private _dummy = createSimpleObject ["Sign_Sphere10cm_F", getPosASL _unit];
_dummy setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
_dummy attachTo [_unit, [0,0,0]];
private _soundObject = _dummy say3D _sound;

_unit setRandomLip true;
[{
	params ["_unit", "_soundObject", "_variableToAbort", "_dummy"];
	isNull _soundObject || !(_unit getVariable [_variableToAbort, true]) || !([_unit] call ace_common_fnc_isAwake)
},{
	params ["_unit", "_soundObject", "_variableToAbort", "_dummy"];
	_unit setRandomLip false;
	deleteVehicle _dummy; // allows for abort of sound

}, [_unit, _soundObject, _variableToAbort, _dummy]] call CBA_fnc_waitUntilAndExecute;
