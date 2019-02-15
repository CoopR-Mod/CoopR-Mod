#define TEST_CFG [true, true, false]

#define TSTART [format ["<< Test Start for %1 >>", DEBUG_CTX], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug;
#define TEND [format ["<< Test End for %1 >>", DEBUG_CTX], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug;
#define TLOG(var1) [format ["TEST - %1", var1], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug
#define TSUCCESS [format ["TEST - success", var1], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug
#define TFAIL [format ["TEST - failure", var1], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug
#define TEST(ctx) private _testContext = ctx

#define TASSERT(expression) if(expression) then { [format ["TEST %1 - success", _testContext], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug; } else { [format ["TEST %1 - failure", _testContext], DEBUG_CTX, TEST_CFG] call CBA_fnc_debug; }


