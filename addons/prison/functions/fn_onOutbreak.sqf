
#include "script_component.hpp"

_prisoners = thisList select {_x getVariable KEY_IS_PRISONER};
{_x setPos (getPos prison)} forEach _prisoners;

