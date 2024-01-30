params ["_camera"];

private _duration = 5;
private _startTime = diag_tickTime;

private _mi24 = grad_intro_mi24_1;
// systemChat str (isNull _mi24);

private _butterflyWindscreen = createSimpleObject ["GRAD_butterfly", getPosASL _mi24, true];

[{
    params ["_args", "_handle"];
    _args params ["_camera", "_mi24", "_butterflyWindscreen", "_duration", "_startTime"];

    if (diag_tickTime > _startTime + _duration) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _butterflyWindscreen setPosASL (_mi24 modelToWorldVisualWorld [0.597656,7.99014,-1.55084]);
    _butterflyWindscreen setVectorDirAndUp [vectorDir _mi24, vectorUp _mi24];

    _camera camSetTarget (getPosVisual driver _mi24);
    _camera camSetRelPos [0,4,0];
    _camera camCommit 0;


}, 0, [_camera, _mi24, _butterflyWindscreen, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_9;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
