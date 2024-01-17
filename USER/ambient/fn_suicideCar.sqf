params ["_position"];

_position set [2,0];

private _type = "UK3CB_MEI_O_Hilux_Open";
private _car = _type createVehicle [0,0,0];
private _driver = (createGroup east) createUnit ["UK3CB_TKM_O_ENG", [0,0,0], [], 0, "NONE"];
_driver moveInDriver _car;

_car setPos _position;

[_car] call grad_ambient_fnc_suicideCarInit;

_car setPilotLight false;

_car setVehicleLock "LOCKED";
_car allowCrewInImmobile true;
_driver setBehaviour "CARELESS";
_driver disableAI "AUTOCOMBAT";
_driver disableAI "MINEDETECTION";
_driver disableAI "TARGET";
_driver disableAI "SUPPRESSION";
_driver setVariable ["lambs_danger_disableAI", true, true];

_driver setVariable ["assignedCar", _car, true];

{
    if (typeOf _x == "MetalBarrel_burning_F") then {
        _x inflame true;
    };
} forEach attachedObjects _car;


_car addEventHandler ["Hit", {
    params ["_unit", "_source", "_damage", "_instigator"];

    private _count = _unit getVariable ["ML_hitCount", 0];
    _unit setVariable ["ML_hitCount", _count + 1, true];

    if (_count > 15 || !canMove _unit) then {
        _unit setVariable ["killedByHit", true, true];
        [_unit] call grad_ambient_fnc_suicideCarExplode;
    };
}];


_car addEventHandler ["Deleted", {
  params ["_entity"];
  {
       detach _x;
       deleteVehicle _x;
    } forEach (attachedObjects _entity);
}];


_driver addMPEventHandler ["MPKilled", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    private _car = _unit getVariable ["assignedCar", objNull];
    private _killedByHit = _car getVariable ["killedByHit", false];

    if (!_killedByHit) then {
        [_car] call grad_ambient_fnc_suicideCarExplode;
    };
}];