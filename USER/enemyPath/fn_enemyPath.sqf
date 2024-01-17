params ["_unit", "_endPosition"];


private _agent = (calculatePath ["tank","aware",getPos _unit, _endPosition]) addEventHandler ["PathCalculated", {
    params ["_agent", "_path"];

    if (_agent getVariable ["EL_calculated", false]) exitWith {};
    _agent setVariable ["EL_calculated", true];
    missionNamespace setVariable ["EL_calculatedPath", _path];
    {
        private _marker = createMarker ["marker" + str _forEachIndex + str _x + str time, _x];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText str _forEachIndex;
    } forEach _path;    
}];


[{
    params ["_unit"];
    _unit setDriveOnPath EL_calculatedPath;
},
[_unit],1] call CBA_fnc_waitAndExecute;

