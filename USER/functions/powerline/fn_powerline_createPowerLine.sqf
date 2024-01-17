params ["_object1", "_object2"];

private _attachHelper = "ace_fastroping_helper" createVehicle [0,0,0];
_attachHelper allowDamage false;
_attachHelper attachTo [_object1, [0, 0, 0], "", true];

private _powerLine = ropeCreate [_attachHelper, [0,0,0], 20, ["", [0,0,-1]], ["", [0,0,-1]], "TFAR_RopeSmallWire", 10];

private _attachHelper2 = "ace_fastroping_helper" createVehicle [0,0,0];
_attachHelper2 allowDamage false;
_attachHelper2 attachTo [_object2, [0, 0, 0], "", true];

[_attachHelper2, [0, 0, 0], [0,0,-1]] ropeAttachTo _powerLine;
[_attachHelper, [0, 0, 0], [0,0,-1]] ropeAttachTo _powerLine;


