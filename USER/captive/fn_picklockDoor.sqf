params ["_door"];


[
  _door,
  "Lockpick door",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "
    call {  
      private ['_intersects','_select_door'];
      _intersects = ([cursorObject, 'VIEW'] intersect [ASLToATL eyepos player, (screentoworld [0.5,0.5])]);
      _select_door = if (count _intersects > 0 && {(_intersects select 0) select 0 in ['door_3','door_5']}) then [{format ['bis_disabled_%1', (_intersects select 0 select 0)]},{''}];
      if (_this distance _target < 15 && _select_door in ['bis_disabled_door_3','bis_disabled_door_5']) then {
        MGI_select_door = _select_door; true
      } else {false};
    };
    true",
  "true", {}, {},
  {
    if (_target getVariable [MGI_select_door,1] !=0) then {
      _target setVariable[MGI_select_door,0,true]
    } else {
      _target setVariable[MGI_select_door,1,true]
    }
  }, {}, [], 5, nil, false, false
] call BIS_fnc_holdActionAdd;