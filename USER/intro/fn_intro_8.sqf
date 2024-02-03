params ["_camera"];

private _duration = 7;
private _startTime = diag_tickTime;

private _butterflyWindscreen = createSimpleObject ["GRAD_butterfly", [0,0,0], true];

[{
    params ["_args", "_handle"];
    _args params ["_camera", "_butterflyWindscreen", "_duration", "_startTime"];

    if (diag_tickTime > _startTime + _duration) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _butterflyWindscreen setPosASL (grad_intro_mi24_1 modelToWorldVisualWorld [0.597656,7.99014,-1.55084]);
    _butterflyWindscreen setVectorDirAndUp [vectorDir grad_intro_mi24_1, vectorUp grad_intro_mi24_1];

    private _actualPos = (visiblePositionASL grad_intro_mi24_1);
    private _actualPosAGL = ASLToAGL _actualPos;
    private _relPos = (_actualPosAGL) getPos [6, getDir grad_intro_mi24_1];
    _relPos set [2, _actualPosAGL#2];

    _camera camSetPos _relPos;
    _camera camSetTarget _actualPosAGL;
    _camera camCommit 0;


}, 0, [_camera, _butterflyWindscreen, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_9;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
