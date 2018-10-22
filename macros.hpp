#define LDEBUG(var1,var2) [format ["DEBUG - %1: %2", var1, var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define DEBUG(var1) [format ["DEBUG: %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define SLOG(var1) [var1, DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define FLOG(var1,var2) [format [var1, var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define FFLOG(var1,var2,var3) [format [var1, var2, var3], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define LSTART(var1) [format ["============= %1 =============", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define LEND(var1) [format ["============= /%1 =============", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

#define TSTART [format ["<< Test Start for __FILE__ >>", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define TEND [format ["<< Test End for __FILE__ >>", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define TLOG(var1) [format ["TEST - %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TSUCCESS [format ["TEST - failed", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TFAIL [format ["TEST - success", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug

