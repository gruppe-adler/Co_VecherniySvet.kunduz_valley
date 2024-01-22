
/*

    SCENE 5 - arrival tractor

    1:12 - And walk this land with me
	1:18 - And walk this lovely land with me

*/

params ["_camera"];

_camera camPreparePos (getPos introMarker_3_3);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_3_3;
private _vectorUp = vectorUp introMarker_3_3;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 20;
_camera camPreparePos (getPos introMarker_3_4);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_3_4, vectorUp introMarker_3_4], _duration-1] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_6;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;


