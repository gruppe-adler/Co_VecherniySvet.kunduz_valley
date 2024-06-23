GRAD_INTERROGATION_SOUNDS_DONTKNOW_MALE = [
	["male_dontaskmeinshallah_en", "male_dontaskmeinshallah_arab"],
	["male_dontaskmeinshallah_2_en", "male_dontaskmeinshallah_2_arab"],
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

GRAD_INTERROGATION_SOUNDS_DONTKNOW_FEMALE = [
	["female_dontaskmeinshallah_en", "female_dontaskmeinshallah_arab"],
	["female_dontaskmeinshallah_2_en", "female_dontaskmeinshallah_2_arab"],
	["female_idontknow_en", "female_idontknow_arab"],
	["female_idontknow_2_en", "female_idontknow_2_arab"],
	["female_idontknow_3_en", "female_idontknow_3_arab"]
];

GRAD_INTERROGATION_SOUNDS_STOPHURTING_FEMALE = [
	["female_leavemealoneiknownothing_en", "female_leavemealoneiknownothing_arab"],
	["female_sweartogod_en", "female_sweartogod_arab"],
	["female_pleasedonthurtme_en", "female_pleasedonthurtme_arab"],
	["female_pleasedonthurtme_2_en", "female_pleasedonthurtme_2_arab"],
	["female_pleasedonthurtme_3_en", "female_pleasedonthurtme_3_arab"]
];


["CAManBase", "init", {
	params ["_unit"];

	if (isPlayer _unit) exitWith {};
	if (side _unit != civilian) exitWith {};

	[_unit] call grad_interrogation_fnc_addactions;

	if (isServer) then {
		_unit setVariable ["lambs_danger_disableAI", true, true];
	};

},  true, [], true] call CBA_fnc_addClassEventhandler;
