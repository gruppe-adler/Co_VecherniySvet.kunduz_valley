params ["_house"];


// condition = "((this animationSourcePhase 'Rug_source') < 0.5)";
// condition = "((this animationSourcePhase 'Door_1_source') < 0.5)";
// statement = "(this animateSource ['Door_1_source', 1])";

// "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' /> 


_house addAction
[
    "Move Rug",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        _target setVariable ["bis_disabled_Door_2", 0, true];
        _target setVariable ["bis_disabled_Door_3", 0, true];
        _target animateSource ["Door_2_source", 1];
        _target animateSource ["Door_3_source", 1];
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "(_target animationPhase 'Door_2_source') == 0",     // condition
    3,         // radius
    false,      // unconscious
    "door_2",         // selection
    ""          // memoryPoint
];


// "Land_jbad_House2_basehide
/*
displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";

_house addAction
[
    "Open Door",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        _target animateSource ["Door_2_source", 1];
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "(_target animationPhase 'Door_2_source') == 0",     // condition
    50,         // radius
    false,      // unconscious
    "",         // selection
    "door_2"          // memoryPoint
];
*/

/*
private _pos2 = _house modelToWorld (_house selectionPosition "door_2");
private _dummyForAction2 = "Sign_Sphere100cm_F" createVehicleLocal [0,0,0];
_dummyForAction2 setPos _pos2;

_dummyForAction2 setVariable ["connectedHouse", _house, true];

_dummyForAction2 addAction
[
    "Move rug",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script
        _arguments params ["_house"];

        _house animateSource ["Rug_source", 1];
    },
    [_house],        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "((_originalTarget getVariable ['connectedHouse', objNull]) animationPhase 'Rug_source') == 0",     // condition
    50,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];


*/