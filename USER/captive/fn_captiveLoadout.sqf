params ["_unit"];

if (isServer) then {
    _unit setUnitLoadout [[],[],[],["UK3CB_CHC_C_U_Overall_03",[["FirstAidKit",1],[],[],[],[]]],[],[],"","G_Blindfold_01_black_F",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","fsob_Beard01_Brown_nvg"]];
    
    private _face = "WhiteHead_" + (selectRandom ["16","17","18","19","20","21"]) + "_sick";
    if (random 2 > 1) then {
        _face = "AsianHead_A3_" + (selectRandom ["01","02","03","04","05","06","07"]) + "_sick";
    };
    [_unit, _face] remoteExec ["setFace", 0, _unit];
};