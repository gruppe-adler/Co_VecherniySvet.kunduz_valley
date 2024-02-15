params ["_camera"];

private _duration = 11;

_camera camSetTarget objNull;
_camera camPreparePos getpos introMarker_5_2;
_camera camCommitPrepared _duration;

[_camera, [vectorDir introMarker_5_2, vectorUp introMarker_5_2], _duration, 1.5] call GRAD_INTRO_fnc_camTilt;




[{
   0 fadeSound 0.5;
   intro_butcher2 say3D "drill";
    10 fadeSound 0;
}, [], 5] call CBA_fnc_waitAndExecute;


[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_14;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;