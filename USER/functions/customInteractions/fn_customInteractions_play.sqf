params ["_unit", "_type"];

private _name = _unit getVariable ["grad_SR_name", "none"];
private _emotion = _unit getVariable ["grad_SR_emotion", "fear"];

private _soundCount = [_name, _type, _emotion] call grad_SR_fnc_customInteractions_getSoundCount;
private _gestures = [_type] call grad_SR_fnc_customInteractions_getGestureAndSound;

if (_soundCount < 1) exitWith { hint "error, no sounds"; };
// systemChat ("sound count : " + str _soundCount);
private _allSounds = [];
for "_i" from 1 to _soundCount do { 
	_allSounds pushBack _i;
};

private _soundID = "grad_SR_customInteractionSoundsUsed_" + _name + _type;
private _soundsUsed = _unit getVariable [_soundID, []];
private _soundsAlreadyUsedCompare = _soundsUsed arrayIntersect _allSounds;

private _soundsLeft = _allSounds - _soundsAlreadyUsedCompare;

// systemChat str (_allSounds);

private _randomSound = selectRandom _soundsLeft; 

if (count _soundsLeft == 1) then {
	_unit setVariable [_soundID, []];
} else {
	_soundsUsed pushBackUnique _randomSound;
	_unit setVariable [_soundID, _soundsUsed];
};


// systemChat str _soundsUsed;


private _soundName = _name + "_" + _type + "_" + str _randomSound + "_" + _emotion;



if (count _gestures > 0) then {
	_unit setVariable ["grad_SR_gestureRunning", true];
	
	private _gesture = selectrandom _gestures;
	[_unit, _gesture, 1] call ace_common_fnc_doGesture;
};

[_unit, _soundName] remoteExec ["grad_SR_fnc_customInteractions_playSoundLocal"];
// systemChat "playing";