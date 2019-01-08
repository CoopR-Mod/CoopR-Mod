#include "script_component.hpp"

params [["_logic", objNull]];

// Boilerplate logging system initialization. Please do not remove if you want CoopR Logging to work
private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];
// -------------------------------------------------------------------------------------------------

// getting the value of the modules argument set by the mission creator/editor.
private _exampleArgument = _logic getVariable ["ExampleArgument", -1];
INFO2("Example Argument is: %1", _exampleArgument);

// synced objects
private _syncedObjects = synchronizedObjects _logic;
DEBUG2("Example Module - synced units: %1", _syncedObjects);

// just an example - it is not mandatory to abort module setup if there are no synced objects
if (count _syncedObjects == 0) exitWith { ERROR("Example module has no synced units!") };

// calling init for every synced objects. Just an example. You are free to create the init function as you wish.
// Why are we using it? Just to separate common SQF logic and module specific setup routines!
{ [_x] remoteExec ["coopr_fnc_initExampleModule", EXEC_GLOBAL]; } forEach _syncedObjects;

true
