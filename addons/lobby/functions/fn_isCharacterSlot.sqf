#include "script_component.hpp"

params [["_characterSlot", EMPTY_HASH, []]];

([_characterSlot] call CBA_fnc_isHash and [_characterSlot] call CBA_fnc_hashSize > 0);
