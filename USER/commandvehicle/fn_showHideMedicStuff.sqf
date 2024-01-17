params ["_vehicle", "_isShow"];

private _medicStuff = _vehicle getVariable ["EL_medicStuffAttached", []];


{
  _x hideObjectGlobal _isShow;
} forEach _medicStuff;