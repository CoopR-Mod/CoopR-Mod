#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a serialized mission to the persistence layer
 *
 * Arguments:
 * 0: _characterHash <ARRAY> - formatted as CBA hash
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_saveMission
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_serializedMission", []]];


if (isServer) then {

    if (_serializedMission isEqualTo []) exitWith { ERROR("_serializedMission was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        [_serializedMission] call coopr_fnc_saveMissionLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

