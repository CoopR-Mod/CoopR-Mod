#include "..\constants.hpp"

params ["_player"];

LSTART("MAN SYNC");

if(!ALLOW_SYNC) exitWith {
    SLOG("syncing disabled");
    LEND("SYNC");
};

private _slot = _player getVariable [KEY_SLOT, -1];
private _characterState = _player call X11_fnc_createCharacterStateFromPlayer;
[getPlayerUID _player, _characterState, _slot] call X11_fnc_updateCharacter;
FFLOG("player %1 manually synced at slot %2", getPlayerUID _player, _slot);

SLOG("... syncing done.");
LEND("MAN SYNC");
_slot;

