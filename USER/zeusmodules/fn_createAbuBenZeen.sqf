params ["_position"];

private _group = createGroup east;
private _unit = _group createUnit ["UK3CB_TKM_O_IED", _position, [], 0, "NONE"];
_unit setVariable ["lambs_danger_disableAI", true];

[{	
	_this setUnitLoadout [[],[],[],["UK3CB_TKC_C_U_03_B",[]],["UK3CB_V_Invisible_Plate",[]],["gm_gc_backpack_r105m_brn",[]],"UK3CB_TKM_B_H_Turban_03_1","gm_xx_facewear_scarf_01_red",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
}, _unit, 5] call CBA_fnc_waitAndExecute;
