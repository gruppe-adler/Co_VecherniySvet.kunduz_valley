params ["_camera"];

private _duration = 3;
private _startTime = diag_tickTime;

private _butterflyWindscreen = createSimpleObject ["GRAD_butterfly", [0,0,0], true];

[{
    params ["_args", "_handle"];
    _args params ["_camera", "_butterflyWindscreen", "_duration", "_startTime"];

    if (diag_tickTime > _startTime + _duration) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    // _butterflyWindscreen attachTo [grad_intro_mi24_1, [0.155234,6.53915,-0.563475]];
    _butterflyWindscreen setPosASL (grad_intro_mi24_1 modelToWorldVisualWorld [0.155234,6.53915,-0.063475]);
    _butterflyWindscreen setVectorDirAndUp [[0,0.5,0.5], [0,-0.5,0.5]];

    private _pilot = driver grad_intro_mi24_1;
    private _pilotPos = (_pilot) modelToWorld (_pilot selectionPosition "head");

    _camera camSetTarget (_butterflyWindscreen);
    _camera camCommit 0;
    _camera setPosASL (grad_intro_mi24_1 modelToWorldVisualWorld [0,9,0]);
    /*
    _camera setVectorDirAndUp [
        (vectorDir _camera) vectorFromTo (vectorDir _pilot), 
        (vectorUp _camera) vectorFromTo (vectorUp _pilot)
    ];
    */

}, 0, [_camera, _butterflyWindscreen, _duration, _startTime]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_10;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
