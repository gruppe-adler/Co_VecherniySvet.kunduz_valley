params ["_positions", []];

{
	private _ps1 = "#particlesource" createVehicleLocal _x;
	_ps1 setParticleParams [
		"\A3\Rocks_F\Blunt\BluntStone_03.p3d", "", "SpaceObject",
		1, 200, [0, 0, 30], [0, 0, -2], 1, 10, 1, 0.2, [.5, .5],
		[[1, 1, 1 ,1]],
		[0, 1], 1, 0, "", "", _ps1, random 360, true, 0];
	_ps1 setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, .25, [0, 0, 0, 0], 0, 0];
	_ps1 setDropInterval 0.04;

	[{
		deleteVehicle _this;
	}, _ps1, 10 + random 3] call CBA_fnc_waitAndExecute;

} forEach _positions;