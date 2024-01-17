private _spawnposition = [3222.22,6914,0];

private _group = createGroup east;
private _classnames = [
	"UK3CB_TKM_O_LAT",
	"UK3CB_TKM_O_MD",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_IED",
	"UK3CB_TKM_O_MG",
	"UK3CB_TKM_O_SL",
	"UK3CB_TKM_O_WAR"
];

{
	private _unit = _group createUnit ["UK3CB_TKM_O_IED", _position, [], 0, "CAN_COLLIDE"];
	_unit setVariable ["lambs_danger_disableAI", true];
} forEach _classnames;
