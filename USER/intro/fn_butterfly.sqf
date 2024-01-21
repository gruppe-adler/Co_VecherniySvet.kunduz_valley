params ["_position", "_destination", "_duration", ["_camera", objNull]];

// agents / vehicles dont really work for butterflies apparently
private _butterfly = "Butterfly_random" camCreate _position;
_butterfly setVariable ["BIS_fnc_animalBehaviour_disable", true];


private _speed = .5;
private _startTime = diag_tickTime;
private _distance = _butterfly distance _destination;
private _step = _distance/_duration * _speed;
private _path = [];

for "_i" from 1 to _duration do
{
    
    private _positionPath = (_position getPos [_step*_i, _butterfly getDir _destination]);
    _positionPath set [2, 1.5];
    _path pushback _positionPath;

    // systemchat str _position;

};



grad_intro_debugCamera = {
    params ["_butterfly", "_startTime", "_camera", "_duration"];

    [{
        params ["_args", "_handle"];
        _args params ["_butterfly", "_startTime", "_camera", "_duration"];

        if (diag_tickTime > _startTime + _duration) exitWith {
             [_handle] call CBA_fnc_removePerFrameHandler;
        };
        
        private _vectorDir = vectorDir _butterfly;
        private _vectorUp = vectorUp _butterfly;
        private _newVector = [_vectorDir, _vectorUp];
        [_camera, _newVector, 1, 0] call GRAD_INTRO_fnc_camTilt;
        _camera camSetPos (getPos _butterfly);
        _camera camCommit 1;

    }, 1, [_butterfly, _startTime, _camera, _duration]] call CBA_fnc_addPerFrameHandler;
};

if (isNull _camera) then {
    _camera = "camera" camCreate [0, 0, 3];
    _camera cameraEffect ["internal","back"];
    _camera camCommand "inertia on";
    _camera camSetFOV 0.55; // 0.25
    _camera camCommitPrepared 0;
};

private _startTime = diag_tickTime;
[_butterfly, _startTime, _camera, _duration] call grad_intro_debugCamera;


grad_intro_butterflyScatterPos = {
    params ["_position"];
    _position params ["_posX", "_posY", "_posZ"];

    private _randomX = random [-2,0,2];
    private _randomY = random [-2,0,2];
    private _randomZ = random [-2,0,2];

    // systemchat (str _randomX + " " + str _randomY + " " + str _randomZ);

    private _posX = _randomX + _position#0;
    private _posY = _randomY + _position#1;
    private _posZ = _randomZ + _position#2;

    [_posX, _posY, _posZ]
};

player setVariable ["grad_butterfly_path_index", 0]; // reset for testing

[{
    params ["_args", "_handle"];
    _args params ["_butterfly", "_path", "_destination", "_duration", "_startTime"];

    if (diag_tickTime > _startTime + _duration) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _index = player getVariable ["grad_butterfly_path_index", 0];

    if (_index > count _path) exitWith { systemchat "too long array"; [_handle] call CBA_fnc_removePerFrameHandler; };
    private _position = (_path select _index);
    private _scatteredPosition = [_position] call grad_intro_butterflyScatterPos;
    _butterfly camSetPos _scatteredPosition;
    _butterfly camCommit 1;

    // _butterfly switchMove (selectRandom ["Open", "Fly"]);

    _index = _index + 1;
    player setVariable ["grad_butterfly_path_index", _index];

     private _markerstr = createMarkerLocal [format ["marker%1%2", _scatteredPosition#0, _scatteredPosition#1], [_scatteredPosition#0, _scatteredPosition#1]];
    _markerstr setMarkerShapeLocal "ICON";
    _markerstr setMarkerTypeLocal "mil_dot";
    _markerstr setMarkerColorLocal "ColorRed";

}, 1, [_butterfly, _path, _destination, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;
