#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Pushes one CoopR mission into the persisted mission queue
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

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_cooprMission] call coopr_fnc_pushMissionQueueLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

