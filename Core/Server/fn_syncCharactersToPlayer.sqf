#include "..\constants.hpp"

params ["_player"];

private _characterSlots = getPlayerUID _player call X11_fnc_getCharacterSlots;
private _ownerId =  owner _player;

FLOG("syncing character slots to player: %1", _characterSlots);
_player setVariable [KEY_PROFILE_FETCHED, _characterSlots, _ownerId];
