params ["_position"];

private _source01 = "#particlesource" createVehicleLocal _position;
_source01 setParticleClass "BombDust";
_source01 attachTo [_source01, [0,0,0]];

private _source02 = "#particlesource" createVehicleLocal _position;
_source02 setParticleClass "MineCircleDust";
_source02 attachTo [_source02, [0,0,0]];


private _source03 = "#particlesource" createVehicleLocal _position;
_source03 setPos _position;
// _source03 setParticleCircle [1, [0, 0, 0]];
_source03 setParticleRandom [
    /*0*/ 0,
    /*1*/ [2, 2, 0],
    /*2*/ [5, 5, 5],
    /*3*/ 0,
    /*4*/ 1,
    /*5*/ [0, 0, 0, 0],
    /*6*/ 0,
    /*7*/ 0
];
_source03 setParticleParams [
    /*0*/  ["\A3\Rocks_F_Exp\Cliff\Cliff_wall_round_F.p3d", 8, 3, 1],
    /*1*/  "",
    /*2*/  "SpaceObject",
    /*3*/  1,
    /*4*/  1.5,
    /*5*/  [0, 0, 0],
    /*6*/  [0, 0, 0],
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
    /*18*/ _source03,
    /*19*/ 0,
    /*20*/ true,
    /*21*/ 0.1
];
_source03 setDropInterval 0.04;

[
    {
        params ["_source01", "_source02", "_source03"];
        deleteVehicle _source01;
        deleteVehicle _source02;
        deleteVehicle _source03;
    },
    [_source01, _source02, _source03],
    2
] call CBA_fnc_waitAndExecute;