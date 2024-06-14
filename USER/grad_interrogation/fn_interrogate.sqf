params ["_unit"];

private _hasIntel = _unit getVariable ["grad_interrogation_hasIntel", false];
private _chanceOfReveal = _unit getVariable ["grad_interrogation_chanceOfReveal", 0];
private _injured = _unit call ACE_medical_ai_fnc_isInjured;

if (_injured) then {
	_chanceOfReveal*3;
};

private _gender = if (_unit isKindOf "") then { "FEMALE" } else { "MALE" };
private _willReveal = random 1 > _chanceOfReveal;
private _hasRevealed = _unit getVariable ["grad_interrogation_hasRevealed", false];

if (_hasIntel) then {
	if (_willReveal || _hasRevealed) then {
		private _answer = [_unit, "reveal", _gender] call grad_interrogation_fnc_getAnswer;
		[_unit, _answer] remoteExec ["grad_interrogation_fnc_answer"];
	} else {
		if (_injured) then {
			private _answer = [_unit, "stophurting", _gender] call grad_interrogation_fnc_getAnswer;
			[_unit, _answer] remoteExec ["grad_interrogation_fnc_answer"];
		} else {
			private _answer = [_unit, "dontknow", _gender] call grad_interrogation_fnc_getAnswer;
			[_unit, _answer] remoteExec ["grad_interrogation_fnc_answer"];
		};
	};
} else {
	private _answer = [_unit, "dontknow", _gender] call grad_interrogation_fnc_getAnswer;
	[_unit, _answer] remoteExec ["grad_interrogation_fnc_answer"];
};

