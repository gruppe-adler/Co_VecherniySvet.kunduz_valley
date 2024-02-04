
/*

    SCENE 6 - upwards tower to the sun

    

*/

params ["_camera"];



private _duration = 20;
["GRAD_butterfly", getPos introButterfly_3, getPos introButterfly_4, 3] call grad_intro_fnc_butterfly;
private _butterfly = ["GRAD_butterfly", getPos introButterfly_5_1, getPos introButterfly_5_2, _duration-5, _duration-5] call grad_intro_fnc_butterfly;

20 fadeSound 0.3;

_camera camPreparePos (getPos introMarker_4_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_4_1;
private _vectorUp = vectorUp introMarker_4_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _northOfButterfly = _butterfly getPos [5, 0];
_northOfButterfly set [2, getPos _butterfly select 2];
_camera camPreparePos (_northOfButterfly);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_4_2, vectorUp introMarker_4_2], _duration-1, 2] call GRAD_INTRO_fnc_camTilt;




[{
    params ["_camera", "_butterfly"];
    [_camera, _butterfly] call grad_intro_fnc_intro_7;
}, [_camera, _butterfly], _duration-1] call CBA_fnc_waitAndExecute;
