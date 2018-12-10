#include "script_component.hpp"

LSTART("ALL SYNC");

if(!ALLOW_SYNC) exitWith {
    SLOG("syncing disabled");
    LEND("SYNC");
};

private _allPlayers = allPlayers;

FLOG("found %1 players connected", count _allPlayers);
{
    private _player = _x;
    private _isLoggedIn = _player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
    private _isPrisoner = _player getVariable [COOPR_KEY_IS_PRISONER, false];

    // skip if not logged in
    if(_isLoggedIn and not _isPrisoner) then {
     _player call coopr_fnc_syncPlayerToServer;
    }

} forEach allPlayers;

SLOG("... syncing done.");
LEND("ALL SYNC");

