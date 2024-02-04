/*

    SCENE 8 - tilt on flyby

    

*/

params ["_camera"];

private _duration = 1;

private _vectorDir = vectorDir introMarker_4_3;
private _vectorUp = vectorUp introMarker_4_3;
// [_camera, 0.01, 2] spawn grad_intro_fnc_camShake; // does not work
_camera camPreparePos (getPos introMarker_4_3);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [_vectorDir, _vectorUp], _duration, 1] call GRAD_INTRO_fnc_camTilt;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_9;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;