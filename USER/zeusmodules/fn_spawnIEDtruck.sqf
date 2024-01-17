params ["_position"];

private _nearestObject = nearestObject _position;
if (!isNull (_nearestObject)) then {
	if (_nearestObject distance _position < 3) then {

	private _ural = "gm_gc_civ_ural375d_cargo" createVehicle [0,0,0];
	_ural setVehicleLock "unlocked";
	 private _dir = _position getDir [worldSize/2, worldsize/2];
	_ural setDir _dir;
	_ural setPos _position;

	private _minePositions = [
		[0.25415,2.76086,-1.17686],
		[0.64209,-1.49768,-1.36008],
		[0.0471191,3.84473,-1.16257],
		[-0.427246,2.71655,-1.28675],
		[-0.544189,-1.52783,-1.32019],
		[-0.00195313,-3.17419,-1.19368]
	];

	private _mine = "gm_minestatic_ap_pfm1" createVehicle [0,0,0];
	_mine attachTo [_ural, selectRandom _minePositions];
	_mine allowDamage false;

	private _driver = (creategroup civilian) createUnit ["UK3CB_TKC_C_WORKER", [0,0,0], [], 0, "NONE"];
	_driver assignAsDriver _ural;
	_driver moveInDriver _ural;
	_driver setVariable ["lambs_danger_disableAI", true];

	} else {
		systemchat "too close to existing object";
	};
};
