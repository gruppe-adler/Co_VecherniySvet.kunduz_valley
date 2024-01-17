/*
    Author: Karel Moricky

    Description:
    Show feedback message when illegal operation is attempted in curator interface

    Parameter(s):
        0: OBJECT - curator
        1: NUMBER or STRING - error ID or message to be displayed

    Returns:
    BOOL
*/

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

params ["_message", "_color"];

disableserialization;
private ["_display","_ctrlMessage"];
_display = finddisplay IDD_RSCDISPLAYCURATOR;
_ctrlMessage = _display displayctrl IDC_RSCDISPLAYCURATOR_FEEDBACKMESSAGE;
_ctrlMessage ctrlSetBackgroundColor _color;
_ctrlMessage ctrlsettext _message;
_ctrlMessage ctrlsetfade 1;
_ctrlMessage ctrlcommit 0;
_ctrlMessage ctrlsetfade 0;
_ctrlMessage ctrlcommit 0.1;

// dont overlap runs
if !(isnil "BIS_fnc_moduleCurator_feedbackMessage") then {terminate BIS_fnc_moduleCurator_feedbackMessage;};
BIS_fnc_moduleCurator_feedbackMessage = [_ctrlMessage] spawn {
    disableserialization;
    uisleep 3;
    _ctrlMessage = _this select 0;
    _ctrlMessage ctrlsetfade 1;
    _ctrlMessage ctrlcommit 0.5;
    uiSleep 0.5;
    _ctrlMessage ctrlSetBackgroundColor [0,0,0,0]; // reset color
    _ctrlMessage ctrlcommit 0;
};
true
