/*

	based on monsoon script by alias, optimized for MP and CBA and tweaked by nomisum

*/

// [180] execVM "USER\AL_monsoon\rain_nomi.sqf";
// direction, duration

params ["_direction"];

grad_rain_nextThunder = 30;
grad_rain_nextBlow = 60;
grad_rain_waterHeight = 3.2;

grad_rain_active = true;
publicVariable "grad_rain_active";

// set for all
[  
	"data\rainnormal_ca.paa", 
	4, 
	.001, 
	30, 
	0.05, 
	70, 
	0.2, 
	0.05, 
	0.05, 
	0.8, 
	[0.101961, 
	0.101961, 
	0.101961, 
	0.9], 
	0.1, 
	0.1, 
	0, 
	0.3, 
	false, 
	false 
] call BIS_fnc_setRain;

// todo give server control
// 1 setfog 1; 
// 0 setovercast 1; 
// 0 setrain 1;  
// forceWeatherChange; 

grad_rain_fnc_mainLoop = {
	params ["_direction"];

	private _grad_rain_originalValues = [
		overcast, fog, rain, lightnings, wind
	];

	private _startTime = CBA_missionTime;
	private _fadeTime = 300;

	
	_fadeTime setOvercast 1;
	_fadeTime setWindStr 5;
	_fadeTime setWindDir _direction;
	_fadeTime setRain 1;

	[	{ rain > 0.3 },
		{ 
			_this setLightnings 1;
		[] remoteExec ["grad_rain_fnc_initLocalEffects"]; },
		_fadeTime
	] call CBA_fnc_waitUntilAndExecute;



	[{
		params ["_args", "_handle"];
		_args params ["_startTime", "_fadeTime", "_grad_rain_originalValues"];

		// tie fog to rain value, as rain is better managable
		private _fog = rain;
		1 setFog (_fog min 0.7);

		if (!grad_rain_active) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;

			// restore original values after rain
			_grad_rain_originalValues params ["_overcast", "_fog", "_rain", "_lightnings", "_wind"];

			_fadeTime/60 setFog _fog;
			_fadeTime/60 setRain 0;
			_fadeTime/60 setLightnings _lightnings;
			setWind [_wind select 0, _wind select 1, true];
			_fadeTime/60 setOvercast 0.4;

		};

		if (grad_rain_nextThunder < CBA_missionTime) then {
			private _intesity = linearConversion [0, 1, rain, 60, 10, true]; // 60 seconds for no rain, 10 seconds for full rain
			grad_rain_nextThunder = CBA_missionTime + random _intensity + random _intensity;
			private _randomPlayer = selectRandom (playableUnits + switchableUnits);
			private _randomPos = _randomPlayer getRelPos [700+random 1300, 360];

			private _sound = ["01_far","02_far","03_far","04_far","05_far","06_far","07_far","08_far","09_far","10_far","11_far","12_far","13_far","14_far","16_far","17_far","18_far","19_far","20_far","21_far","22_far","23_far","24_far","25_far","26_far","27_far"];
			private _flickerCount = floor (1+random 3);
			private _type = selectRandom ["light","light","light","light","sound","sound_light"];

			if (rain > 0.3) then {
				[_randomPos, _type, _flickerCount, _sound] remoteExec ["grad_rain_fnc_thunder"];
			};
		};

		/*
		if (grad_rain_nextBlow < CBA_missionTime) then {
			grad_rain_nextBlow = CBA_missionTime + random 60 + random 120;

			private _randomPlayer = selectRandom (playableUnits + switchableUnits);
			private _objectCandidates = nearestObjects [_randomPlayer, [], 50];
			private _objectsFound = [];	
			{	
				if((_x isKindOf "LandVehicle") or (_x isKindOf "Man") or (_x isKindOf "Air")) then {_objectsFound pushBack _x};
			} foreach _objectCandidates;
			
			if (rain > .3) then {
				if (count _objectsFound > 0) then { [selectRandom _objectsFound] call grad_rain_fnc_blowObject; };
			};
		};
		*/

	}, 1, [_startTime, _fadeTime, _grad_rain_originalValues]] call CBA_fnc_addPerFrameHandler;
};


grad_rain_fnc_initLocalEffects = {
	[] call grad_rain_fnc_loopLocal;
	[] call grad_rain_fnc_drops;
	[true, true] call grad_rain_fnc_debris;
};





// local FX
grad_rain_fnc_loopLocal = {
	grad_rain_bgSoundTimeout = 0;

	[{
		params ["_args", "_handle"];
		_args params [""];

		if (!grad_rain_active) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		if (rain > 0.3 && CBA_missionTime > grad_rain_bgSoundTimeout) then {
			grad_rain_bgSoundTimeout = CBA_missionTime + 60;
			playSound "bcg_wind";
		};		

	}, 1, []] call CBA_fnc_addPerFrameHandler;
};






