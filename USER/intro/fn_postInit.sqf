introDisabled = true;

if (isServer) then {
    if (introDisabled) exitWith {};

    // only spawns and prepares
    [] call grad_intro_fnc_sheepTransport;
    [] call grad_intro_fnc_convoy;    

    [{
        
        [] call grad_intro_fnc_introServer;

    }, [], 10] call CBA_fnc_waitAndExecute;

};


if (hasInterface && !didJIP) then {
    if (introDisabled) exitWith {};
    "introBlackLoading" cutText ["", "BLACK FADED", 999999];
    0 fadeSound 0;
};
