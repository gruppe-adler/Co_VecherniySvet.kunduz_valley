#include "\z\ace\addons\medical_ai\script_component.hpp"

params ["_patient"];

private _totalIvVolume = 0; //in ml1
{
	_x params ["_volumeRemaining"];
	_totalIvVolume = _totalIvVolume + _volumeRemaining;
} forEach (_patient getVariable [QEGVAR(medical,ivBags), []]);


GET_BLOOD_VOLUME(_patient) + (_totalIvVolume / 1000) > MINIMUM_BLOOD_FOR_STABLE_VITALS
