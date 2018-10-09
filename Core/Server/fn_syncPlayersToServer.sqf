#include "..\constants.hpp"

LSTART("SYNC");

if(!ALLOW_SYNC) exitWith {
    SLOG("syncing disabled");
    LEND("SYNC");
};

private _allPlayers = allPlayers;

FLOG("found %1 players connected", count _allPlayers);
{
    private _player = _x;
    private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];
    private _isRenegade = _player getVariable [KEY_IS_RENEGADE, false];

    // skip if not logged in
    if(_isLoggedIn and not _isRenegade) then {
        private _slot = _player getVariable [KEY_SLOT, -1];
        private _characterState = _player call X11_fnc_createCharacterStateFromPlayer;
        [getPlayerUID _player, _characterState, _slot] call X11_fnc_updateCharacter;
        FFLOG("player %1 auto synced at slot %2", name _player, _slot);
    }

} forEach allPlayers;

SLOG("... syncing done.");
LEND("SYNC");

