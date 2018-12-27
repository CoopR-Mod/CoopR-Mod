#include "script_component.hpp"

params [["_logic", objNull]];

if(isServer) then {
    private _syncedObjects = synchronizedObjects _logic;
    DEBUG2("Vehicle NPC Module - synced units: %1", _syncedObjects);

    if(count _syncedObjects == 0) exitWith { ERROR("Vehicle NPC Module has no synced units!") };
    { [_x] remoteExec ["coopr_fnc_initVehicleNPC", EXEC_CLIENTS]; } forEach _syncedObjects;

    true;
} else {
    false;
};
