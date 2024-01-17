params ["_object"];

[_object] call BIS_fnc_initIntelObject; 
 
if (isServer) then { 
 // Diary picture: 
 _object setVariable [ 
  "RscAttributeDiaryRecord_texture", 
  "user\intel\intel1.paa", // Path to picture 
  true 
 ]; 
  
 // Diary Title and Description: 
 [ 
  _object, 
  "RscAttributeDiaryRecord", 
  ["New Intel", "There is a spot marked as 'good hide' on a map."] // Array in format [Title, Description] 
 ] call BIS_fnc_setServerVariable; 
  
 // Diary entry shared with (follows BIS_fnc_MP target rules): 
 _object setVariable ["recipients", west, true]; 
  
 // Sides that can interact with the intel object: 
 _object setVariable ["RscAttributeOwners", [west], true]; 
 
{
    // Register intel object with Zeus as curator editable (_zeus is the curator module): 
    _x addCuratorEditableObjects [[_object], false]; 
    
    // Add Zeus scripted event: 
    [_x, "IntelObjectFound", {hint "Intel found"}] call BIS_fnc_addScriptedEventHandler; 
} forEach allCurators;
 
 // Add a scripted event that notifies all clients via systemChat when the intel is found: 
 [ 
  _object, 
  "IntelObjectFound", 
  { 
   params ["", "_foundBy"]; 
   private _msg = format ["Intel found by %1", name _foundBy]; 
   _msg remoteExec ["systemChat", 0]; 
  } 
  ] call BIS_fnc_addScriptedEventHandler; 
};