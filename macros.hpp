#define LDEBUG(var1,var2) [format ['DEBUG - var1: %1', var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define DEBUG(var1) [format ["DEBUG: %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define SLOG(var1) [var1, DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define FLOG(var1,var2) [format [var1, var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;


