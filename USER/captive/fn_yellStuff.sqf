if (isServer) then {

    private _house = captiveHouse;
    private _unit = captive_compound2;

    _unit setVariable ['EL_yelling', true, true];

    [{
        params ["_args", "_handle"];
        _args params ["_unit", "_house"];

        if (!captive _unit || !(_unit getVariable ['EL_yelling', false])) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _yell = random 2 > 1.8;

        if (_house animationphase "Door_2_source" == 0) then {
            if (_yell) then {
                private _sound = selectRandom ["yell1_muffled", "yell2_muffled"];
                [_unit, [_sound, 150, 1, true]] remoteexec ["say3d", 0];
            };
        } else {
            if (_yell) then {
                private _sound = selectRandom ["yell1_unmuffled", "yell2_unmuffled"];
                [_unit, [_sound, 150, 1, true]] remoteexec ["say3d", 0];
            };
        };
        
    }, 1, [_unit, _house]] call CBA_fnc_addPerFramehandler;
};
