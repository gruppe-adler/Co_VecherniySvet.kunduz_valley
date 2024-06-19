introDisabled = false;

if (isServer) then {
    if (introDisabled) exitWith {};

    // only spawns and prepares
    [] call grad_intro_fnc_sheepTransport;
    [] call grad_intro_fnc_convoy;    

    /*
    [{
        [] call grad_intro_fnc_introServer;

    }, [], 10] call CBA_fnc_waitAndExecute;
    */

};


if (hasInterface 
    // && !didJIP
    ) then {
    if (introDisabled) exitWith {};
    "introBlackLoading" cutText ["", "BLACK FADED", 999999];
    0 fadeSound 0;

    if (missionNameSpace getVariable ["grad_missionControl_introStarted", false]) then {
        "introBlackLoading" cutText ["", "BLACK IN", 5];
        systemChat "skipping intro as you are too late";
    };
};
