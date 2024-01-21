params ["_position", "_destination", "_duration"];

// agents / vehicles dont really work for butterflies apparently
private _butterfly = "Butterfly_random" camCreate (position player);
_butterfly setVariable ["BIS_fnc_animalBehaviour_disable", true];

private _startTime = diag_tickTime;

grad_intro_butterflyScatterPos = {
    params ["_position"];
    _position params ["_posX", "_posY", "_posZ"];
    private _randomX = random [-.5,0,.5];
    private _randomY = random [-.5,0,.5];
    private _randomZ = random [-.5,0,.5];

    return [_randomX, _randomY, _randomZ]
};

[{
    params ["_args", "_handle"];
    _args params ["_butterfly", "_destination", "_duration", "_startTime"];

    if (diag_tickTime > _startTime + _duration) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _distance = _butterfly distance _destination;
    // private _step = _distance

    _butterfly camSetPos ()
    _butterfly camCommit 1;
    

}, 1, [_butterfly, _destination, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;

