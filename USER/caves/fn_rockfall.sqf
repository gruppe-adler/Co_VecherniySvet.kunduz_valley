/*

    [fallingRock1] execVM "USER\caves\rockfall.sqf";

*/


private _rocks = [
    fallingRock1,
    fallingRock2,
    fallingRock3
];


private _firstRock = _rocks#0;

private _arrayOfSpawns = [
    debris0,
    debris1,
    debris2,
    debris3,
    debris4,
    debris5,
    debris6
];

[getPos _firstRock, _firstRock, 7, 7, [0,0,0], 0.03, _arrayOfSpawns] remoteExec ["GRAD_caves_fnc_rockshower", 0];

_firstRock setVariable ["EL_rockDropped", true, true];

[{

    params ["_firstRock", "_rocks"];

    {

        private _rock = _x;
        private _vecDir = vectorDir _rock;
        private _vecUp = vectorUp _rock;
        private _pos = getPosASL _rock;

        private _pen = "Land_PencilRed_F" createVehicle [0,0,0];
        // hideObject _pen;
        _pen setPosASL [_pos#0, _pos#1, (_pos#2) - 1];
        _rock attachTo [_pen, [0,0,_forEachIndex]];

    } forEach _rocks;

}, [_firstRock, _rocks], 5] call CBA_fnc_waitAndExecute;



/*
[
    {
        params ["_rock", "_pen"];
        private _height = (getPosASL _rock) # 2;
        _height < 290.187
    },
    {
        params ["_rock", "_pen"];
    },
    [_localRock, _pen]
] call CBA_fnc_waitUntilAndExecute;
*/