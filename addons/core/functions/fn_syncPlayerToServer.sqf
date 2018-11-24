#include "script_component.hpp"

params [["_player", objNull]];

LSTART("PLAYER SYNC");

if(!ALLOW_SYNC) exitWith {
    SLOG("syncing disabled");
    LEND("SYNC");
};

if(isNull _player) exitWith {
  ERROR("player must not be objNull");
};

private _slot = _player getVariable [KEY_SLOT, -1];
private _characterState = _player call coopr_fnc_createCharacterStateFromPlayer;
[getPlayerUID _player, _characterState, _slot] call coopr_fnc_updateCharacter;
FFLOG("player %1 manually synced at slot %2", getPlayerUID _player, _slot);

SLOG("... syncing done.");
LEND("PLAYER SYNC");
_slot;


