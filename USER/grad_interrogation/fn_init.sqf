GRAD_INTERROGATION_SOUNDS_DONTKNOW_MALE = [
	["male_dontaskmeinshallah_en", "male_dontaskmeinshallah_arab"],
	["male_dontaskmeinshallah_2_en", "male_dontaskmeinshallah_2_arab"],
	["male_dontaskmeinshallah_3_en", "male_dontaskmeinshallah_3_arab"],
	["male_idontknow_en", "male_idontknow_arab"],
	["male_idontknow_2_en", "male_idontknow_2_arab"],
	["male_idontknow_3_en", "male_idontknow_3_arab"]
];

GRAD_INTERROGATION_SOUNDS_STOPHURTING_MALE = [
	["male_leavemealoneiknownothing_en", "male_leavemealoneiknownothing_arab"],
	["male_sweartogod_en", "male_sweartogod_arab"],
	["male_pleasedonthurtme_en", "male_pleasedonthurtme_arab"],
	["male_pleasedonthurtme_2_en", "male_pleasedonthurtme_2_arab"],
	["male_pleasedonthurtme_3_en", "male_pleasedonthurtme_3_arab"]
];


["CAManBase", "init", {
	params ["_unit"];

	if (isPlayer _unit) exitWith {};

	[_unit] call grad_interrogate_fnc_addActions;

},  true, [], true] call CBA_addClassEventhandler;
