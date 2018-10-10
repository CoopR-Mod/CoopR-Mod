#include "..\constants.hpp"

params ["_renegade"];

SLOG("remove current loadout from player");
_renegade setUnitLoadout EMPTY_LOADOUT;

SLOG("teleport player to prison area");
_renegade setPos (getPos prison);

[{call X11_fnc_checkFreedom}, 3, [_renegade]] call CBA_fnc_addPerFrameHandler;
