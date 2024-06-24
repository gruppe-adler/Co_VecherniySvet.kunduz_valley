params ["_unit"];

if (
	!isNull (getAssignedCuratorLogic player) && 
	!(_unit getVariable ["grad_zeusmodules_isMarked", false])
	) then {

	private _marker = "Sign_Arrow_Green_F" createVehicleLocal [0,0,0];
	_marker attachTo [_unit, [0,0,2]]; 

	_unit setVariable ["grad_zeusmodules_isMarked", true];
};
