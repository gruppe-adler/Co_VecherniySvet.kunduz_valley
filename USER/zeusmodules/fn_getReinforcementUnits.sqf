params ["_type"];


private _units = switch (_type) do { 
    case "squad" : { 
    [
        "UK3CB_TKM_O_SL",
        "UK3CB_TKM_O_TL",
        "UK3CB_TKM_O_MD",
        "UK3CB_TKM_O_AR",
        "UK3CB_TKM_O_RIF_1",
        "UK3CB_TKM_O_ENG",
        "UK3CB_TKM_O_RIF_2",
        "UK3CB_TKM_O_MK"
    ] 
    }; 
    case "fireteam" : { 
    [
        "UK3CB_TKM_O_TL",
        "UK3CB_TKM_O_AT",
        "UK3CB_TKM_O_AT_ASST",
        "UK3CB_TKM_O_RIF_1"
    ] 
    }; 
    case "specialteam" : { 
    [
        "UK3CB_TKM_O_MK",
        "UK3CB_TKM_O_IED"
    ] 
    }; 
    case "heavy" : { 
    [
        "UK3CB_TKM_O_SL",
        "UK3CB_TKM_O_TL",
        "UK3CB_TKM_O_MD",
        "UK3CB_TKM_O_MK",
        "UK3CB_TKM_O_MG",
        "UK3CB_TKM_O_MG_ASST",
        "UK3CB_TKM_O_ENG",
        "UK3CB_TKM_O_RIF_1"
    ]
    }; 
    default {[]}; 
};

_units