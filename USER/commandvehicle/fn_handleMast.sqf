params ["_vehicle"];

if (!isServer) exitWith {};


[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (!(alive _vehicle)) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _canDrive = _vehicle animationPhase "antena1" == 0;
    private _isAnimating = _vehicle animationPhase "antena1" > 0 && _vehicle animationPhase "antena3" < 1;

    if (!_canDrive && !_isAnimating && !(_vehicle getVariable ["EL_isStatic", false])) then {
        _vehicle setVariable ["EL_isStatic", true, true];

        [_vehicle, false] call GRAD_commandvehicle_fnc_showHideMedicStuff;
        _vehicle setVariable ["ace_medical_isMedicalVehicle", true, true];
    };

    if (_canDrive && !_isAnimating && (_vehicle getVariable ["EL_isStatic", false])) then {
        _vehicle setVariable ["EL_isStatic", false, true];

        [_vehicle, true] call GRAD_commandvehicle_fnc_showHideMedicStuff;
        _vehicle setVariable ["ace_medical_isMedicalVehicle", false, true];
    };

}, 1, [_vehicle]] call CBA_fnc_addPerFramehandler;

[_vehicle] call GRAD_commandvehicle_fnc_attachMedicStuff;
