
#include "..\constants.hpp"

params ["_player"];

private _characters = [getPlayerUID _player] call X11_fnc_getCharacterSlots;
private _ownerId =  owner _player;

if ([_characters] call CBA_fnc_hashSize == 0) exitWith {
    SLOG("no profiles found - setting fetched profiles to empty hash");
    _player setVariable [KEY_PROFILE_FETCHED, EMPTY_HASH, _ownerId];
};

LDEBUG("syncprofile", _characters);
_player setVariable [KEY_PROFILE_FETCHED, _characters, _ownerId];
