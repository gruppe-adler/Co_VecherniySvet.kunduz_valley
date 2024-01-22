params ["_position", "_destination", "_duration", ["_camera", objNull]];

// agents / vehicles dont really work for butterflies apparently
private _butterfly = "Butterfly_random" camCreate _position;
_butterfly setVariable ["BIS_fnc_animalBehaviour_disable", true];

grad_debugMarker = "Sign_Arrow_Blue_F" createVehicle _position;

private _speed = .5;
private _startTime = diag_tickTime;
private _distance = _butterfly distance _destination;
private _flyDir = _butterfly getDir _destination;
private _step = _distance/_duration * _speed;
private _path = [];

for "_i" from 1 to _duration do
{
    
    private _positionPath = (_position getPos [_step*_i, _butterfly getDir _destination]);
    _positionPath set [2, 1.5];
    _path pushback _positionPath;

    // systemchat str _position;

};


/*
grad_intro_debugCamera = {
    params ["_butterfly", "_startTime", "_camera", "_duration"];

    [{
        params ["_args", "_handle"];
        _args params ["_butterfly", "_startTime", "_camera", "_duration"];

        if (diag_tickTime > _startTime + _duration) exitWith {
             [_handle] call CBA_fnc_removePerFrameHandler;
        };
        
        _camera camSetRelPos [0, -1, 1];
        _camera camCommit 0;
        

    }, 0, [_butterfly, _startTime, _camera, _duration]] call CBA_fnc_addPerFrameHandler;
};

if (isNull _camera) then {
    _camera = "camera" camCreate [0, 0, 3];
    _camera cameraEffect ["internal","back"];
    _camera camCommand "inertia on";
    _camera camSetFOV 0.55; // 0.25
    _camera camSetTarget _butterfly;
    _camera camSetRelPos [0, -1, 1];
    _camera camCommitPrepared 0;
    
};


private _startTime = diag_tickTime;
[_butterfly, _startTime, _camera, _duration] call grad_intro_debugCamera;
*/

grad_intro_butterflyScatterPos = {
    params ["_flyDir", "_position"];
    _position params ["_posX", "_posY", "_posZ"];

    private _random = random .1;
    private _randomZ = random [-0.2, 0, 0.2];

    private _nextRandom = _position getPos [_random, _flyDir + random [-30, 0, 30]];
    _nextRandom set [2, _posZ + _randomZ];

    _nextRandom
};

// player setVariable ["grad_butterfly_path_index", 0]; // reset for testing

[{
    params ["_args", "_handle"];
    _args params ["_butterfly", "_flyDir", "_path", "_destination", "_duration", "_startTime"];

    if (diag_tickTime > _startTime + _duration) exitWith {
        player setVariable ["grad_butterfly_path_index" + str(_handle), 0];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _index = player getVariable ["grad_butterfly_path_index" + str(_handle), 0];

    if (_index > (count _path - 1)) exitWith {
        systemchat "too long array";
        player setVariable ["grad_butterfly_path_index" + str(_handle), 0];
        [_handle] call CBA_fnc_removePerFrameHandler;        
    };
    private _position = (_path select _index);
    private _scatteredPosition = [_flyDir, _position] call grad_intro_butterflyScatterPos;
    _butterfly camSetPos _scatteredPosition;
    _butterfly camCommit 1;

    // grad_debugMarker setPos _scatteredPosition;

    // _butterfly switchMove (selectRandom ["Open", "Fly"]);

    _index = _index + 1;
    player setVariable ["grad_butterfly_path_index" + str(_handle), _index];

    /*
    private _markerstr = createMarkerLocal [format ["marker%1%2", _scatteredPosition#0, _scatteredPosition#1], [_scatteredPosition#0, _scatteredPosition#1]];
    _markerstr setMarkerShapeLocal "ICON";
    _markerstr setMarkerTypeLocal "mil_dot";
    _markerstr setMarkerColorLocal "ColorRed";
    */

}, 1, [_butterfly, _flyDir, _path, _destination, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;
