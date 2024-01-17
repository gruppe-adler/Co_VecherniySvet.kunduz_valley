if (!isServer) exitWith {};

["GRAD_missionControl_setServerAsOwner", {
    params ["_group"];

    //make unit editable for all zeus
    if([_group] isEqualTypeParams [grpNull])then{
        {
            _x addCuratorEditableObjects [units _group, true];
        } forEach (entities "moduleCurator_F");
    };


    // change owner to server
    _group setGroupOwner 2;


    // reapply loadiout if necessary
    [{
        params ["_group"];

        // setunitloadout class as a fallback, if unit is naked
        {
            if ((uniform _x) isEqualTo "") then {
                _x setUnitLoadout (typeOf _x);
            };

            // add beard for taliban
            if (side _x == east) then {
                _x addGoggles "CUP_Beard_Black";
            };
        } forEach units _group;
    }, [_group], 3] call CBA_fnc_waitAndExecute;
   
}] call CBA_fnc_addEventHandler;