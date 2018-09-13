#include "..\constants.hpp"

params ["_target", "_caller"];

_caller addItem "ACE_key_west";
_target commandChat "Bitte fahrt vorsichtig. Die TMP ist bald wieder dran!";

[format ["%1 has requested a vehicle key", name _caller], DEBUG_STR_PLAYER_ACTION, DEBUG_CFG] call CBA_fnc_debug;
