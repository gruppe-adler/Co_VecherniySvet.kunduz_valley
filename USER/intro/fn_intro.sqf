params ["_heli", "_duration"];

if (isNull _heli || didJIP) exitWith {
    "introBlackLoading" cutText ["", "BLACK IN", 5];
};
diwako_dui_main_toggled_off = true;
0 fadeSound 0; 

playMusic "Track_P_15";


showCinemaBorder true;

private _camera = "camera" camCreate [0, 0, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera attachTo [vehicle player, [0,50,5]];
_camera camSetTarget convoy_lastcar;
_camera camSetFOV 0.25;
_camera camCommit 0;

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


_camera camsetPos [8673.23,4777.76,0];
_camera camCommit _duration;

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

