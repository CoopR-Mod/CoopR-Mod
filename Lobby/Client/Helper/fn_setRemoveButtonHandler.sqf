#include "..\..\constants.hpp"

params ["_button", "_slot"];
_button setVariable ["_slot", _slot];

_button ctrlAddEventHandler ["MouseButtonDown",  {call X11_fnc_removeCharacterHandler}];
