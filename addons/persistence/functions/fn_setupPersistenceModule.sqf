#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];
private _perstistenceLocation = _logic getVariable ["PersistenceLocation", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

DEBUG2("persistence location is set to %1" _persistenceLocation);

if(_perstistenceLocation isEqualTo "Local") then {
  "Database" call coopr_fnc_initLocalDB;
};
