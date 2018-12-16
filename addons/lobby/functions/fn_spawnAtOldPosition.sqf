#include "script_component.hpp"

private _oldPos = player getVariable [COOPR_KEY_POSITION, []];

player setPos _oldPos;

DEBUG3("player %1 spawned at old location: %2", getPlayerUID player, _oldPos);
