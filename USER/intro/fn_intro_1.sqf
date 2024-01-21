/*

    SCENE 1 - stars destroyed mosque

    musical intro

*/


_camera camPreparePos (getPos introMarker_1_2);

private _vectorDir = vectorDir introMarker_1_2;
private _vectorUp = vectorUp introMarker_1_2;
private _newVector = [_vectorDir, _vectorUp];
private _duration = 18;
private _delay = 1;
_camera camCommitPrepared (_duration + _delay);

[_camera, _newVector, _duration, 3] call GRAD_INTRO_fnc_camTilt;

[{
    params ["_camera"];
    [_camera] call grad_intro_fnc_intro_2;
}, [_camera], _duration] call CBA_fnc_waitAndExecute;


// tilting cam
// grad_introCam_tilt = {
//     params ["_camera", "_newVector", "_duration"];
	
//     private _oldVectorDir = vectorDir _camera;
//     private _oldVectorUp =  vectorUp _camera;
//     _newVector params ["_newVectorDir","_newVectorUp"];
//     private _initTime = diag_tickTime;

//     private _tiltPFH = [{
//         params ["_args", "_handle"];
//         _args params [
//             "_oldVectorDir", 
//             "_oldVectorUp", 
//             "_newVectorDir", 
//             "_newVectorUp", 
//             "_initTime", 
//             "_duration", 
//             "_camera"
//         ];

//         if (diag_tickTime > _initTime + _duration) exitWith {
//             [_handle] call CBA_fnc_removePerFrameHandler;
// 			[_camera] call grad_intro_fnc_intro_2;
//         };

//         // systemchat ("rotating cam.." + str _oldVectorDir + " " + str _oldVectorUp + str _newVectorDir + " " + str _newVectorUp);

//         private _progress = (diag_tickTime - _initTime) / _duration;
// 		private _vectorDirActual = [_oldVectorDir, _newVectorDir, _progress, 2] call BIS_fnc_easeInOutVector;
// 		private _vectorUpActual = [_oldVectorUp, _newVectorUp, _progress, 2] call BIS_fnc_easeInOutVector;
		
		
//         // systemchat ("rotating cam.." + str _oldVectorDir + " " + str _oldVectorUp + " " + str _newVectorDir + " " + str _newVectorUp + " " + str _progress);

//         _camera setVectorDir _vectorDirActual;
//         _camera setVectorUp _vectorUpActual;

//     }, 0, [_oldVectorDir, _oldVectorUp, _newVectorDir, _newVectorUp, _initTime, _duration, _camera]] call CBA_fnc_addPerFrameHandler;
// };
