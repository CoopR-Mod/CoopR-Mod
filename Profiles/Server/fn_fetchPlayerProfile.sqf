#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player"];

private _fetchedProfiles = getPlayerUID _player call X11_fnc_getPlayerProfile;
[_player, [KEY_PROFILE_FETCHED, _fetchedProfiles]] remoteExec ["setVariable", owner _player];