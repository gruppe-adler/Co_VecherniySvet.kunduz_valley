params ["_helper"];

_helper addAction
[
    "Move Rug",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        private _rug = _target getVariable ["EL_rug", objNull];

        _rug setPos (_rug getPos [1, random 360]);
        systemChat "nothing";

        _target setVariable ["EL_rugMoved", true, true];
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    false,       // hideOnUse
    "",         // shortcut
    "!(_target getVariable ['EL_rugMoved', false])",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];