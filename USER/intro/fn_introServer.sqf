private _duration = 120;

// skiptime 3;
setTimeMultiplier 1;
skiptime -1.5;

[_duration] remoteExec ["grad_intro_fnc_intro_start", 0, true];



[{
	setTimeMultiplier 120;
}, [], 33] call CBA_Fnc_waitAndExecute;

// tractor
[{
	private _path = [];
	for "_i" from 1 to 17 do {
		private _marker = call(compile format ["GRAD_intro_path_%1", _i]);
		// private _speed = _marker getVariable ["VLF_speed", 9];
		// private _entry = (getPos _marker) + [_speed];
		private _entry = getPos _marker;
		_path pushBack _entry;
	};
	intro_tractor setDriveOnPath _path;
}, [], 50] call CBA_Fnc_waitAndExecute;

[{
	setTimeMultiplier 1;
}, [], 60] call CBA_Fnc_waitAndExecute;

