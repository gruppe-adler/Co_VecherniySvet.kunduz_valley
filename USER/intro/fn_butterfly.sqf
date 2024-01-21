params ["_position", "_destination"];

// agents are discouraged for butterflys, acc to https://forums.bohemia.net/forums/topic/204568-solvedhow-to-create-butterflies-bees-dragonflies/ 
private _butterfly = createVehicle ["ButterFly_random", _position, [], 0, "NONE"];
_butterfly setVariable ["BIS_fnc_animalBehaviour_disable", true];
_butterfly setdir (random 360);

_butterfly moveTo _destination;