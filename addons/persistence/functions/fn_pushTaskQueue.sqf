#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Pushes one CoopR task into the persisted task queue
 *
 * Arguments:
 * 0: _cooprTask <CBA-HASH> - coopr task as cba hash
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

params [["_cooprTask", []]];

if (isServer) then {
    if (_cooprTask isEqualTo []) exitWith { ERROR("_cooprTask was not defined") };
    if (not ([_cooprTask] call CBA_fnc_isHash)) exitWith { ERROR("_cooprTask has to be a cba hash"); };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_cooprTask] call coopr_fnc_pushTaskQueueLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR;
};

