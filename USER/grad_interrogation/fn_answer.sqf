params ["_unit", "_answer"];
_unit setVariable ['grad_interrogation_answering', true];

_answer params ["_translated", "_common"];

private _sound = objNull;

if (player getvariable ["grad_interrogation_isTranslator", false]) then {
	_sound = _unit say3D _translated;
} else {
	_sound = _unit say3D _common;
};

// make lips move
_unit setRandomLip true;


// interrupt sound if unit is dead or uncon
private _handle = [{
	params ["_args", "_handle"];
	_args params ["_unit", "_sound"];

	if (!alive _unit || _unit getVariable ["ACE_isUnconscious", false]) then {
		deleteVehicle _sound;
	};

}, 0.1, [_unit, _sound]] call CBA_fnc_addPerFrameHandler;

// stop lip movement when sound is done
[{
	params ["_sound", "_unit"];
	isNull _sound 
},{
	params ["_sound", "_unit", "_handle"];
	_unit setRandomLip false;
	_unit setVariable ['grad_interrogation_answering', false];
	[_handle] call CBA_fnc_removePerFrameHandler;
}, [_sound, _unit, _handle]] call CBA_fnc_waitUntilAndExecute;
