#include "script_component.hpp"

params ["_player"];

private _uid = getPlayerUID player;
private _slot = _player getVariable [KEY_SLOT, -1];
private _name = _player getVariable [KEY_NAME, "<No Name Found>"];
private _money = _player getVariable [KEY_MONEY, "<No Value Found>"];
private _class = _player getVariable [KEY_CLASS, CLASS_NONE];
private _reputation = _player getVariable [KEY_REPUTATION, "<No Value Found>"];
private _prisoner = _player getVariable [KEY_IS_PRISONER, false];
private _prisonTime = _player getVariable [KEY_PRISON_START, 0];
private _state = _player getVariable [KEY_STATE, STATE_OK];
private _position = getPos _player;
private _loadout = getUnitLoadout _player;
private _deathTimestamp = _player getVariable [KEY_DEATH_TIMESTAMP, 0];

SLOG("mapping player variables to hash...");

[_uid,
 _slot,
 _name,
 _class,
 _reputation,
 _money,
 _prisoner,
 _prisonTime,
 _position,
 _state,
 _deathTimestamp,
 _loadout] call coopr_fnc_createCharacterState;
