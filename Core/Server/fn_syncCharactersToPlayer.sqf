#include "..\constants.hpp"

params ["_player"];

LSTART("SYNC CHAR TO PLAYER");

private _characterSlots = getPlayerUID _player call X11_fnc_getCharacterSlots;
private _ownerId =  owner _player;
_player setVariable [KEY_PROFILE_FETCHED, _characterSlots, _ownerId];

LEND("SYNC CHAR TO PLAYER");
