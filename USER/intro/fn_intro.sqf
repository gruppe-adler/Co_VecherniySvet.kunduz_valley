params ["_duration"];

if (didJIP) exitWith {
    "introBlackLoading" cutText ["", "BLACK IN", 5];
};
diwako_dui_main_toggled_off = true;
0 fadeSound 1; 

private _music = playSound ["The_Exodus_Song", 2];


showCinemaBorder true;

private _camera = "camera" camCreate [0, 0, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera camPreparePos [8168.87,5484.04,2];
_camera camSetTarget convoy_lastcar;
_camera camSetTarget objNull;
_camera camSetFOV 0.25;
_camera camCommitPrepared 0;
private _vectorDir = vectorDir _camera;
_camera setVectorDirAndUp [_vectorDir, [1,0,0]];

_camera camPreparePos [8168.87,5484.04,4];
private _newVector = [_vectorDir,[0,0,1]];
private _time = 20;
_camera camCommitPrepared _time;
[_camera, _newVector, _time] spawn {
    params ["_cam","_newVector","_commitTime"];
    private _oldVectorDir = vectorDir _cam;
    private _oldVectorUp =  vectorUp _cam;
    _newVector params ["_newVectorDir","_newVectorUp"];
    private _oldTime = diag_tickTime;
	systemchat str (camCommitted _cam);
    while {!(camCommitted _cam)} do {
		systemchat ("rotating cam..");
        private _progress = (diag_tickTime - _oldTime) / _commitTime;
        _cam setVectorDir vectorLinearConversion [0, 1, _progress, _oldVectorDir, _newVectorDir];
        _cam setVectorUp vectorLinearConversion [0, 1, _progress, _oldVectorUp, _newVectorUp];
    };
};

private _ppGrain = ppEffectCreate ["filmGrain", 2005];
_ppGrain ppEffectAdjust [
	0.025,
	1.25,
	2.01,
	0.75,
	1.0,
	0
];

private _ppBW = ppEffectCreate ["ColorCorrections", 2005];
_ppBW ppEffectAdjust
[
	1,
	2,
	0,
	[0, 0, 0, 0],
	[1, 1, 1, 0],
	[0.299, 0.587, 0.114, 0],
	[-1, -1, 0, 0, 0, 0, 0]
];





[{
    params ["_camera"];
    [_camera] execvm "user\intro\fn_camshake.sqf";
}, [_camera], 15] call CBA_fnc_waitandexecute;

/*
private _splitscreen = "camera" camCreate (player modelToWorld [0,-5,2]);
_splitscreen cameraEffect ["internal", "back", "rtt"];
"rtt" setPiPEffect [0];
with uiNamespace do {
	private _pic = findDisplay 46 ctrlCreate ["RscPicture", -1];
	_pic ctrlSetPosition [safezoneX+(safezoneW/2),safezoneY,safeZoneW/2,safeZoneH];
	_pic ctrlCommit 0;
	_pic ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";

    [{
    params ["_pic"];

    ctrlDelete _pic;
    
    }, [_pic], _duration] call CBA_fnc_waitAndeXecute;
};
*/


[{
    "introBlackLoading" cutText ["", "BLACK IN", 5];
}, [], 5] call CBA_fnc_waitAndeXecute;


[{
    "introBlackLoading" cutText ["", "BLACK OUT", 5];
}, [], _duration-6] call CBA_fnc_waitAndeXecute;


[{
    params ["_camera"];

    _camera cameraEffect ["terminate","back"];
    camDestroy _camera;
    showCinemaBorder false;
    5 fadeSound 1;
     "introBlackLoading" cutText ["", "BLACK IN", 5];
     diwako_dui_main_toggled_off = false;

     20 fadeMusic 0;
    
}, [_camera], _duration] call CBA_fnc_waitAndeXecute;

