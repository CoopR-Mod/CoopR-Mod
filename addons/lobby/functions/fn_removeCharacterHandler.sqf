#include "script_component.hpp"

params ["_ctrl"];
private _slot = _ctrl getVariable ["_slot", -1];
private _uid = getPlayerUID player;

DEBUG("removing profile for player id %1", _uid);

[EXEC_SERVER, "coopr_fnc_updateCharacter", [_uid, EMPTY_HASH, _slot], //request-related
    [], {
        params ["_args", "_result"];
        closeDialog 1;
    }
] call Promise_Create;
