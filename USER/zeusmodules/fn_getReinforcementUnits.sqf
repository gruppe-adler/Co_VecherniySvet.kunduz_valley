params ["_type"];


private _units = switch (_type) do { 
    case "squad" : { 
    [
        "UK3CB_TKM_I_SL",
        "UK3CB_TKM_I_TL",
        "UK3CB_TKM_I_MD",
        "UK3CB_TKM_I_AR",
        "UK3CB_TKM_I_RIF_1",
        "UK3CB_TKM_I_ENG",
        "UK3CB_TKM_I_RIF_2",
        "UK3CB_TKM_I_MK"
    ] 
    }; 
    case "fireteam" : { 
    [
        "UK3CB_TKM_I_TL",
        "UK3CB_TKM_I_AT",
        "UK3CB_TKM_I_AT_ASST",
        "UK3CB_TKM_I_RIF_1"
    ] 
    }; 
    case "specialteam" : { 
    [
        "UK3CB_TKM_I_MK",
        "UK3CB_TKM_I_IED"
    ] 
    }; 
    case "heavy" : { 
    [
        "UK3CB_TKM_I_SL",
        "UK3CB_TKM_I_TL",
        "UK3CB_TKM_I_MD",
        "UK3CB_TKM_I_MK",
        "UK3CB_TKM_I_MG",
        "UK3CB_TKM_I_MG_ASST",
        "UK3CB_TKM_I_ENG",
        "UK3CB_TKM_I_RIF_1"
    ]
    }; 
    default {[]}; 
};

_units