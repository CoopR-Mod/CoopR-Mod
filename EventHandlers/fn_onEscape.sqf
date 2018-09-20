#include "..\globals.hpp"
#include "constants.hpp"

params ["_thisTrigger", "_thisList"];

_renegades = thisList select {_x getVariable KEY_IS_RENEGADE};
{_x setPos (getPos prison)} forEach _renegades;

