
#include "..\constants.hpp"

private _oldPos = player getVariable [KEY_POSITION, []];

player setPos _oldPos;

FFLOG("player %1 spawned at old location: %2", getPlayerUID player, _oldPos);
