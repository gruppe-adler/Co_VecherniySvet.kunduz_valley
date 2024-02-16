params ["_camera"];

private _duration = 2;

/*

_camera camPreparePos (getPos intro_sheepTransport);
_camera camSetTarget intro_sheepTransport;
_camera camSetRelPos [0,10,8];
_camera camCommitPrepared 0;
*/

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_end;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;
