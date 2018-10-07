#include "..\constants.hpp"

params ["_slot", "_playerUid"];

FLOG("removing profile for player id %1", _playerUid);
[_playerUid, EMPTY_HASH, _slot] remoteExec ["X11_fnc_updateCharacter", SERVER];

