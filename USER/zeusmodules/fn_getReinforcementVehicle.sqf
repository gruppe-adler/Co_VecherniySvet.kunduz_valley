params ["_type", "_cloaked"];


private _classname = switch (_type) do { 
    case "squad" : { 
        if (_cloaked) then {
            selectRandom [
                    "UK3CB_TKC_C_Kamaz_Covered",
                    "UK3CB_TKC_C_Kamaz_Open",
                    "UK3CB_TKC_C_V3S_Reammo",
                    "UK3CB_TKC_C_V3S_Open",
                    "UK3CB_TKC_C_Ural_Open",
                    "UK3CB_TKC_C_Ural"
            ]
        } else {
            selectRandom [
                    "UK3CB_TKM_O_Ural_Open",
                    "UK3CB_TKM_O_Ural_Covered",
                    "UK3CB_TKM_O_V3S_Closed",
                    "UK3CB_TKM_O_V3S_Open"
            ]
        };
    }; 
    case "fireteam" : {
        if (_cloaked) then {
            selectRandom [
                    "UK3CB_TKC_C_Hatchback",
                    "UK3CB_TKC_C_Lada",
                    "UK3CB_TKC_C_Lada_Taxi",
                    "UK3CB_TKC_C_Sedan",
                    "UK3CB_TKC_C_Skoda",
                    "UK3CB_TKC_C_Gaz24"
            ]
        } else {
            selectRandom [
                    "UK3CB_TKM_O_Datsun_Pkm",
                    "UK3CB_TKM_O_Hilux_M2",
                    "UK3CB_TKM_O_Hilux_Mortar",
                    "UK3CB_TKM_O_Hilux_Pkm",
                    "UK3CB_TKM_O_Hilux_Spg9",
                    "UK3CB_TKM_O_Pickup_M2",
                    "UK3CB_TKM_O_Pickup_DSHKM"
            ]
        };
    }; 
    case "specialteam" : {
        if (_cloaked) then {
            selectRandom [
                    "UK3CB_TKC_C_TT650",
                    "UK3CB_TKC_C_YAVA"
            ]
        } else {
            selectRandom [
                    "UK3CB_TKC_C_TT650",
                    "UK3CB_TKC_C_YAVA"
            ]
        };
    };
    case "heavy" : {
        if (_cloaked) then {
            selectRandom [
                    "UK3CB_TKC_C_Ikarus",
                    "UK3CB_C_Ikarus_RED",
                    "UK3CB_ADC_C_Ikarus",
                    "UK3CB_CHC_C_Ikarus"
            ]
        } else {
            selectRandom [
                    "UK3CB_TKM_O_MTLB_PKT",
                    "UK3CB_TKM_O_BTR60"
            ]
        };
    };

    default {"UK3CB_TKC_C_Lada"}; 
};

_classname