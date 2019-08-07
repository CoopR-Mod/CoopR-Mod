#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a serialized task to the persistence layer
 *
 * Arguments:
 * 0: _characterHash <ARRAY> - formatted as CBA hash
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_saveTask
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_serializedTask", []]];


if (isServer) then {

    if (_serializedTask isEqualTo []) exitWith { ERROR("_serializedTask was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_serializedTask] call coopr_fnc_saveTaskLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

