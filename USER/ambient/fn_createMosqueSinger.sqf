params ["_position"];


private _minarets = nearestObjects [_position, ["Jbad_A_Minaret", "Jbad_A_Minaret_porto"], 50];

if (count _minarets > 0) then {

        private _minaret = _minarets#0;

        private _buildingPositions = [_minaret] call BIS_fnc_buildingPositions;

        private _posIndex = 0;
        private _highestPos = 0;

        {
            if (_x#2 > _highestPos) then {
                    _posIndex = _foreachindex;
                    _highestPos = _x#2;
            };
        } forEach _buildingPositions;



        private _unit = (createGroup civilian) createUnit ["CUP_C_TK_Man_04", [0,0,0], [], 0, "NONE"];
        _unit setPos (_buildingPositions select _posIndex);
        
        doStop _unit;
        _unit setVariable ["lambs_danger_disableAI", true, true];

        _unit setDir ((_unit getDir _minaret) - 180);


        private _source = createSoundSource ["prayer2", getPos _unit, [], 0];
        [_source, _unit, false] call grad_ambient_fnc_soundSourceHelper;

        [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

        _unit disableAI "FSM";
        _unit disableAI "MOVE";
        _unit setCaptive true;
        _unit disableAI "autoTarget";
        _unit disableAI "ANIM";
        _unit setCaptive true;

        _unit addHeadgear "CUP_H_TKI_Lungee_Open_04";

        private _pfh = [{
            params ["_args", "_handle"];

            if (!alive _unit || lifeState _unit == "INCAPACITATED") exitWith {
                _unit setDamage 1;
                [_handle] call CBA_fnc_removePerFrameHandler;
            };
            [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

        }, 2, [_unit]] call CBA_fnc_addPerFrameHandler;

};