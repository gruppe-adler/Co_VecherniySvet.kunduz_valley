private _duration = 120;

// skiptime 3;
setTimeMultiplier 1;
skiptime -1.5;

[_duration] remoteExec ["grad_intro_fnc_intro_start", 0, true];

introMarker_1 hideObjectGlobal true;
introMarkerTarget_1 hideObjectGlobal true;

introMarker_2 hideObjectGlobal true;
introMarkerTarget_2 hideObjectGlobal true;

introMarker_3 hideObjectGlobal true;
introMarkerTarget_3 hideObjectGlobal true;

introMarker_4 hideObjectGlobal true;
introMarkerTarget_4 hideObjectGlobal true;

[{
	setTimeMultiplier 120;
}, [], 35] call CBA_Fnc_waitAndExecute;

[{
	setTimeMultiplier 1;
}, [], 55] call CBA_Fnc_waitAndExecute;

