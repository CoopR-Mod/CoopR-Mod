[format ["player with id %1 logged in", getPlayerUID player], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

player setVariable ["dpl_is_logged_in", true];

player removeAction ["Login"];
