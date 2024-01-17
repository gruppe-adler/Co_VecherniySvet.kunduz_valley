params ["_unit"];

if (uniform _unit == "woman2") then {
	_unit addUniform "Burqa6";

	hint "black bag applied";
} else {
	_unit setObjectTextureGlobal [0, "data\hooker_custom.paa"];
	_unit addUniform "woman2";
	[_unit, "max_female8"] remoteExec ["setFace", [0,-2] select isDedicated, _unit];

	hint "feeling sexy now";
};
