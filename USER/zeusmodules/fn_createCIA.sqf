params ["_position"];

private _unit = (createGroup west) createUnit ["B_Soldier_F", _position, [], 0, "NONE"];
_unit enableDynamicSimulation true;

private _face = selectRandom [
	"WhiteHead_01",
	"WhiteHead_02",
	"WhiteHead_03",
	"WhiteHead_04",
	"WhiteHead_05",
	"WhiteHead_06",
	"WhiteHead_07",
	"WhiteHead_08",
	"WhiteHead_09",
	"WhiteHead_10",
	"WhiteHead_11",
	"WhiteHead_12",
	"WhiteHead_13",
	"WhiteHead_14",
	"WhiteHead_15",
	"WhiteHead_16",
	"WhiteHead_17",
	"WhiteHead_18",
	"WhiteHead_19",
	"WhiteHead_20",
	"WhiteHead_21",
	"WhiteHead_22",
	"WhiteHead_23",
	"WhiteHead_24",
	"WhiteHead_25",
	"WhiteHead_26",
	"WhiteHead_27",
	"WhiteHead_28",
	"WhiteHead_29",
	"WhiteHead_30",
	"WhiteHead_31",
	"WhiteHead_32"
];

private _uniform = selectRandom [
	"UK3CB_MEC_C_Jeans_Tshirt_U_01",
	"UK3CB_MEC_C_Jeans_Tshirt_U_02",
	"UK3CB_MEC_C_Jeans_Tshirt_U_03",
	"UK3CB_MEC_C_Jeans_Tshirt_U_04",
	"UK3CB_MEC_C_Jeans_Tshirt_U_05",
	"UK3CB_MEC_C_Jeans_Tshirt_U_06",
	"UK3CB_MEC_C_Jeans_Tshirt_U_07",
	"UK3CB_MEC_C_Jeans_Tshirt_U_08",
	"UK3CB_MEC_C_Jeans_Tshirt_U_09",
	"UK3CB_MEC_C_Jeans_Tshirt_U_10",
	"UK3CB_MEC_C_Jeans_Tshirt_U_11",
	"UK3CB_MEC_C_Jeans_Tshirt_U_12",
	"UK3CB_MEC_C_Jeans_Tshirt_U_13",
	"UK3CB_MEC_C_Jeans_Tshirt_U_14",
	"UK3CB_MEC_C_Jeans_Tshirt_U_15",
	"UK3CB_MEC_C_Jeans_Tshirt_U_16",
	"UK3CB_MEC_C_Jeans_Tshirt_U_17",
	"UK3CB_MEC_C_Jeans_Tshirt_U_18",
	"UK3CB_MEC_C_Jeans_Tshirt_U_19",
	"UK3CB_MEC_C_Jeans_Tshirt_U_20",
	"UK3CB_MEC_C_Jeans_Tshirt_U_21",
	"vn_b_uniform_seal_05_07"
];

private _headgear = selectRandom [
	"UK3CB_LSM_B_H_BoonieHat_KHK",
	"UK3CB_LNM_B_H_BoonieHat_FLK_03",
	"UK3CB_H_BoonieHat_ERDL_AFG",
	"vn_b_boonie_01_01",
	"vn_b_boonie_04_01",
	"vn_b_boonie_03_01",
	"vn_b_boonie_03_03",
	"UK3CB_TKP_B_H_Patrolcap_TAN",
	"UK3CB_TKP_O_H_Patrolcap_Blk",
	"UK3CB_H_MilCap_WDL_01",
	"UK3CB_TKM_O_H_Turban_05_1",
	"rhsgref_hat_m1941cap",
	"UK3CB_H_Cap_WDL_02",
	"UK3CB_H_Cap_WDL_01",
	"H_Cap_oli",
	"H_Cap_grn",
	"H_Watchcap_khk",
	"H_Watchcap_camo",
	"H_Watchcap_cbr"
];

private _beard = selectRandom [
	"fsob_Beard03_Brown",
	"fsob_Beard03_Dark",
	"fsob_Beard03_Light",
	"G_Bandanna_tan",
	"rhs_googles_black",
	"UK3CB_G_Bandanna_green_check"
];

private _backpack = selectRandom [
	"vn_b_pack_static_m60_high_01",
	"vn_b_pack_static_base_01",
	"vn_b_pack_trp_02",
	"vn_b_pack_m41_05",
	"rhs_r148",
	"UK3CB_B_Backpack_Pocket",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	""
];

private _loadout = 
	selectRandom
	[
		[["UK3CB_M16_Carbine","","","",["UK3CB_M16_30rnd_556x45",30],[],""],[],[],[_uniform,[["UK3CB_M16_30rnd_556x45",2,30]]],["UK3CB_MDF_B_V_CREW_Vest_TAN",[["UK3CB_M16_30rnd_556x45",3,30]]],[],_headgear,_beard,[],["","","","ItemCompass","gm_watch_kosei_80",""]],
		[["UK3CB_M16_Carbine","","","",["UK3CB_M16_30rnd_556x45",30],[],""],[],[],[_uniform,[["UK3CB_M16_30rnd_556x45",2,30]]],["gm_ge_bgs_vest_type3_gry",[["UK3CB_M16_30rnd_556x45",1,30]]],[],_headgear,_beard,[],["","","","ItemCompass","gm_watch_kosei_80",""]]
	];

_unit setUnitLoadout _loadout;

[_unit, _face] remoteExec ["setFace", 0, _unit];

_unit