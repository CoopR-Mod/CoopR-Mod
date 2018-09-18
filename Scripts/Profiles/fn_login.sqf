params ["_actionId"];

player setVariable ["dpl_is_logged_in", true];
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_STR_CLIENT_SIDE, DEBUG_CFG] call CBA_fnc_debug;

player removeAction actionId; 
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_STR_CLIENT_SIDE, DEBUG_CFG] call CBA_fnc_debug;
