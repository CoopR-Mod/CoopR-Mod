DEBUG_CFG = [false, true, false];

if (is3DENMultiplayer) then {
    DEBUG_CFG = [true, true, false];
};

DEBUG_STR_SERVER_INIT = "SERVER INIT";
DEBUG_STR_CLIENT_INIT = "CLIENT INIT";
DEBUG_STR_NPC_INIT = "NPC INIT";

DEBUG_STR_EVENT = "EVENT";
DEBUG_STR_PLAYER_ACTION = "PLAYER ACTION";

call X11_fnc_initEventsServer;

["server initialized", DEBUG_STR_SERVER_INIT, DEBUG_CFG] call CBA_fnc_debug;

