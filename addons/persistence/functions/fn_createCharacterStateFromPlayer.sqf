#include "script_component.hpp"

params ["_player"];

private _uid = getPlayerUID player;
private _slot = _player getVariable [COOPR_KEY_SLOT, -1];
private _name = _player getVariable [COOPR_KEY_NAME, "<No Name Found>"];
private _money = _player getVariable [COOPR_KEY_MONEY, "<No Value Found>"];
private _role = _player getVariable [COOPR_KEY_ROLE, COOPR_ROLE_NONE];
private _reputation = _player getVariable [COOPR_KEY_REPUTATION, "<No Value Found>"];
private _state = _player getVariable [COOPR_KEY_STATE, COOPR_STATE_OK];
private _position = getPos _player;
private _loadout = getUnitLoadout _player;
private _deathTimestamp = _player getVariable [COOPR_KEY_DEATH_TIMESTAMP, 0];

DEBUG("mapping player variables to hash...");

[_uid,
 _slot,
 _name,
 _role,
 _reputation,
 _money,
 _position,
 _state,
 _deathTimestamp,
 _loadout] call coopr_fnc_createCharacterState;
