
#include "..\constants.hpp"

_renegades = thisList select {_x getVariable KEY_IS_PRISONER};
{_x setPos (getPos prison)} forEach _renegades;

