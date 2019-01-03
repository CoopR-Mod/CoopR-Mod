#include "script_component.hpp"

if(!ALLOW_SYNC) exitWith {
    INFO("syncing disabled");
};

private _allPlayers = allPlayers;

DEBUG2("found %1 players connected", count _allPlayers);
{
    private _player = _x;
    private _isLoggedIn = _player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];

    // skip if not logged in
    if(_isLoggedIn) then {
        _player call coopr_fnc_syncPlayerToServer;
        _player call coopr_fnc_updateCharacter;
    }

} forEach allPlayers;

INFO("... syncing done.");
