params ["_position"];

// gets executed everywhere

private _nearestPhone = nearestObject [_position, "vn_b_prop_telephone_01"];

if (isNull _nearestPhone) exitWith { diag_log "didnt find phone"; };

_nearestPhone setVariable ["grad_answered", false, true];


private _ring = _nearestPhone say3D (selectRandom ["phoneRing1", "phoneRing2"]);

[{
	params ["_nearestPhone", "_ring"];

	_nearestPhone getVariable ["grad_answered", false]
},{
	params ["_nearestPhone", "_ring"];

	deleteVehicle _ring;

}, [_nearestPhone, _ring], 10] call CBA_fnc_waitUntilAndExecute;


private _action = _nearestPhone addAction
[
    "Answer phone",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

		_target say3D "garble_long";
		_target setVariable ["grad_answered", true, true];

    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "!(_target getVariable ['grad_answered', false])",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];

[{
	params ["_nearestPhone", "_action"];

	_nearestPhone removeAction _action;
	_nearestPhone setVariable ["grad_answered", false, true];

}, [_nearestPhone, _action], 5] call CBA_fnc_waitAndExecute;