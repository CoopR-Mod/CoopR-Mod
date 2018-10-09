#include "..\constants.hpp"

params ["_prisoner"];

private _savedLoadout =  _prisoner getVariable [KEY_LOADOUT, []];
private _oldPosition =  _prisoner getVariable [KEY_POSITION, getPos respawn_hq];

SLOG("prison time has been served out");

_prisoner setVariable [KEY_IS_RENEGADE, false];
_prisoner setVariable [KEY_PRISON_START, 0];

_prisoner setPos _oldPosition;
SLOG("teleport arrested player back to old position");

_prisoner setUnitLoadout _savedLoadout;
SLOG("arrested player reequipped");

