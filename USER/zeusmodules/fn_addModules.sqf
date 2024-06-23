[] spawn {
  waitUntil {!isNull player};
  waitUntil {  time > 3 };

  {
    private _curator = _x;
    
      _curator addEventHandler ["CuratorGroupPlaced", {
          params ["", "_group"];

          { 
              _x setSkill ["aimingAccuracy", 0.3];
              _x setSkill ["aimingShake", 0.2]; 
              _x setSkill ["aimingSpeed", 0.9]; 
              _x setSkill ["endurance", 0.6]; 
              _x setSkill ["spotDistance", 1]; 
              _x setSkill ["spotTime", 0.9]; 
              _x setSkill ["courage", 1]; 
              _x setSkill ["reloadSpeed", 1]; 
              _x setSkill ["commanding", 1];
              _x setSkill ["general", 1];

              _x addGoggles "fsob_Beard01_Dark";
          } forEach units _group;

          ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;
      }];

      _curator addEventHandler ["CuratorObjectPlaced", {
          params ["", "_object"];
          
          _object setSkill ["aimingAccuracy", 0.3];
          _object setSkill ["aimingShake", 0.2]; 
          _object setSkill ["aimingSpeed", 0.9]; 
          _object setSkill ["endurance", 0.6]; 
          _object setSkill ["spotDistance", 1]; 
          _object setSkill ["spotTime", 0.9]; 
          _object setSkill ["courage", 1]; 
          _object setSkill ["reloadSpeed", 1]; 
          _object setSkill ["commanding", 1];
          _object setSkill ["general", 1];

          if (_object isKindOf "CAManBase") then {
             if (count units _object == 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
             };
          } else {
             if (count crew _object > 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
             };
         };

      }];

  } forEach allCurators;
};


["Co Vecherniny Svet", "Start Intro", {
     params ["_position", "_object"];
     
     [] remoteExec ["grad_intro_fnc_intro_init", 0];
     // missionNameSpace setVariable ["grad_missionControl_introStarted", true, true];
     [{
          [[1983,7,26,4,20]] remoteExec ["setDate", 0];
     }, [], 6] call CBA_fnc_waitAndExecute;
     
}] call zen_custom_modules_fnc_register;

["Co Vecherniny Svet - O3/04", "Create CIA Agent", {
     params ["_position", "_object"];
     
     [ASLToAGL _position] call grad_zeusmodules_fnc_createCIA;
     
}] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - O2", "Send in reinforcements (on vehicle)", {
     params ["_position", "_object"];
     
     if (isNull _object) exitWith { "not a vehicle" call cba_fnc_notify; };

     [_object] execVM "user\convoy\reinforcement_path.sqf";
     
}] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - Ambient", "Music Radio",
    {
      // Get all the passed parameters
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      private _radio = (selectRandom ["land_gm_euro_furniture_radio_01", "jbad_radio_b", "Land_FMradio_F"]) createVehicle [0,0,0];
      _radio setPos _position;
      _radio setDir (random 360);

      private _source = createSoundSource [(selectRandom ["music1", "music2", "arabicsong1", "arabicsong2"]), _position, [], 0];
      [_source, _radio, false] call grad_ambient_fnc_soundSourceHelper;
      
      {
        _x addCuratorEditableObjects [[_radio], false];
      } forEach allCurators;

    }] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - Ambient", "Suicide Car Spawn",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_ambient_fnc_suicideCar", 2];

    }] call zen_custom_modules_fnc_register;




["Co Vecherniny Svet - Reinf Cloaked", "Reinforcements Squad", {
     params ["_position", "_object"];
     
     ["squad", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Co Vecherniny Svet - Reinf Open", "Reinforcements Squad", {
     params ["_position", "_object"];
     
     ["squad", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - Reinf Cloaked", "Reinforcements Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Co Vecherniny Svet - Reinf Open", "Reinforcements Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - Reinf Cloaked", "Reinforcements specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Co Vecherniny Svet - Reinf Open", "Reinforcements specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - Reinf Cloaked", "Reinforcements heavy", {
     params ["_position", "_object"];
     
     ["heavy", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Co Vecherniny Svet - Reinf Open", "Reinforcements heavy", {
     params ["_position", "_object"];
     
     ["heavy", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Co Vecherniny Svet - DynSim", "Make unit wake up", {
     params ["_position", "_object"];
     
     if (isNull _object) exitWith { "not an object" call cba_fnc_notify; };
     group _object enableDynamicSimulation false;
     
}] call zen_custom_modules_fnc_register;

["Co Vecherniny Svet - DynSim", "Make unit NOT wake up", {
     params ["_position", "_object"];
     
     if (isNull _object) exitWith { "not an object" call cba_fnc_notify; };
     group _object enableDynamicSimulation true;
     
}] call zen_custom_modules_fnc_register;
    

["Co Vecherniny Svet - End", "Create Chair Circle",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;
  ["Land_CampingChair_V1_F", _position, count (PlayableUnits + switchableUnits)] call grad_zeusmodules_fnc_createChairCircle;

}] call zen_custom_modules_fnc_register;

["Evening Light - FX", "Create Monsoon",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [[180], "USER\AL_monsoon\rain_nomi.sqf"] remoteExec ["BIS_fnc_execVM", 2];

}] call zen_custom_modules_fnc_register;


["Evening Light - FX", "End Monsoon",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  grad_rain_active = false; publicVariable "grad_rain_active";

}] call zen_custom_modules_fnc_register;



