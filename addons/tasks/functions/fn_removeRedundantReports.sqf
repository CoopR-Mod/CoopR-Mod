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
            private _entryAIndex = _forEachIndex;
            if (_entryAIndex in _distinctedReports) then {
                DEBUG2("index %1 will be removed - skipping", _entryAIndex);
            } else {
                DEBUG2("comparing entry-%1", _entryAIndex);
                private _entryA = _x;
                private _typeA = [_entryA, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
                private _strengthA = [_entryA, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
                private _behaviourA = [_entryA, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
                private _markerA = [_entryA, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;

                {
                    private _entryAIndex = _forEachIndex;
                    if (_entryAIndex isEqualTo _entryAIndex) then {
                        DEBUG2("skipping %1", _entryAIndex)
                    } else {
                        DEBUG2("with entry-%1", _forEachIndex);
                        private _entryB = _x;
                        private _typeB = [_entryB, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
                        private _strengthB = [_entryB, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
                        private _behaviourB = [_entryB, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
                        private _markerB = [_entryB, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;

                        // Check if it's a similar report
                        if (_strengthA isEqualTo _strengthB) then {
                            if (_typeA isEqualTo _typeB) then {
                                if (_behaviourA isEqualTo _behaviourB) then {

                                    _distinctedReports pushBackUnique _entryAIndex;
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

