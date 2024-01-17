

if (hasInterface) then {

	if (player getVariable ["grad_defuseStickHandling", false]) exitWith {};
	player setVariable ["grad_defuseStickHandling", true];


	grad_defuseStickHandling_attach = {
		private _stick = (player getVariable ["grad_defuseStickAttached", objNull]);
		if (isNull _stick) then {
			_stick = createSimpleObject ["\z\ace\addons\minedetector\ace_wallon_vmh3.p3d", getposasl player, false];
		};
		 _stick attachTo [player, [0,-.1,-.5], "Spine3", true];
		_stick setVectorDirAndUp [[0,1,0], [1,0,0]]; 
		player setVariable ["grad_defuseStickAttached", _stick];
	};

	grad_defuseStickHandling_detach = {
		private _stick = (player getVariable ["grad_defuseStickAttached", objNull]);
		if (!isNull _stick) then {
			deleteVehicle _stick;
		};
	};


	["loadout", {
		// do nothing if player still has classname
		if (player hasWeapon "ACE_VMH3") exitWith {};

		// remove stick if its there, e.g. player dropped secondary
		private _stick = (player getVariable ["grad_defuseStickAttached", objNull]);
		if (!isNull _stick) then {
			call grad_defuseStickHandling_detach;
			// systemchat "loadout detach";
		};

	}] call CBA_fnc_addPlayerEventHandler;

	["weapon", {
		// only do work if player owns item
		if (player hasWeapon "ACE_VMH3") then {
			if (currentWeapon player == "ACE_VMH3") then {
				call grad_defuseStickHandling_detach;
				// systemchat "weapon detach";
			} else {
				call grad_defuseStickHandling_attach;
				// systemchat "weapon attach";	
			};
		};
	}] call CBA_fnc_addPlayerEventHandler;

};