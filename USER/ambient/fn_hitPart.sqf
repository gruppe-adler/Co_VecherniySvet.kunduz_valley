params ["_helper"];

//While you can add "HitPart" handler to a remote unit, the respective addEventHandler command must be executed on the shooter's PC and will only fire on shooter's PC as well. 
_helper addEventHandler ["HitPart", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
  
  private _pos = getPos _target;
  deleteVehicle (_target getVariable ["soundSource", objNull]);

  [_target] remoteExecCall ["grad_ambient_fnc_brokenRadio", 0];

  _target removeEventHandler ["HitPart", _thisEventhandler]; // removes once per shooter, not critical to have them all deleted at once

}];