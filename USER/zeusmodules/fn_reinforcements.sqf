params ["_type", "_cloaked", "_position"];


private _vehicleClassname = [_type, _cloaked] call GRAD_zeusmodules_fnc_getReinforcementVehicle;


private _vehicle = createVehicle [_vehicleClassname, _position, [], 20, "NONE"];
private _dir = _position getDir [worldSize/2, worldsize/2];

_vehicle setDir _dir;


private _units = [_type] call GRAD_zeusmodules_fnc_getReinforcementUnits;

private _group = createGroup east;

{
    private _unit = _group createUnit [_x, [0,0,0], [], 0, "NONE"];
    _unit moveInAny _vehicle;
} forEach _units;
