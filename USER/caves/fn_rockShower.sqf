/*
    
    [fallingRock1, 3, 2] execVM "USER\caves\rockshower.sqf";

*/


params ["_pos", ["_obj", objNull], ["_lifetime", 10], ["_showerTime", 2], ["_camShake", [0,0,0]], ["_dropInterval", 0.04], "_arrayOfRocks"];


private _PS = "#particlesource" createVehicleLocal _pos;
_PS setPos _pos;
// _PS setParticleCircle [1, [0, 0, 0]];
_PS setParticleRandom [
    /*0*/ 0,
    /*1*/ [2, 2, 0],
    /*2*/ [0.25, 0.25, 0],
    /*3*/ 0,
    /*4*/ 1,
    /*5*/ [0, 0, 0, 0],
    /*6*/ 0,
    /*7*/ 0
];
_PS setParticleParams [
    /*0*/  ["\A3\Rocks_F_Exp\Cliff\Cliff_wall_round_F.p3d", 8, 3, 1],
    /*1*/  "",
    /*2*/  "SpaceObject",
    /*3*/  1,
    /*4*/  _lifetime,
    /*5*/  [0, 0, 0],
    /*6*/  [0, 0, -2],
    /*7*/  1,
    /*8*/  10,
    /*9*/  1,
    /*10*/ 0.2,
    /*11*/ [0.006, 0.006],
    /*12*/ [[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]],
    /*13*/ [0, 1],
    /*14*/ 1, 
    /*15*/ 0,
    /*16*/ "",
    /*17*/ "",
    /*18*/ _obj,
    /*19*/ 0,
    /*20*/ true,
    /*21*/ 0.1
];
_PS setDropInterval _dropInterval;

private _particleArray = [];
{
    private _position = getPos _x;
  private _thisSource = "#particlesource" createVehicleLocal _position;
_thisSource setPos _position;
// _thisSource setParticleCircle [1, [0, 0, 0]];
_thisSource setParticleRandom [
    /*0*/ 0,
    /*1*/ [2, 2, 0],
    /*2*/ [0.25, 0.25, 0],
    /*3*/ 0,
    /*4*/ 1,
    /*5*/ [0, 0, 0, 0],
    /*6*/ 0,
    /*7*/ 0
];
_thisSource setParticleParams [
    /*0*/  ["\A3\Rocks_F_Exp\Cliff\Cliff_wall_round_F.p3d", 8, 3, 1],
    /*1*/  "",
    /*2*/  "SpaceObject",
    /*3*/  1,
    /*4*/  _lifetime,
    /*5*/  [0, 0, 0],
    /*6*/  [0, 0, -2],
    /*7*/  1,
    /*8*/  10,
    /*9*/  1,
    /*10*/ 0.2,
    /*11*/ [0.002, 0.002],
    /*12*/ [[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]],
    /*13*/ [0, 1],
    /*14*/ 1, 
    /*15*/ 0,
    /*16*/ "",
    /*17*/ "",
    /*18*/ _x,
    /*19*/ 0,
    /*20*/ true,
    /*21*/ 0.1
];
_thisSource setDropInterval _dropInterval;

_particleArray pushBackUnique _thisSource;
} forEach _arrayOfRocks;

if (_camShake isNotEqualTo [0,0,0]) then {
    enableCamShake true;
    addCamShake _camShake;
};

[
    {
        params ["_source", "_particleArray"];
        deleteVehicle _source;

        { deleteVehicle _x; } forEach _particleArray
    },
    [_PS, _particleArray],
    _showerTime
] call CBA_fnc_waitAndExecute;

if (player distance _pos < 50) then {
    [2] spawn BIS_fnc_earthquake;

    player say3D "rocksFalling_4";
};