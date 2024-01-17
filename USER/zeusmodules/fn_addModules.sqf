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

              _x addGoggles "CUP_Beard_Black";
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

["Evening Light - Enemies Cloaked", "Reinforcements Squad", {
     params ["_position", "_object"];
     
     ["squad", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements Squad", {
     params ["_position", "_object"];
     
     ["squad", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Evening Light - Enemies Cloaked", "Reinforcements Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Evening Light - Enemies Cloaked", "Reinforcements specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Evening Light - Enemies Cloaked", "Reinforcements heavy", {
     params ["_position", "_object"];
     
     ["heavy", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements heavy", {
     params ["_position", "_object"];
     
     ["heavy", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;



["Evening Light - GRAD Leavenotes", "Spawn Note", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;

          ["Example Dialog", [["EDIT", "Your text?", "string ping"]], {
			   params ["_message", "_position"]; 
                  // systemchat str _position; 
                  // systemchat (_message select 0);
			   [_position, random 360, _message select 0, ["somewhat",["cramped","EtelkaNarrowMediumPro"]]] remoteExec ["GRAD_leaveNotes_fnc_spawnNote", 2, false];
		  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;        
     }
] call zen_custom_modules_fnc_register;


["Evening Light - Hooker", "Spawn Hooker", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;
          
          [_position] remoteExec ["grad_SR_fnc_hooker_spawn", 2];
     }
] call zen_custom_modules_fnc_register;

["Evening Light - Abu Ben Zeen", "Spawn Abu", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;
          
          [_position] remoteExec ["grad_zeusmodules_fnc_createAbuBenZeen", 2];
     }
] call zen_custom_modules_fnc_register;

["Evening Light - Objectivemarker", "Show Objective 2 (Taliban FOB)", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;
          
          mrk_objective3_active = true;
          publicVariable "mrk_objective3_active";
     }
] call zen_custom_modules_fnc_register;

["Evening Light - Objectivemarker", "Show Objective 3 (Ben Zeen)", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;
          
          mrk_objective4_active = true;
          publicVariable "mrk_objective4_active";
     }
] call zen_custom_modules_fnc_register;

["Evening Light - IED Workshop", "Spawn IED Truck", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;
          
          [_position] remoteExec ["grad_zeusmodules_fnc_spawnIEDtruck", 2];
     }
] call zen_custom_modules_fnc_register;

["Evening Light - IED Workshop", "Spawn Defender Group", {
          params ["_modulePosition"]; 
          
          [] remoteExec ["grad_zeusmodules_fnc_createGroupIEDworkshop", 2];
     }
] call zen_custom_modules_fnc_register;




["Evening Light - Captive", "Start Screaming", {
     params ["_position", "_object"];
     
     call grad_captive_fnc_yellStuff;
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Captive", "Stop Screaming", {
     params ["_position", "_object"];
     
     if (!isNull captive_compound2) then {
          captive_compound2 setVariable ['EL_yelling', true, true];
     };
     
}] call zen_custom_modules_fnc_register;



["Evening Light - Ambient", "Music Radio",
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


["Evening Light - Ambient", "Suicide Car Spawn",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_ambient_fnc_suicideCar", 2];

    }] call zen_custom_modules_fnc_register;


["Evening Light - Ambient", "Create Mosque Singer",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_ambient_fnc_createMosqueSinger", 2];

    }] call zen_custom_modules_fnc_register;

["Evening Light - Ambient", "Shoot Flare",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

       _position set [2, 250]; private _ammo = "rhsusf_40mm_clusterflare_red" createVehicle _position; 
      _ammo setVelocity [random 1,random 1,1];

    }] call zen_custom_modules_fnc_register;

    

    

["Evening Light - End", "Create Chair Circle",
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



