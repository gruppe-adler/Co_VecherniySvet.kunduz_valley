params ["_position", "_destination", "_duration", ["_camera", objNull]];

diag_log format ["startpos %1 - destination %2", _position, _destination];

// agents / vehicles dont really work for butterflies apparently
private _butterfly = "Butterfly_random" camCreate _position;

private _speed = .5;
private _startTime = diag_tickTime;
private _path = [];

for "_i" from 1 to _duration do
{
    
    private _positionPath = (_i/_duration) bezierInterpolation [_position, _destination];
    _path pushback _positionPath;
};


grad_intro_butterflyScatterPos = {
    params ["_flyDir", "_position"];
    _position params ["_posX", "_posY", "_posZ"];

    private _random = random .1;
    private _randomZ = random [-0.2, 0, 0.2];

    private _nextRandom = _position getPos [_random, _flyDir + random [-30, 0, 30]];
    _nextRandom set [2, _posZ + _randomZ];

    _nextRandom
};


[{
    params ["_args", "_handle"];
    _args params ["_butterfly", "_path", "_destination", "_duration", "_startTime"];

    private _varAlias = "grad_butterfly_path_index" + str(_handle);


    if (diag_tickTime > _startTime + _duration) exitWith {
        player setVariable [_varAlias, 0];
        // [_handle] call CBA_fnc_removePerFrameHandler;
        _butterfly camSetPos (_path select ((count _path) - 1));
        _butterfly camCommit 1;
    };

    private _index = player getVariable [_varAlias, 0];

    private _position = (_path select _index);
    _butterfly camSetPos _position;
    _butterfly camCommit 1;

    private _debug = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
    _debug setPos getPos _butterfly;

    if (_index < (count _path - 1)) then {
        _index = _index + 1;
    };

    player setVariable [_varAlias, _index];

}, 1, [_butterfly, _path, _destination, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;
