#include "script_component.hpp"

//cutText ["", "BLACK OUT", 0.001];

private _oldPlayerUnit = player;
private _playerGroup = createGroup [west, true];
COOPR_LOBBY_AGENT = _playerGroup createUnit ["B_diver_TL_F", getPos COOPR_LOBBY, [], 0, "NONE"];
DEBUG("lobby agent was created");
deleteVehicle _oldPlayerUnit;

COOPR_LOBBY_AGENT setUnitLoadout EMPTY_LOADOUT;
COOPR_LOBBY_AGENT setPos getPos COOPR_LOBBY;
// to prevent lobby players from syncing
COOPR_LOBBY_AGENT setVariable [COOPR_KEY_PLAYER_LOGGEDIN, false, true];

DEBUG2("lobby agent for %1 spawned in lobby", getPlayerUID player);
