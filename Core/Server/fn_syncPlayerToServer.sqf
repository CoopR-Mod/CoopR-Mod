#include "..\constants.hpp"

params ["_player"];

LSTART("MAN SYNC");

private _slot = _player getVariable [KEY_SLOT, -1];
private _characterState = _player call X11_fnc_createCharacterStateFromPlayer;
[getPlayerUID _player, _characterState, _slot] call X11_fnc_updateCharacter;
FFLOG("player %1 manually synced at slot %2", name _player, _slot);

SLOG("... syncing done.");
LEND("MAN SYNC");

