params ["_name", "_sound", "_emotion"];

private _count = 0;

for "_i" from 1 to 10 do { 

	private _soundName = _name + "_" + _sound + "_" + (str _i) + "_" + _emotion;
	// systemChat _soundName;
	private _soundClassDefined = getArray(missionconfigfile >> "CfgSounds" >> _soundName >> "sound");

	if (count _soundClassDefined < 1) exitWith {};

	_count = _i;
 };

_count
