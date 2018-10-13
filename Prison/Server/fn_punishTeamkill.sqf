#include "..\constants.hpp"

params ["_prisoner"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

private _oldPosition =  getPos _prisoner;
private _currentServerTime = serverTime;
private _clientOwnerId = owner _prisoner;

["mark player as 'prisoner'", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
_prisoner setVariable [KEY_IS_PRISONER, true];
_prisoner setVariable [KEY_PRISON_START, _currentServerTime];

[-30] remoteExec ["X11_fnc_updateReputation", _clientOwnerId];
_prisoner call X11_fnc_syncPlayerToServer;
_prisoner call X11_fnc_makePrisoner;

FFLOG("player %1 has been arrested at %2", name _prisoner, _currentServerTime);


