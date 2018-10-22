#define TSTART [format ["<< Test Start for %1 >>", DEBUG_CTX], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define TEND [format ["<< Test End for %1 >>", DEBUG_CTX], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define TLOG(var1) [format ["TEST - %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TSUCCESS [format ["TEST - failed", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TFAIL [format ["TEST - success", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TEST(ctx) private _textContext = ctx

#define TASSERT(expression) if(expression) then { [format ["TEST %1 - success", _textContext], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug; } else { [format ["TEST %1 - failure", _textContext], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug; }


