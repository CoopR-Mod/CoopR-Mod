#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Should check the reported SPOTREPS/RECONREPS for duplicates. If a player for instance marks an enemy fireteam
 * with static behaviour and right beneath that another one with the same report properties then this function will
 * remove the redundant report so avoid duplicated tasks.
 *
 * Arguments:
 * 0: _unit <OBJECT> - The unit from which the reports should be broadcasted. Needs to be a player
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_removeRedunantReports
 *
 * Public: No
 *
 * Scope: Server
 */

if (isServer) then {
    private _distinctedReports = [];

    if (count COOPR_RECON_REPORTS > 0) then {
        {
            DEBUG("checking spotRepA");
            private _spotRepA = _x;
            private _strengthA = [_spotRepB, "ALiVE_SYS_spotrep_size"] call CBA_fnc_hashGet;
            private _typeA = [_spotRepB, "ALiVE_SYS_spotrep_type"] call CBA_fnc_hashGet;
            // will turn i.e. "Mechanized Infantry - Mechanized Company HQ" into "MechanizedInfantry"
            _typeA = [_type splitString ":" select 0, " ", ""] call coopr_fnc_stringReplace;
            private _behaviourA = [_spotRepB, "ALiVE_SYS_spotrep_activity"] call CBA_fnc_hashGet;
            private _markerPositionA = [_spotRepB, "ALiVE_SYS_spotrep_markerposition"] call CBA_fnc_hashGet;

            {
                DEBUG("checking spotRepB");
                private _spotRepB = _x;
                private _strengthB = [_spotRepB, "ALiVE_SYS_spotrep_size"] call CBA_fnc_hashGet;
                private _typeB = [_spotRepB, "ALiVE_SYS_spotrep_type"] call CBA_fnc_hashGet;
                // will turn i.e. "Mechanized Infantry - Mechanized Company HQ" into "MechanizedInfantry"
                _typeB = [_type splitString ":" select 0, " ", ""] call coopr_fnc_stringReplace;
                private _behaviourB = [_spotRepB, "ALiVE_SYS_spotrep_activity"] call CBA_fnc_hashGet;
                private _markerPositionB = [_spotRepB, "ALiVE_SYS_spotrep_markerposition"] call CBA_fnc_hashGet;

                // Check if it's a similar report
                if (_strengthA isEqualTo _strengthB) then {
                    if (_typeA isEqualTo _typeB) then {
                        if (_behaviourA isEqualTo _behaviourB) then {

                        }
                    }
                }





            } forEach COOPR_RECON_REPORTS;
        } forEach COOPR_RECON_REPORTS;
    }

} else {
    SERVER_ONLY_ERROR;
};

