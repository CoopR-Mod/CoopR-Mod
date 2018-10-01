#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player"];

private _uid = getPlayerUID _player;
private _name = name _player;

private _money = _player getVariable [KEY_MONEY, 0];
private _class = _player getVariable [KEY_CLASS, "<None>"];
private _reputation = _player getVariable [KEY_REPUTATION, 0];
private _renegade = _player getVariable [KEY_IS_RENEGADE, false];
private _prisonTime = _player getVariable [KEY_PRISON_START, 0];
private _prisonPosition = _player getVariable [KEY_PRISON_FREE_POSITION, 0];
private _position = getPos _player;
private _loadout = getUnitLoadout _player;

SLOG("extracting player variables...");

[_uid,
 _name,
 _class,
 _reputation,
 _money,
 _renegade,
 _prisonTime,
 _position,
 _prisonPosition,
 _loadout] call X11_fnc_createPlayerProfile;
