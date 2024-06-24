
params ["_camera"];
private _duration = 10;

[{
    "introBlackLoading" cutText ["", "BLACK OUT", 5];
}, [], 4] call CBA_fnc_waitAndeXecute;

intro_texture_4 setobjecttexture [0, ""]; // remove texture

[{
    params ["_camera"];

    _camera cameraEffect ["terminate","back"];
    camDestroy _camera;
    showCinemaBorder false;
    5 fadeSound 1;
     "introBlackLoading" cutText ["", "BLACK IN", 5];
     diwako_dui_main_toggled_off = false;

    TF_speak_volume_meters = grad_intro_voiceVolumeCache;
    
}, [_camera], _duration] call CBA_fnc_waitAndeXecute;
