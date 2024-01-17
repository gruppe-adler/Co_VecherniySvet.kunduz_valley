params ["_car"];

if (!local _car) exitWith {};

private _position = position _car;
_car setDamage [1, false];
private _explosion = createVehicle ["ammo_ShipCannon_120mm_HE", _position, [], 0, "CAN_COLLIDE"];
_explosion setDamage 1;
_explosion setVelocity [0,0,-100];

private _explosion2 = createVehicle ["Bo_Mk82", _position, [], 0, "CAN_COLLIDE"];
_explosion2 setDamage 1;
_explosion2 setVelocity [0,0,-100];

_position set [2,3];

[_position] remoteExecCall ["grad_ambient_fnc_suicideCarShockwave", 0];

// [_car, "shards_burning", true] remoteExecCall ["grad_ambient_fnc_createSmoke", 0];

// spawn clutter for lolz
for "_i" from 1 to 4 do {
    private _tyre = createVehicle ["Land_Tyre_F", _position, [], 0, "CAN_COLLIDE"];
    _tyre setVelocity [-5 + random 10, -5 + random 10, 10];
};

 private _skeleton = createVehicle ["Land_HumanSkeleton_F", _position, [], 0, "CAN_COLLIDE"];
_skeleton setVelocity [-5 + random 10, -5 + random 10, 10];  


{
   detach _x;
   deleteVehicle _x;
} forEach (attachedObjects _car);


for "_i" from 1 to 4 do {
    private _helper = createVehicle ["Land_Can_Dented_F", _position, [], 0, "CAN_COLLIDE"];
    private _object = createVehicle ["MetalBarrel_burning_F", _position, [], 0, "CAN_COLLIDE"];
    _object attachTo [_helper];
    _helper setVelocity [-5 + random 10, -5 + random 10, 10];
};

for "_i" from 1 to 2 do {
    private _helper = createVehicle ["Land_Can_Dented_F", _position, [], 0, "CAN_COLLIDE"];
    private _object = createVehicle ["gm_pallet_01", _position, [], 0, "CAN_COLLIDE"];
    _object attachTo [_helper];
    _helper setVelocity [-5 + random 10, -5 + random 10, 10];
};

// "ammo_ShipCannon_120mm_HE", AT_Mine_155mm_AMOS_range, "Bo_Mk82", "gm_plastic_explosive_remote_base", gm_shell_105x617mm_HE_base , "R_230mm_HE", RHS_9N24, "Sh_125mm_HE", UWMine_155mm_AMOS_range