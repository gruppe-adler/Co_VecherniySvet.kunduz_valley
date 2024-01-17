introDisabled = false;

if (isServer) then {
    if (!isMultiplayer && introDisabled) exitWith {};
    [{
        
        [] call grad_intro_fnc_introServer;

    }, [], 10] call CBA_fnc_waitAndExecute;

};


if (hasInterface && !didJIP) then {
    if (!isMultiplayer && introDisabled) exitWith {};
    "introBlackLoading" cutText ["", "BLACK FADED", 999999];
};
