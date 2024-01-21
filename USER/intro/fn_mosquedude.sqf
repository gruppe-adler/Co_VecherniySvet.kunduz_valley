params ["_dude"];

_dude setUnitLoadout [[],  
        [],  
        [],  
        ["UK3CB_ADC_C_U_01_F",[]],  
        [],  
        [],"UK3CB_TKM_B_H_Turban_02_1","fsob_Beard01_Dark",["Binocular","","","",[],  
        [],""],  
        ["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]; 
doStop _dude; 
_dude setVariable ["lambs_danger_disableAI", true, true];

[_dude, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];
_dude disableAI "FSM";
_dude disableAI "MOVE";
_dude setCaptive true;
_dude disableAI "autoTarget";
_dude disableAI "ANIM";
_dude setCaptive true;

private _pfh = [{
	params ["_args", "_handle"];
	_args params ["_dude"];

	if (isNull _dude) exitWith {
		[_dude, "Acts_JetsMarshallingStop_out"] remoteExec ["switchMove"];
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	if (!alive _dude || lifeState _dude == "INCAPACITATED") exitWith {
		_dude setDamage 1;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	[_dude, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

}, 2, [_dude]] call CBA_fnc_addPerFrameHandler;
