#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Exectutes all necessary logic to clean up the former player character and spawn a lobby agent
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */

// setup lobby agent
private _playerGroup = createGroup [west, true];
COOPR_LOBBY_AGENT = _playerGroup createUnit ["B_diver_TL_F", getPos COOPR_LOBBY, [], 0, "NONE"];
DEBUG("lobby agent was created");
COOPR_LOBBY_AGENT setUnitLoadout EMPTY_LOADOUT;
// to prevent lobby players from syncing
COOPR_LOBBY_AGENT setVariable [COOPR_KEY_PLAYER_LOGGEDIN, false, true];

// remove old character
private _oldPlayerUnit = player;
selectPlayer objNull;
deleteVehicle _oldPlayerUnit;
hideObject _oldPlayerUnit;
DEBUG("old character has been destroyed");

COOPR_LOBBY_AGENT setPos getPos COOPR_LOBBY;
DEBUG2("lobby agent for %1 spawned in lobby", getPlayerUID player);
