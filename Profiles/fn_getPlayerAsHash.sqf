#include "..\globals.hpp"
#include "constants.hpp"

params ["_player"];

private _uid = getPlayerUID _player;
private _name = name _player;

private _money = _player getVariable [KEY_MONEY, 0];
private _class = _player getVariable [KEY_CLASS, "none"];
private _reputation = _player getVariable [KEY_REPUTATION, 0];
private _renegade = _player getVariable [KEY_IS_RENEGADE, false];
private _prisonTime = _player getVariable [KEY_PRISON_START, false];

[_uid, _name, _class, _reputation, _money, _renegade, _prisonTime] call X11_fnc_createPlayerProfile;
