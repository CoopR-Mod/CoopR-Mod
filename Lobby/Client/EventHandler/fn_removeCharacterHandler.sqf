#include "..\..\constants.hpp"

params ["_ctrl"];
private _slot = _ctrl getVariable ["_slot", -1];

FLOG("removing profile for player id %1", _playerUid);

[SERVER, "X11_fnc_updateCharacter", [getPlayerUID player, EMPTY_HASH, _slot], //request-related
    [], {
        params ["_args", "_result"];
        closeDialog 1;
        [] spawn X11_fnc_showLoginDialog;
    }
] call Promise_Create;
