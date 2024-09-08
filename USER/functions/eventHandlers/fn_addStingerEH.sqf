params ["_unit"];

_unit addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if (!local _unit) exitWith {};
	if (_weapon isNotEqualTo "rhs_weap_fim92") exitWith {};
	
	private _tgt = missileTarget _projectile;
	if (isNull _initTgt) exitWith {};

	// disable missile guidance once too close
	[{
		params ["_projectile", "_tgt"];
		(_projectile distance _tgt) < 30
	},{
		params ["_projectile", "_tgt"];
		// disable damage in case the missile hits anyways
		[_tgt, false] remoteExecCall ["allowDamage", _tgt];
		[_projectile, [objNull, true]] remoteExecCall ["setMissileTarget", _projectile];
		
		// enable damage again, once the missile is destroyed
		[{
			params ["_projectile", "_tgt"];
			isNull _projectile
		},{
			params ["_projectile", "_tgt"];
			[_tgt, true] remoteExec ["allowDamage", _tgt];
		}, [_projectile, _tgt]] call CBA_fnc_waitUntilAndExecute;
	}, [_projectile, _tgt]] call CBA_fnc_waitUntilAndExecute;
}];
