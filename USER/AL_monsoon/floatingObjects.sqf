params ["_type", "_posx", "_posy"];

grad_debris = true;

private _debris = _type createVehicleLocal [_posX, _posY, 0];
_debris enableSimulation false;
_debris setPos [_posX, _posY, 0]; // necessary
_debris setDir (random 360);

[{
    params ["_args", "_handle"];
    _args params ["_debris", "_posX", "_posY"];

    if (!grad_debris) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteVehicle _debris;
    };

    // slowly rotate to give at least some visual eye candy
    _debris setPos [_posX, _posY, 0];
    _debris setDir ((getDir _debris) + 0.05);
}, 0.01, [_debris, _posX, _posY]] call CBA_fnc_addPerFrameHandler;
