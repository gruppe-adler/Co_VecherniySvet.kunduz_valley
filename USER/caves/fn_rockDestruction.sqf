private _rocks = [
    fallingRock1,
    fallingRock2,
    fallingRock3
];


[getPos fallingRock1] remoteExec ["GRAD_caves_fnc_localDestructFX", 0];

[{

    params ["_rocks"];
    
    {
     deleteVehicle _x;
    } forEach _rocks;

}, [_rocks], 1] call CBA_fnc_waitAndExecute;