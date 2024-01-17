params ["_camera", ["_strength", 0.01], ["_duration", 0.7], ["_pos", []]];
if (isnull _camera) exitwith {};

private ["_strength","_duration","_timeStart","_time","_center","_radius"];

_center = _pos param [0,position _camera];
_center = _center call bis_fnc_position;
_radius = _pos param [1,0,[0]];

if (_camera distance _center > _radius) exitwith {false};

_timeStart = time;
_time = time + _duration;
_strengthLocalOld = 0;
while {time < _time && !isnull _camera} do {
    private ["_strengthLocal","_vectorDir"];
    _strengthLocal = linearconversion [0,_duration,time - _timeStart,_strength,0];
    if (_radius > 0) then {
        _strengthLocal = _strengthLocal * linearconversion [0,_radius,_camera distance _center,1,0];
    };
    if (_strengthLocalOld > 0) then {_strengthLocal = -_strengthLocal;};
    _vectorDir = vectordir _camera;
    _vectorDir set [2,(_vectorDir select 2) - _strengthLocalOld + _strengthLocal];
    _camera setvectordirandup [_vectorDir,vectorup _camera];
    _strengthLocalOld = _strengthLocal;
    sleep 0.05;
};
true