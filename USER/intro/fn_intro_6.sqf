
/*

    SCENE 6 - upwards tower to the sun

    

*/

params ["_camera"];


private _duration = 23;
private _butterfly = ["GRAD_butterfly", getPos introButterfly_3, getPos introButterfly_4, 3] call grad_intro_fnc_butterfly;
private _eagle = ["GRAD_Eagle_F", getPos introButterfly_5_1, getPos introButterfly_5_3, _duration+2] call grad_intro_fnc_butterfly;


20 fadeSound 0.3;

_camera camPreparePos (getPos introMarker_4_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_4_1;
private _vectorUp = vectorUp introMarker_4_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];
_camera camPreparePos (getPos introMarker_4_2);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_4_2, vectorUp introMarker_4_2], _duration, 2] call GRAD_INTRO_fnc_camTilt;


// needs to be *after* eagle does not get commands from butterfly anymore
/*
[{
    params ["_eagle"];
    _eagle camPreparePos (getPos introButterfly_5_3);
    _eagle camCommitPrepared 7;
}, [_eagle], _duration-6] call CBA_fnc_waitAndExecute;
*/

[{
    params ["_camera", "_eagle"];
    [_camera, _eagle] call grad_intro_fnc_intro_7;
}, [_camera, _eagle], _duration-1] call CBA_fnc_waitAndExecute;
