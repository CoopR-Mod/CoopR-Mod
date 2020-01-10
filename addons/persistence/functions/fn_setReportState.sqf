#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Sets the recon report to a given state
 *
 * Arguments:
 * 0: _characterId <NUMBER> - ID of the character the reports belongs to
 * 1: _state <BOOLEAN> - the state to set
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

params [["_characterId", -1],
        ["_state", objNull]];

if (isServer) then {
  if (_characterId isEqualTo -1) exitWith { ERROR("_characterId was not defined") };
  if (_state isEqualTo objNull) exitWith { ERROR("_state was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        call coopr_fnc_setReportStateLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
