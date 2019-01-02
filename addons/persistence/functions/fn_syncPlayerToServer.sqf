#include "script_component.hpp"

params [["_player", objNull]];

if(!ALLOW_SYNC) exitWith { INFO("syncing disabled"); };
if(isNull _player) exitWith { ERROR("player must not be objNull"); };

private _slot = _player getVariable [COOPR_KEY_SLOT, -1];
private _characterState = _player call coopr_fnc_createCharacterStateFromPlayer;
[getPlayerUID _player, _characterState, _slot] call coopr_fnc_updateCharacter;
_player call coopr_fnc_persistCharacter;

DEBUG3("player %1 manually synced at slot %2", getPlayerUID _player, _slot);
INFO("... syncing done.");
_slot;
