#include "script_component.hpp"

params ["_prisoner"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

private _oldPosition =  getPos _prisoner;
private _currentServerTime = serverTime;
private _clientOwnerId = owner _prisoner;

["mark player as 'prisoner'", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
_prisoner setVariable [KEY_IS_PRISONER, true];
_prisoner setVariable [KEY_PRISON_START, _currentServerTime];

[-30] remoteExec ["coopr_fnc_updateReputation", _clientOwnerId];
_prisoner call coopr_fnc_syncPlayerToServer;
_prisoner call coopr_fnc_makePrisoner;

FFLOG("player %1 has been arrested at %2", name _prisoner, _currentServerTime);


