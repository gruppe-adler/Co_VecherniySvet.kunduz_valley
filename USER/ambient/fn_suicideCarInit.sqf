params ["_car"];

if (!isServer) exitWith {};

if (_car getVariable ["suicideCarInit", false]) exitWith {};
_car setVariable ["suicideCarInit", true, true];

_car setPilotLight false;
(driver _car) setBehaviour "CARELESS";
(driver _car) disableAI "LIGHTS" ;

{
    _x params ["_classname", "_offset", "_vector"];

    private _element = _classname createVehicle [0,0,0];
    _element attachTo [_car,_offset];
    _element setVectorDirAndUp _vector;

    if (_classname == "rhs_Flag_Insurgents") then {
        _element setFlagTexture "\UK3CB_Factions\addons\UK3CB_Factions_TKM\Flag\tkm_o_flag_co.paa";
    };

} forEach [
    ["MetalBarrel_burning_F",[0.352295,-0.548828,-0.3],[[0,1,0],[0,0,1]]],
    ["MetalBarrel_burning_F",[-0.200439,-0.584961,-0.3],[[0,1,0],[0,0,1]]],
    ["MetalBarrel_burning_F",[-0.11499,-1.18872,-0.3],[[-0.929888,0.367843,0],[0,0,1]]],
    ["MetalBarrel_burning_F",[0.307617,-1.85449,-0.3],[[0.999472,-0.0324877,0],[0,0,1]]],
    ["MetalBarrel_burning_F",[-0.401123,-1.82739,-0.3],[[0.0952993,-0.995449,0],[0,0,1]]],
    ["rhs_Flag_Insurgents",[-0.582275,0.484619,1.26717],[[0,1,0],[0,0,1]]]
];

private _source = createSoundSource ["prayer2", [0,0,0], [], 0];
[_source, _car, false] call grad_ambient_fnc_soundSourceHelper;

/*
{
  if (typeOf _x == "MetalBarrel_burning_F") then {
        _x inflame false;
    };
} forEach attachedObjects _car;
*/
