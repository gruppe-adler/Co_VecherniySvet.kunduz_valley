
/*

    SCENE 4 - tractor + butterflies

    0:54 - Then I see a land
	0:58 - Where children can run free
	1:06

*/

params ["_camera"];

_camera camPreparePos (getPos introMarker_3_1);
_camera camCommitPrepared 0;
// _camera camSetFOV 0.75;
private _vectorDir = vectorDir introMarker_3_1;
private _vectorUp = vectorUp introMarker_3_1;
_camera setVectorDirAndUp [_vectorDir, _vectorUp];

private _duration = 17;
_camera camPreparePos (getPos introMarker_3_2);
// _camera camPrepareTarget (intro_tractor);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_3_2, vectorUp introMarker_3_2], _duration-1, 5] call GRAD_INTRO_fnc_camTilt;

["GRAD_butterfly", getpos introButterfly_1, getPos introButterfly_2, 17] call grad_intro_fnc_butterfly;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_5;
}, [_camera], _duration-1] call CBA_fnc_waitAndExecute;