// global FX 
grad_rain_fnc_blowObject = {
	params ["_object"];

	private _sound = selectRandom ["rafala_1","rafala_2","rafala_4_dr","rafala_5_st","rafala_6","rafala_7","rafala_8","rafala_9"];
	

	private _playersNear = [];

	{
		if (_object distance _x < 100) then {
			if (isNull objectParent _x) then {
				[_sound] remoteExec ["playSound", _x];
				[] remoteExec ["grad_rain_fnc_camShake", _x];
			};
		};
	} forEach (switchableUnits + playableUnits);
	
	[_object] spawn {
		params ["_object"];

		private _windDir = windDir;
		private _windStrength = windStr;

		private _xblow= 0.1 + random 5;
		private _yblow= 0.1 + random 5;
		
		private _xx = 0;
		private _yy = 0;
		while {(_xx< _xblow) or (_yy< _yblow)} do {
			_object setvelocity [_xx*(sin _windDir * _windStrength),_yy*(cos _windDir * _windStrength),random -1];
			_xx = _xx + 0.01;
			_yy = _yy + 0.01;
			sleep 0.01; //0.0001 + random 0.01;
		};
	};
};



// local FX
grad_rain_fnc_drops = {
	private _helperSphere = "Sign_Sphere200cm_F" createVehiclelocal [0,0,0];
	_helperSphere setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];

	private _rain_drops_eff = "#particlesource" createVehicleLocal position player;
	_rain_drops_eff setParticleCircle [10, [0, 0, 0]]; 
	_rain_drops_eff setParticleRandom [0.2,[20,20,0],[0,0,0.5],13,0.5,[0,0,0,0.5],1,0]; 
	_rain_drops_eff setParticleParams [["\A3\Data_F_Mark\ParticleEffects\Universal\waterBallonExplode_01",4,0,16,0],"","Billboard",1,0.4,[0,0,30],[0,0,1],0,18,7,0,[0.05,0.6*rain],[[0.5,0.5,0.5,1],[0.5,0.5,0.5,1]],[1.5],1,0,"","", _helperSphere,0,true];  
	_rain_drops_eff setDropInterval 0.002;

	[{
		params ["_args", "_handle"];
		_args params ["_helperSphere", "_rain_drops_eff"];

		_helperSphere setposATL positionCameraToWorld [0,2,20];
		_rain_drops_eff setParticleParams [["\A3\Data_F_Mark\ParticleEffects\Universal\waterBallonExplode_01",4,0,16,0],"","Billboard",1,0.4,[0,0,30],[0,0,1],0,18,7,0,[0.05,0.5*rain],[[0.5,0.5,0.5,1],[0.5,0.5,0.5,1]],[1.5],1,0,"","", _helperSphere,0,true]; 
		_rain_drops_eff setDropInterval (linearConversion [0, 1, rain, 0.002, 0.0005]);

		if (!grad_rain_active) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			deleteVehicle _rain_drops_eff;
			deleteVehicle _helperSphere;
		};
	}, 0, [_helperSphere, _rain_drops_eff]] call CBA_fnc_addPerFrameHandler;	
};


// local FX
grad_rain_fnc_debris = {
	params ["_debris_branches","_rain_fog"];

	private _leavesEffect = objNull;
	private _rainEffect = objNull;

	private _effect_screen = ppEffectCreate ["FilmGrain", 2000]; 
	_effect_screen ppEffectEnable true;
	_effect_screen ppEffectAdjust [0.1,0.1,0.5,0.1,0.1,true];
	_effect_screen ppEffectCommit 0;

	if (_debris_branches) then {
	_leavesEffect  = "#particlesource" createVehicleLocal (getposasl vehicle player);
	if (vehicle player != player) then {_leavesEffect attachto [vehicle player];} else {_leavesEffect attachto [player];};
		_leavesEffect setParticleCircle [100,[0,0,0]];
		_leavesEffect setParticleRandom [25,[50,50,10],[4,4,0],2,1,[0,0,0,0.5],1,0];
		_leavesEffect setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks_Green", 1, 1, 1], "", "SpaceObject", 1,30,[0,0,0],[50,50,0],2,10,1,0.1,[0.1+random 1,1],[[0.68,0.68,0.68,1],[0.68,0.68,0.68,1]],[1.5,1],1,0,"","",vehicle player,0,true,1,[[0,0,0,0]]];
	};
	
	if (_rain_fog) then {
		_rainEffect = "#particlesource" createVehicleLocal (getposasl vehicle player); 
		if (vehicle player != player) then {
			_rainEffect attachto [vehicle player];
		} else {
			_rainEffect attachto [player];
		};
		_rainEffect setParticleCircle [50, [3, 3, 0]];
		_rainEffect setParticleRandom [5,[20,20,0],[1,1,0],1,1,[0,0,0,0.1],1,0];
		_rainEffect setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,10,[0,0,0],[-1,-1,0],3,10,7.9,0.1,[10,20,50],[[1,1,1,0],[1,1,1,0.03],[1,1,1,0]],[0.08],1, 0, "", "", vehicle player];
	};
	
	// randomize drop over time
	[{
		params ["_args", "_handle"];
		_args params ["_leavesEffect", "_rainEffect"];

		if (!isNull _leavesEffect) then {
			private _leavesEffect_drop = 5+random 10; 
			_leavesEffect setDropInterval _leavesEffect_drop;
		};

		if (!isNull _rainEffect) then {
			private _rainEffect_drop = 0.01+random 0.05; 
			_rainEffect setDropInterval _rainEffect_drop;
		};

		if (isNull _leavesEffect && isNull _rainEffect) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	}, 1, [_leavesEffect, _rainEffect]] call CBA_fnc_addPerFrameHandler;

	// remove effect after rain
	[{
		!grad_rain_active
	},
	{
		params ["_effect_screen"];
		
		if (_debris_branches) then {deletevehicle _leavesEffect};
		if (_rain_fog) then {deletevehicle _rainEffect};

		_effect_screen ppEffectEnable false;
		ppEffectDestroy _effect_screen;
		enableCamShake false;
	}, [_effect_screen]] call CBA_fnc_waitUntilAndExecute;
	
};

