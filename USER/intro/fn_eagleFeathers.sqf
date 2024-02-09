params ["_position", ["_fullDestruction", false], ["_object", objNull]];


private _particleSource = "#particlesource" createVehicleLocal _position;
_particleSource setParticleParams
[	
	["insects\data\eaglefeather3d.p3d", 8, 3, 1],
	"",
	"SpaceObject",
	1,
	60,
	[0,0,0],
	[0,0,-0.25],
	1, 1.3, 1, 0,
	[3],
	[[1,1,1,1]],
	[1],
	0.01,
	0.08,
	"",
	"",
	_this,
	random 360,
	true,
	0.01
];

_particleSource setParticleRandom [
	0,
	[0,0,0],
	[2,2,3],
	0.01,
	1,
	[0,0,0,0],
	0.1,
	0.4,
	360,
	0
];

if (!isNull _object || !_fullDestruction) then {
	_particleSource setDropInterval 0.01;
} else {
	_particleSource setDropInterval 0.0001;
};


if (!isNull _object) then {
	[_particleSource, _object] spawn { 
		params ["_particleSource", "_object"];
		
		// attachto would reduce particle output due to reduced sim rate i guess
		[{
			params ["_args", "_handle"];
			_args params ["_particleSource", "_object"];
			
			if (isNull _particleSource) exitWith {
				[_handle] call CBA_fnc_removePerFrameHandler;
			};

			_particleSource setPosWorld getPosWorld _object;

		}, 0, [_particleSource, _object]] call CBA_fnc_addPerFrameHandler;

		sleep 15; deleteVehicle _particleSource;
	};
} else {
	[_particleSource] spawn { 
		params ["_particleSource"];
		_particleSource setDropInterval 0.0001;
		sleep 0.2; deleteVehicle _particleSource;
	};
};

if (!_fullDestruction) exitWith {};

private _source = "#particlesource" createVehicleLocal [0, 0, 0]; 
_source setPos _position; 
_source setParticleParams 
	[ 
		["\a3\data_f\particleEffects\universal\universal.p3d",16,8,48,0],"", 
		"billboard", 
		0, 
		0.5, 
		[0,0,0.5], 
		[0,0,3], 
		0,10.30,1,-0.1, 
		[0,1], 
		[[0.5,0,0,0.8],[0.3,0,0,0.8],[0.25,0,0,0.5],[0.15,0,0,0]], 
		[0.01], 
		0.01, 
		0.08, 
		"", 
		"", 
		_this, 
		0, 
		true, 
		0.5, 
		[[0.5,0,0,1]] 
	]; 
_source setDropInterval 1; 
 
 
// meat flowing around 
private _source2 = "#particlesource" createVehicleLocal [0, 0, 0];  
_source2 setPos _position;  
_source2 setParticleCircle [0, [0, 0, 0]];  
_source2 setParticleRandom [0, 
[1, 1, 0], [5, 5, 4], 0, 1, [0, 0, 0, 0.1], 0, 0];  
_source2 setParticleParams [
	["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
	[0, 0, 0.3], [2, 2, 5], 0.5, 200, 0.2, 0.075, [3], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
	[0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source2 setDropInterval 0.01; 
 
[{ 
	params ["_source"]; 
	deleteVehicle _source; 
}, [_source] ,0.5] call CBA_fnc_waitAndExecute; 
 
[{ 
	params ["_source2"]; 
	deleteVehicle _source2; 
}, [_source2] ,0.5] call CBA_fnc_waitAndExecute;