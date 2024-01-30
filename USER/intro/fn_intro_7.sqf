params ["_camera", "_butterfly"];

private _duration = 10;
private _northOfButterfly = _butterfly getPos [5, 0];
_northOfButterfly set [2, getPos _butterfly select 2];
_camera camPreparePos (_northOfButterfly);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, _butterfly, _duration-1, 2] call GRAD_INTRO_fnc_camTiltDynamic;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_8;
}, [_camera], _duration - 0.5] call CBA_fnc_waitAndExecute;
