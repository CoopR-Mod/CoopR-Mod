#define DEBUG_CFG [true, true, false]

#define SETUPERROR(var1) private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; }; [var1, _machine + "COOPR.SETUP.ERROR", DEBUG_CFG] call CBA_fnc_debug
#define ERROR(var1) private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; }; [var1, _machine + DEBUG_CTX + ".error", DEBUG_CFG] call CBA_fnc_debug

#define DEBUG(var1) if (DEBUG_CTX call coopr_fnc_getLogLevel == 2) then {private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; }; [format ["%1", var1], _machine + DEBUG_CTX + ".debug", DEBUG_CFG] call CBA_fnc_debug }
#define DEBUG2(var1,var2) if (DEBUG_CTX call coopr_fnc_getLogLevel >= 2) then {private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; }; [format [var1, var2], _machine + DEBUG_CTX + ".debug", DEBUG_CFG] call CBA_fnc_debug }
#define DEBUG3(var1,var2,var3) if (DEBUG_CTX call coopr_fnc_getLogLevel >= 2) then { private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; };[format [var1, var2, var3], _machine + DEBUG_CTX + ".debug", DEBUG_CFG] call CBA_fnc_debug }

#define INFO(var1) if (DEBUG_CTX call coopr_fnc_getLogLevel >= 1) then { private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; }; [var1, _machine + DEBUG_CTX + ".info", DEBUG_CFG] call CBA_fnc_debug }
#define INFO2(var1,var2) if (DEBUG_CTX call coopr_fnc_getLogLevel >= 1) then { private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; };[format [var1, var2], _machine + DEBUG_CTX + ".info", DEBUG_CFG] call CBA_fnc_debug }
#define INFO3(var1,var2,var3) if (DEBUG_CTX call coopr_fnc_getLogLevel >= 1) then { private _machine = "[Client] "; if (isServer) then { _machine = "[Server] "; };[format [var1, var2, var3], _machine + DEBUG_CTX + ".info", DEBUG_CFG] call CBA_fnc_debug }

