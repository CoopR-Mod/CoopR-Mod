#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Pushes one CoopR mission into the persisted mission queue on local
 *
 * Arguments:
 * 0: _cooprMission <CBA-HASH> - coopr mission as cba hash
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_cooprMission", []]];

if (isServer) then {
    if (_cooprMission isEqualTo []) exitWith { ERROR("_cooprMission was not defined") };
    if (not ([_cooprMission] call CBA_fnc_isHash)) exitWith { ERROR("_cooprMission has to be a cba hash"); };

    DEBUG("pushing coopr mission to mission queue");
    private _currentCount = [] call coopr_fnc_getQueuedMissionsCountLocal;
    [_cooprMission, COOPR_CHAR_MISSION_QUEUE_ID, _currentCount + 1] call CBA_fnc_hashSet;
    private _missionToQueue = format["INSERT INTO mission_queues VALUES(%1, %2, '%3')", _currentCount + 1, COOPR_SERVER_ID, _cooprMission];
    _missionToQueue call coopr_fnc_extDB3sql;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
