#include "..\..\constants.hpp"

params ["_profile"];

([_profile] call CBA_fnc_isHash and [_profile] call CBA_fnc_hashSize > 0);
