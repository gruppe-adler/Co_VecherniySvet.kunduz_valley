params ["_camera"];

private _duration = 20;

_camera camPreparePos (getPos introMarker_5_1);
_camera camCommitPrepared 0;
_camera setVectorDirAndUp [vectorDir introMarker_5_1, vectorUp introMarker_5_1];

_camera camPreparePos (getPos introMarker_5_2);
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_5_2, vectorUp introMarker_5_2], _duration, 1.5] call GRAD_INTRO_fnc_camTilt;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_99;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;