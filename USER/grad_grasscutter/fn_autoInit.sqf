// Markers into grass cutters script by Sa-Matra
{
    if(
        markerShape _x == "RECTANGLE" &&
        toLower _x find "grasscutter" == 0
    ) then {
        if(hasInterface) then {
            _sin = sin markerDir _x;
            _cos = cos markerDir _x;
            markerSize _x params ["_mw", "_mh"];
            markerPos _x params ["_mx", "_my"];
            for "_i" from -_mw to _mw step 7 do {
                for "_j" from -_mh to _mh step 7 do {
                    // "Land_ClutterCutter_large_F" createVehicleLocal [_mx + _cos * _i + _sin * _j, _my + -_sin * _i + _cos * _j, 0];
                    createSimpleObject [getMissionPath "USER\grad_grasscutter\ClutterCutter_large_F.p3d", [_mx + _cos * _i + _sin * _j, _my + -_sin * _i + _cos * _j, 0], true];
                };
            };
        };
        deleteMarkerLocal _x;
    };
} forEach allMapMarkers;

// [{
// 	{ deleteVehicle _x; } forEach allMissionObjects "Land_ClutterCutter_large_F";
// }, [], 10] call CBA_fnc_waitAndExecute;
