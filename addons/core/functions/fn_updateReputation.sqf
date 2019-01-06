#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Increases/updates the reputation of a character by the given amount
 *
 * Arguments:
 * 0: _reputation <NUMBER> - amount to increase the reputation
 *
 * Return Value:
 * None
 *
 * Example:
 * 10 call coopr_fnc_updateReputation;
 *
 * Public: No
 *
 * Scope: Client
 */

params ["_reputation"];

private _currentReputation = player getVariable [COOPR_KEY_REPUTATION, 0];
private _charSlot = player getVariable [COOPR_KEY_SLOT, -1];
player setVariable [COOPR_KEY_REPUTATION, _currentReputation + _reputation];

player call coopr_fnc_updateState;
[player call coopr_fnc_serializeCoopR] remoteExec ["coopr_fnc_updateCharacter", EXEC_SERVER];
