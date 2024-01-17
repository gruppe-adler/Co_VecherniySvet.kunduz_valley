params ["_unit"];


private _phone = createVehicle ["Land_MobilePhone_old_F", [0,0,0], [], 0, "NONE"];
_phone attachTo [_unit, [0,0,0], "lefthand", true];

private _y = 180; _p = 20; _r = 220;
_phone setVectorDirAndUp [ 
 [sin _y * cos _p, cos _y * cos _p, sin _p], 
 [[sin _r, -sin _p, cos _r * cos _p], -_y] call BIS_fnc_rotateVector2D 
]; 

_unit setVariable ["grad_SR_hookerPhone", _phone, true];

[_unit, "radioAnims_Ear", 1] call ace_common_fnc_doGesture;

_unit setVariable ["grad_SR_hookerPhoning", true, true];


[{
	params ["_unit"];
	!(_unit getVariable ["grad_SR_hookerPhoning", false])
}, {
	params ["_unit"];

	private _phone = _unit getVariable ["grad_SR_hookerPhone", objNull];
	deleteVehicle _phone;

}, [_unit]] call CBA_fnc_waitUntilAndExecute;


[_unit] spawn {
	params ["_unit"];

	private _sounds = [
		"nadia_phoning_01",
		"nadia_phoning_02",
		"nadia_phoning_03",
		"nadia_phoning_04",
		"nadia_phoning_05",
		"nadia_phoning_06",
		"nadia_phoning_07",
		"nadia_phoning_08",
		"nadia_phoning_09",
		"nadia_phoning_10",
		"nadia_phoning_11",
		"nadia_phoning_12",
		"nadia_phoning_13"
	];

	private _dummy = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0]];
	{
		[_unit, _x, "grad_SR_hookerPhoning"] remoteExec ["grad_SR_fnc_customInteractions_playSoundLocal"];
		
		private _sound = _dummy say3d _x;
		waitUntil { isNull _sound };
		sleep (3 + random 3);

		if (!(_unit getVariable ["grad_SR_hookerPhoning", false])) exitWith {
			diag_log "aborting phone call";
			[_unit, "radioAnims_Stop", 1] call ace_common_fnc_doGesture;
			// deleteVehicle _dummy;
		};
	} forEach _sounds;
	[_unit, "radioAnims_Stop", 1] call ace_common_fnc_doGesture;
	deleteVehicle _dummy;
	systemchat "deleting dummy";
};
