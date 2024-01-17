private _duration = 45;

// skiptime 3;

introTexture attachTo [introtextureHolder]; introTexture setObjectScale 10;


private _heli = createVehicle ["RHS_AH1Z", [4594.1, 2192, 50], [], 0, "FLY"];
private _crew = createVehicleCrew _heli;
_heli engineOn true;
_heli setDir 333;
_heli setCaptive true;
_heli flyInHeight 40;
(driver _heli) doMove [3571.52,5127.56, 50];
_heli setSpeedMode "LIMITED";


[_heli, _duration] remoteExec ["grad_intro_fnc_intro", 0, true];

[{
    params ["_heli"];

    deleteVehicle _heli;
    // skiptime -3;
    
}, [_heli], _duration] call CBA_fnc_waitAndeXecute;
