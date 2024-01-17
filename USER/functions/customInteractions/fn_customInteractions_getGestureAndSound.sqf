params ["_type"];

private _return = [];

// gestures, sound suffix and amount of sounds available in format suffix_X, count starts at 1
private _greetGestures = [
	"GestureHi",
	"GestureHiB",
	"GestureHiC",
	"HandSignalFreeze"
];

private _approvalGestures = [
	"GestureYes",
	"GestureNod"
];

private _denialGestures = [
	"GestureNo"
];

private _phoneEar = [
	"radioAnims_Ear"
];

private _phoneStop = [
	"radioAnims_Stop"
];

private _carryStop = [
	"GestureEmpty"
];

private _carryStart = [
	"GestureAgonyCargo"
];

private _carryStop = [
	"GestureEmpty"
];

switch (_type) do {
	case "yes": { _return = _approvalGestures; };
	case "idontknow": { _return = _denialGestures; };
	case "no": { _return = _denialGestures; };
	case "phoneStart": { _return = _phoneEar; };
	case "phoneStop": { _return = _phoneStop; };
	case "greet": { _return = _greetGestures; };
	case "carryStart": { _return = _carryStart; };
	case "carryStop": { _return = _carryStop; };
	default { };
};


_return
