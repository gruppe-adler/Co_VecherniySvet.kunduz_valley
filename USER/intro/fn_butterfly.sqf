params [["_type", "GRAD_butterfly"], "_position", "_destination", "_duration", ["_killSwitchDuration", 9999999]];

diag_log format ["startpos %1 - destination %2", _position, _destination];

// agents / vehicles dont really work for butterflies apparently
private _butterfly = _type camCreate _position;

private _vectorToDestination = vectorNormalized (_position vectorFromTo _destination);
_butterfly setVectorDir _vectorToDestination;

private _startTime = diag_tickTime;
private _path = [];

for "_i" from 1 to _duration do
{
    private _node = (_i/_duration) bezierInterpolation [_position, _destination];
    _path pushback _node;
};

diag_log format ["_path %1", _path];

[{
    params ["_args", "_handle"];
    _args params ["_butterfly", "_path", "_destination", "_duration", "_startTime", "_killSwitchDuration"];

    private _varAlias = "grad_butterfly_path_index" + str(_handle);

    if (diag_tickTime > _startTime + _killSwitchDuration) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (diag_tickTime > _startTime + _duration) exitWith {
        player setVariable [_varAlias, 0];
        // [_handle] call CBA_fnc_removePerFrameHandler;
        _butterfly camSetPos (_path select ((count _path) - 1));
        _butterfly camCommit 1;
    };

  
    private _index = player getVariable [_varAlias, 0];

    private _position = (_path select _index);
    _position set [0, _position#0 + random 0.2];
    _position set [1, _position#1 + random 0.2];
    _position set [2, _position#2 + random 0.2];
    _butterfly camSetPos _position;
    _butterfly camCommit 1;

    diag_log format ["_position %1, _index %2", _position, _index];

    // private _debug = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
    // _debug setPos getPos _butterfly;

    if (_index < (count _path - 1)) then {
        _index = _index + 1;
    };

    player setVariable [_varAlias, _index];

}, 1, [_butterfly, _path, _destination, _duration, _startTime, _killSwitchDuration]] call CBA_fnc_addPerFrameHandler;

_butterfly