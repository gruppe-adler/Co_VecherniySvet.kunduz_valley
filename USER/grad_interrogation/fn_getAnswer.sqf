params ["_unit", "_type", "_gender"];

private _answer = "";

switch (_type) do {
	case "dontknow": { _answer = selectRandom (GRAD_INTERROGATION_SOUNDS_DONTKNOW_ + _gender); };
	case "stophurting": { _answer = selectRandom (GRAD_INTERROGATION_SOUNDS_STOPHURTING_ + _gender); };
	case "reveal": { _answer = _unit getVariable ["grad_interrogation_correctAnswer",  selectRandom (GRAD_INTERROGATION_SOUNDS_DONTKNOW_ + _gender)]; };
	default { };
};

_answer