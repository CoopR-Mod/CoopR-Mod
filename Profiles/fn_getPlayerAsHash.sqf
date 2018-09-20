#include "..\globals.hpp"
#include "constants.hpp"

params ["_player"];

private _uid = getPlayerUID _player;
private _name = name _player;

private _money = _player getVariable [KEY_MONEY, 0];
private _class = _player getVariable [KEY_CLASS, "none"];
private _reputation = _player getVariable [KEY_REPUTATION, 0];

[_uid, _name, _class, _reputation, _money] call X11_fnc_createPlayerProfile;
