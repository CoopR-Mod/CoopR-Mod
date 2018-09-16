#include "constants.hpp"

params ["_renegade"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

// set all prison relevant variables
private _oldPosition =  getPos _renegade;
private _savedLoadout = getUnitLoadout _renegade;
private _currentServerTime = serverTime;

["Remove current loadout from player", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
_renegade setUnitLoadout EMPTY_LOADOUT;

["teleport player to prison area", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
_renegade setPos (getPos prison);

["mark player as 'renegade'", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
_renegade setVariable ["isRenegade", true];
_renegade setVariable ["prisonTimeStart", _currentServerTime ];
["mark player as 'renegade'", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

[{call X11_fnc_checkIfPrisontimeOver}, 3, [_renegade, _oldPosition, _savedLoadout]] call CBA_fnc_addPerFrameHandler;

[format ["player %1 has been arrested at %2", name _renegade, _currentServerTime], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;


