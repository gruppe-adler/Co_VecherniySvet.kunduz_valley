params ["_vehicle"];

private _attachedItems = [];

{
    _x params ["_className", "_offset", "_vectorDirAndUp"];

    private _item = _className createVehicle [0,0,0];
    _item attachTo [_vehicle, _offset];
    _item setVectorDirAndUp _vectorDirAndUp;

    _attachedItems pushBackUnique _item;

} forEach [   
    ["Land_Stretcher_01_F",[0.268921,-3.02197,-2.85201],
    [[-0.999588,0.0249042,-0.0142882],
    [-0.0146306,-0.0136192,0.9998]]],
    ["Land_IntravenStand_01_2bags_F",[1.54944,-3.09863,-2.16616],
    [[-0.988253,-0.15241,-0.0112447],
    [-0.0119948,0.00400341,0.99992]]],
    ["Land_Defibrillator_F",[1.40204,-3.51123,-3.03024],
    [[-0.988253,-0.15241,-0.0112447],
    [-0.0119948,0.00400341,0.99992]]],
    ["Land_FirstAidKit_01_open_F",[0.802307,-3.50439,-3.04372],
    [[-0.0952439,0.99539,-0.0112447],
    [0.00468755,0.0117444,0.99992]]],
    ["Land_PortableCabinet_01_medical_F",[1.58008,-2.93945,-2.67776],
    [[0.0871232,0.996134,-0.0112447],
    [0.0067426,0.0106977,0.99992]]]
];

_vehicle setVariable ["EL_medicStuffAttached", _attachedItems, true];

[_vehicle, true] call GRAD_commandvehicle_fnc_showHideMedicStuff;