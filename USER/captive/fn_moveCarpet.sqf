params ["_carpet"];

if (isServer) then {
    private _helper = "Sign_Sphere100cm_F" createVehicle [0,0,0];
    _helper setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];

    _helper attachTo [_carpet, [0,0,0.2]];

    _helper setVariable ["EL_rug", _carpet, true];

    [_helper] remoteExec ["grad_captive_fnc_moveCarpetAction", 0, true];

};

