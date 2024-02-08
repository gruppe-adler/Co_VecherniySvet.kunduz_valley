
/*

    SCENE 6 - upwards tower to the sun

    

*/

params ["_camera"];


private _duration = 20;
private _butterfly = "GRAD_butterfly" camCreate (getPos introButterfly_3); // ["GRAD_butterfly", getPos introButterfly_3, getPos introButterfly_4, 3] call grad_intro_fnc_butterfly;
private _eagle = ["GRAD_Eagle_F", getPos introButterfly_5_1, getPos introButterfly_5_2, _duration-5, _duration-5] call grad_intro_fnc_butterfly;

intro_animation_curve_1 synchronizeObjectsAdd [_butterfly];
[intro_animation_timeline_1] call BIS_fnc_timeline_play;


20 fadeSound 0.3;

_camera camPreparePos (getPos introMarker_4_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_4_1;
private _vectorUp = vectorUp introMarker_4_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _northOf_eagle = _eagle getPos [5, 0];
_northOf_eagle set [2, getPos _eagle select 2];
_camera camPreparePos (_northOf_eagle);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_4_2, vectorUp introMarker_4_2], _duration-1, 2] call GRAD_INTRO_fnc_camTilt;




[{
    params ["_camera", "_eagle"];
    [_camera, _eagle] call grad_intro_fnc_intro_7;
}, [_camera, _eagle], _duration-1] call CBA_fnc_waitAndExecute;
