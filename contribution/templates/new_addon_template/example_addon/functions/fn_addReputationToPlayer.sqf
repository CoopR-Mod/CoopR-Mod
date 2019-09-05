#include "script_component.hpp"
/*
 * Author: HelpfulContributor
 *
 * This function will add reputation to a player
 *
 * Arguments:
 * 0: _reputation <NUMBER> - The amount of reputation the character should receive
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0] call coopr_fnc_addReputationToPlayer // on server side
 * [player, 0] remoteExec [coopr_fnc_addReputationToPlayer, 2] // on client side
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_player", objNull], ["_reputation", -1]];

// please use the fail fast principle and quit execution scope if somethings wrong
if (_player isEqualTo objNull) exitWith { ERROR("there was no player object given") };
if (_reputation isEqualTo -1) exitWith { ERROR("reputation amount was empty") };

INFO3("add %1 reputation to player %2", _reputation, _player); // add INFO logs where they make sense
private _currentReputation = _player getVariable [COOPR_CHAR_REPUTATION, 0];
DEBUG2("current reputation is %1", _currentReputation);
private _newAmount = _currentReputation + _reputation; // try to write as readable as you can - don't do oneliners
DEBUG2("new amount is %1", _newAmount); // try to add DEBUG logs where they make sense

_player setVariable [COOPR_CHAR_REPUTATION, _newAmount];
private _characterCoopRState = _player call coopr_fnc_serializeCoopR; // CoopR relevant variables are being extracted
_characterCoopRState call coopr_fnc_updateCharacter; // sync with local database or webservice (hidden detail)
