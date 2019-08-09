#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a serialized mission to the local database
 *
 * Arguments:
 * 0: _serializedMission <ARRAY> - mission details as array
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_saveMissionLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_serializedMission", []]];

if (isServer) then {
    if (_serializedMission isEqualTo []) exitWith { ERROR("_serializedMission was not defined") };
    if ((count _serializedMission) != 4 ) exitWith { ERROR("_serializedMission array format was wrong") };

    INFO("updating mission...");
    private _missionId = _serializedMission select 0;
    private _updateMission = format["REPLACE INTO missions VALUES('%1', '%2')", _missionId, _serializedMission];
    _updateMission call coopr_fnc_extDB3sql;

    INFO2("mission %1 updated ", _missionId);
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
