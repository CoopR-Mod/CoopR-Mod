#include "..\constants.hpp"

private _slot = player getVariable [KEY_SLOT, -1];
[_slot, KEY_STATE, STATE_KIA] call X11_fnc_updateCharacterValue;

