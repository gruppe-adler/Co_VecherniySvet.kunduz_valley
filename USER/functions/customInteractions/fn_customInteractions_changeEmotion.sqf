params ["_unit"];

private _currentEmotion = _unit getVariable ["grad_SR_emotion", "none"];
private _newEmotion = "";

switch (_currentEmotion) do {
	case "fear": { _newEmotion = "seduce"; };
	case "seduce": { _newEmotion = "calm"; };
	case "calm": { _newEmotion = "fear"; };

	case "pleading": { _newEmotion = "angry"; };
	case "angry": { _newEmotion = "pleading"; };
	default { };
};

hint ("new emotion is now " + _newEmotion);

_unit setVariable ["grad_SR_emotion", _newEmotion, true];
