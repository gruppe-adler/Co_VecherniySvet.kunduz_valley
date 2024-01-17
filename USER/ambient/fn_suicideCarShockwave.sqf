params ["_centerPos"];

_centerPos set [2, 2];

for "_i" from 1 to 360 do {
    private _vector = _centerPos vectorFromTo (_centerPos getPos [1, _i]);
    _vector = _vector vectorMultiply 150;
    _vector set [2,10];
    private _source01 = "#particlesource" createVehicleLocal _centerPos;
  

    _source01 setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 0.5, 3, 
        [0,0,1], _vector, 0, 1, 0.2, 0, [1,20], [[1,1,1,1],[0,0,0,0]], 
        [0.08], 1, 0, "", "", _this,0,false,0, [[1,1,1,0]],
        _vector
    ];   
    _source01 setDropInterval 1;

    [{ params ["_source"]; deleteVehicle _source; }, [_source01], 0.2] call CBA_fnc_waitAndExecute;
};