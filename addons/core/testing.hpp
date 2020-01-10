#define TEST_CFG [true, true, false]

#define TSTART ["<< Test Start: " + __FILE__ + " >>", DEBUG_CTX + ".test", TEST_CFG] call CBA_fnc_debug; private _totalTests = 0;
#define TEND [format ["Summary: %1 tests executed", _totalTests], DEBUG_CTX + ".test", TEST_CFG] call CBA_fnc_debug; ["<< Test End: " + __FILE__ + " >>", DEBUG_CTX + ".test", TEST_CFG] call CBA_fnc_debug;
#define TLOG(var1) [format ["%1", var1], DEBUG_CTX + ".test.log", TEST_CFG] call CBA_fnc_debug
#define TSUCCESS [format ["success", var1], DEBUG_CTX + ".test", TEST_CFG] call CBA_fnc_debug
#define TFAIL [format ["failure", var1], DEBUG_CTX + ".test", TEST_CFG] call CBA_fnc_debug
#define TEST(ctx) private _testContext = ctx; _totalTests = _totalTests + 1;

#define TASSERT(expression) if(expression) then { [_testContext, DEBUG_CTX + ".test.success", TEST_CFG] call CBA_fnc_debug; } else { [ _testContext, DEBUG_CTX + ".test.failure", TEST_CFG] call CBA_fnc_debug; }
#define TEXPECT(expected, actual) if((expected) isEqualType (actual) and (expected) isEqualTo (actual)) then { [_testContext, DEBUG_CTX + ".test.success", TEST_CFG] call CBA_fnc_debug; } else { [_testContext, DEBUG_CTX + ".test.failure", TEST_CFG] call CBA_fnc_debug; [format ["expected %1 but was %2", expected, actual], DEBUG_CTX + ".test", TEST_CFG] call CBA_fnc_debug; }


