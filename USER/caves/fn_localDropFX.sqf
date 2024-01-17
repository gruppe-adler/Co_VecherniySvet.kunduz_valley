params ["_rock"];

private _source01 = "#particlesource" createVehicleLocal (position _rock);
_source01 setParticleClass "BombDust";
_source01 attachTo [_rock, [0,0,0]];

private _source02 = "#particlesource" createVehicleLocal (position _rock);
_source02 setParticleClass "MineCircleDust";
_source02 attachTo [_rock, [0,0,0]];

_rock say3D "rocksFalling_4";

[{
    params ["_source01", "_source02"];

    deleteVehicle _source01;
    deleteVehicle _source02;
    
}, [_source01, _source02], 2] call CBA_fnc_waitAndExecute;

