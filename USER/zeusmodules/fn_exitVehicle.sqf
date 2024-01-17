params ["_vehicle"];

_vehicle addEventHandler ["GetOut", { 
    params ["_vehicle", "_role", "_unit", "_turret"]; 
    if (!(_vehicle getVariable ['EL_exitScheduled', false])) then { 
        _unit moveInTurret [_vehicle, _turret]; 
        [{ 
            params ["_unit", "_vehicle"];
            moveout _unit;
            _unit leaveVehicle _vehicle;
            [{ 
                _this setVariable ['EL_exitScheduled', false];
            }, _vehicle, 3] call CBA_fnc_waitAndExecute; 
        }, [_unit, _vehicle], random 2] call CBA_fnc_waitAndExecute; 
    }; _vehicle setVariable ['EL_exitScheduled', true];
}];