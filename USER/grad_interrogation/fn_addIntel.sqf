params [["_unit", objNull],["_chanceOfReveal", 0.1], ["_correctAnswer", ""], ["_answerSounds", []]];

_unit setVariable ["grad_interrogation_hasIntel", true, true];
_unit setVariable ["grad_interrogation_chanceOfReveal", _chanceOfReveal, true];
_unit setVariable ["grad_interrogation_correctAnswer", _correctAnswer, true];
_unit setVariable ["grad_interrogation_answerSounds", _answerSounds, true];

_unit setVariable ["grad_interrogation_answering", false, true];
_unit setVariable ["grad_interrogation_hasRevealed", false, true];
