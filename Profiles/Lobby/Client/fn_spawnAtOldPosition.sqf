#include "..\..\globals.hpp"
#include "..\constants.hpp"

private _oldPos = player getVariable [KEY_POSITION, []];

player setPos _oldPos;
