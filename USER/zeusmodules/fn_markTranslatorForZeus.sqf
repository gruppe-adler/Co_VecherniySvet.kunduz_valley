params ["_unit"];

if (
	!isNull (getAssignedCuratorLogic player) && 
	!(_unit getVariable ["grad_zeusmodules_isMarked", false])
	) then {

	private _marker = "Sign_Arrow_Green_F" createVehicleLocal [0,0,0];
	_marker attachTo [_unit, [0,0,2]]; 

	_unit setVariable ["grad_zeusmodules_isMarked", true];

	((_unit getVariable ["ACE_Name", name _unit]) + " learned pashtun.") call CBA_fnc_notify;

	[{
		params ["_unit", "_marker"];

		deleteVehicle _marker;
		_unit setVariable ["grad_zeusmodules_isMarked", false];

	}, [_unit, _marker], 15] call CBA_fnc_waitAndExecute;
};
