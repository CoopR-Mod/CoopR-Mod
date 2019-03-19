#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Should check the reported SPOTREPS/RECONREPS for duplicates. If a player for instance marks an enemy fireteam
 * with static behaviour and right beneath that another one with the same report properties then this function will
 * remove the redundant report so avoid duplicated tasks.
 *
 * Arguments:
 * None
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
    DEBUG("removing similar reports...");
    private _distinctedReports = [];

    if (count COOPR_RECON_REPORTS > 0) then {
        {
            private _spotRepAIndex = _forEachIndex;
            if (_spotRepAIndex in _distinctedReports) then {
                DEBUG2("index %1 will be removed - skipping", _spotRepAIndex);
            } else {
                DEBUG2("comparing spotRep-%1", _spotRepAIndex);
                private _spotRepA = _x;
                private _strengthA = [_spotRepA, "ALiVE_SYS_spotrep_size"] call CBA_fnc_hashGet;
                private _typeA = [_spotRepA, "ALiVE_SYS_spotrep_type"] call CBA_fnc_hashGet;
                // will turn i.e. "Mechanized Infantry - Mechanized Company HQ" into "MechanizedInfantry"
                _typeA = [_typeA splitString ":" select 0, " ", ""] call coopr_fnc_stringReplace;
                private _behaviourA = [_spotRepA, "ALiVE_SYS_spotrep_activity"] call CBA_fnc_hashGet;
                private _markerPositionA = [_spotRepA, "ALiVE_SYS_spotrep_markerposition"] call CBA_fnc_hashGet;

                {
                    private _spotRepBIndex = _forEachIndex;
                    if (_spotRepBIndex isEqualTo _spotRepAIndex) then {
                        DEBUG2("skipping %1", _spotRepBIndex)
                    } else {
                        DEBUG2("with spotRep-%1", _forEachIndex);
                        private _spotRepB = _x;
                        private _strengthB = [_spotRepB, "ALiVE_SYS_spotrep_size"] call CBA_fnc_hashGet;
                        private _typeB = [_spotRepB, "ALiVE_SYS_spotrep_type"] call CBA_fnc_hashGet;
                        // will turn i.e. "Mechanized Infantry - Mechanized Company HQ" into "MechanizedInfantry"
                        _typeB = [_typeB splitString ":" select 0, " ", ""] call coopr_fnc_stringReplace;
                        private _behaviourB = [_spotRepB, "ALiVE_SYS_spotrep_activity"] call CBA_fnc_hashGet;
                        private _markerPositionB = [_spotRepB, "ALiVE_SYS_spotrep_markerposition"] call CBA_fnc_hashGet;

                        // Check if it's a similar report
                        if (_strengthA isEqualTo _strengthB) then {
                            if (_typeA isEqualTo _typeB) then {
                                if (_behaviourA isEqualTo _behaviourB) then {
                                    _distinctedReports pushBackUnique _spotRepBIndex;
                                }
                            }
                        }
                    };
                } forEach COOPR_RECON_REPORTS;
            };
        } forEach COOPR_RECON_REPORTS;
    };
    DEBUG2("removing following duplicates: %1", _distinctedReports);
    reverse _distinctedReports;
    { COOPR_RECON_REPORTS deleteAt _x; } forEach _distinctedReports;
    DEBUG("... done");
} else {
    SERVER_ONLY_ERROR;
};

