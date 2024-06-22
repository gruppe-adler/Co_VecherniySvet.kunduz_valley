params ["_recorder", "_answer"];
_recorder setVariable ['grad_playing', true];

_answer params ["_translated", "_common"];

private _sound = objNull;

if (player getvariable ["grad_interrogation_isTranslator", false]) then {
	_sound = _recorder say3D _translated;
} else {
	_sound = _recorder say3D _common;
};
_recorder animate ["play", 1];
_recorder animate ["static_cog_hide", 1]; 
_recorder animate ["rolling_cogl_hide", 1];

// stop lip movement when sound is done
[{
	params ["_sound", "_recorder"];
	isNull _sound 
},{
	params ["_sound", "_recorder"];
	_recorder setVariable ['grad_playing', false];

	_recorder animate ["stop", 1]; 
	_recorder animate ["stop", 0]; 
	_recorder animate ["play", 0]; 
	_recorder animate ["record", 0]; 
	_recorder animate ["static_cog_hide", 0]; 
	_recorder animate ["rolling_cogl_hide", 0];

}, [_sound, _recorder]] call CBA_fnc_waitUntilAndExecute;
