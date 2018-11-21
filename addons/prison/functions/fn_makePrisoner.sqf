#include "script_component.hpp"

params ["_prisoner"];

SLOG("remove current loadout from player");
_prisoner setUnitLoadout EMPTY_LOADOUT;

SLOG("teleport player to prison area");
_prisoner setPos (getPos prison);

[{call coopr_fnc_checkFreedom}, 3, [_prisoner]] call CBA_fnc_addPerFrameHandler;
