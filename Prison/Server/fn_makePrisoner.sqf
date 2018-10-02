
#include "..\constants.hpp"

params ["_renegade"];

["Remove current loadout from player", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
_renegade setUnitLoadout EMPTY_LOADOUT;

["teleport player to prison area", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
_renegade setPos (getPos prison);
