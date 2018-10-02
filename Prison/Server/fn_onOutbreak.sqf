
#include "..\constants.hpp"

_renegades = thisList select {_x getVariable KEY_IS_RENEGADE};
{_x setPos (getPos prison)} forEach _renegades;

