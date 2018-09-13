#include "..\constants.hpp"

params ["_renegade"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

// set all prison relevant variables
private _oldPosition =  getPos _renegade;
private _allWeapons = weapons _renegade;
private _allMagazines = magazines _renegade;
private _currentServerTime = serverTime;

["remove weapons and magazines from player", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
{_renegade removeWeapon _x} forEach _allWeapons;
{_renegade removeMagazine _x} forEach _allWeapons;

["teleport player to prison area", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
_renegade setPos (getPos prison);

["mark player as 'renegade'", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
_renegade setVariable ["isRenegade", true];
_renegade setVariable ["prisonTimeStart", _currentServerTime ];
["mark player as 'renegade'", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

[{call X11_fnc_checkIfPrisontimeOver}, 3, [_renegade, _oldPosition, _allWeapons, _allMagazines]] call CBA_fnc_addPerFrameHandler;

[format ["player %1 has been arrested at %2", name _renegade, _currentServerTime], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;


