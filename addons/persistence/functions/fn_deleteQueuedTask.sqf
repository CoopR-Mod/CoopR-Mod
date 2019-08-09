#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Removes queued mission at given ID
 *
 * Arguments:
 * _id <NUMBER> - ID of queued coopr mission to be removed
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

params [["_id", -1]];


if (isServer) then {
    if (_id isEqualTo -1) exitWith { ERROR("_id was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_id] call coopr_fnc_deleteQueuedMissionLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

