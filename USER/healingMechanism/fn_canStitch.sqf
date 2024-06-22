#include "\z\ace\addons\medical_ai\script_component.hpp"

params ["_patient", "_bodyPart"];

private _isBleeding = false;
{
    _x params ["", "_amountOf", "_bleedingRate"];
    _isBleeding = _amountOf > 0 && {_bleedingRate > 0};
    if (_isBleeding) then {break};
} forEach (GET_OPEN_WOUNDS(_patient) get _bodyPart);

(!_isBleeding && {(GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []]) isNotEqualTo []}) // return