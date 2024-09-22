params ["_radio"];

private _sound = objNull;

if (player getvariable ["grad_interrogation_isTranslator", false]) then {
	_sound = _radio say3D "intel_mosque_en";
} else {
	_sound = _radio say3D "intel_mosque_arab";
};

[{
	params ["_sound", "_radio"];

	isNull _sound
},{
	params ["_sound", "_radio"];

	if (_radio getVariable ["grad_isPlaying"]) then {
		[_radio] spawn grad_interrogation_fnc_loopRadio;
	};

}, [_sound, _radio]] call CBA_fnc_waitUntilAndExecute;
