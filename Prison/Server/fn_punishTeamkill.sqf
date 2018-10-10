#include "..\constants.hpp"

params ["_renegade"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

private _oldPosition =  getPos _renegade;
private _currentServerTime = serverTime;
private _clientOwnerId = owner _renegade;

["mark player as 'renegade'", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
_renegade setVariable [KEY_IS_RENEGADE, true];
_renegade setVariable [KEY_PRISON_START, _currentServerTime];

[-30] remoteExec ["X11_fnc_updateReputation", _clientOwnerId];
_renegade call X11_fnc_syncPlayerToServer;
_renegade call X11_fnc_makePrisoner;

FFLOG("player %1 has been arrested at %2", name _renegade, _currentServerTime);


