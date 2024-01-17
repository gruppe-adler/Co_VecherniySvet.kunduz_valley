params["_computer", "_options", "_commandName"];   
  
[_computer, ["ied_countdown", 200]] remoteExec ["say3d", 0, _computer];   
_computer setVariable ["AE3_power_powerState", 0, true];  
  
_computer setObjectTextureGlobal [1, "data\selfdestruct.paa"];  
  

closeDialog 1; 

  
[{   
 "Bo_GBU12_LGB" createVehicle (_this);  
 private _rock = "Land_BluntRock_wallH" createVehicle [0,0,0]; 
 _rock setPos [3236.11,6907.6,1.9]; 
 
 [ 
  [
	[3261.37,6875.15,0], 
  	[3290.01,6846.29,0], 
  	[3246.89,6902.12,0] 
  ]
 ] remoteExec ["grad_sr_fnc_powerline_rockshower"]; 
}, position _computer, 65] call CBA_fnc_waitAndExecute; 
 