// local FX
grad_rain_fnc_camShake = {
		enableCamShake true;
		addCamShake [1,27,17];
};


// local FX
grad_rain_fnc_thunder = {
	params ["_position","_type","_flickerCount","_sound"];

	private _lightningDummy = "Land_HelipadEmpty_F" createVehicleLocal [_position#0,_position#1,(getPosATL player select 2)+800];

	if ((_type=="sound_light") or (_type=="light")) then 
	{
		if (sunOrMoon==0) then 
		{
			if (player distance _lightningDummy< 4000) then 
			{
				private _cloud = "#particlesource" createVehicleLocal getPosATL _lightningDummy;
				_cloud setParticleCircle [0,[0,0,0]];
				_cloud setParticleRandom [0, [1500, 1500, 100], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
				_cloud setParticleParams[["\A3\data_f\cl_basic", 1, 0, 1],"","Billboard",1,3,[0,0,800],[0,0,50],3,10,7.9,0.2,[400,450,500],[[0.1,0.1,0.5,0],[1,1,1,0.005],[0,0,0.5,0]],[0,0],0,0,"","",_lightningDummy];
				_cloud setDropInterval 0.002;
				
				[{ deleteVehicle _this; }, _cloud, 1] call CBA_fnc_waitAndExecute;
				
			};
		
			private _lightningLight = "#lightpoint" createvehiclelocal getPosATL _lightningDummy;
			_lightningLight attachto [_lightningDummy,[0,0,200]];
			_lightningLight setLightDayLight true;
			_lightningLight setLightUseFlare false;
			_lightningLight setLightFlareSize 0;
			_lightningLight setLightFlareMaxDistance 2000;	
			_lightningLight setLightAmbient[0.3,0.3,0.6];
			_lightningLight setLightColor[0.2,0.2,0.2];

			_lightningLight setLightAttenuation [0,0,0,0,0,900];  
			_lightningLight setLightIntensity 200;
			_lightningLight setLightBrightness 100+random 50;

			for "_i" from 1 to _flickerCount do { 
				[{ _this setLightBrightness 30 + random 30; }, _lightningLight , 0.1*_i] call CBA_fnc_waitAndExecute;
				[{ _this setLightBrightness 100+random 100; }, _lightningLight , 0.2*_i] call CBA_fnc_waitAndExecute;
				[{ _this setLightBrightness 30; }, _lightningLight , 0.3*_i] call CBA_fnc_waitAndExecute;
				[{ _this setLightBrightness 150 + random 50; }, _lightningLight , 0.4*_i] call CBA_fnc_waitAndExecute;

				for "_i" from 1 to 10 do { 
					[{ 
						_this setLightIntensity 0; 
						_lightningLight setLightBrightness _lightningIntensity/_i; 
					}, 
					_lightningLight , _flickerCount + 0.1*_i] call CBA_fnc_waitAndExecute;
				};
			};

			private _sound_delay = (player distance _lightningDummy)/350;
			sleep _sound_delay;

			if ((_type=="sound") or (_type=="sound_light"))then {playsound _sound};

			[{ deleteVehicle _this;}, _lightningDummy, 30] call CBA_fnc_waitAndExecute;
			[{ deleteVehicle _this;}, _lightningLight, 30] call CBA_fnc_waitAndExecute;
			
		};
	};
};

if (isServer) then {
	[_direction] call grad_rain_fnc_mainLoop;
};