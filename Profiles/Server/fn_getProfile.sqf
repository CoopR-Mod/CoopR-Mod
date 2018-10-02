#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_playerUid"];

FLOG("getting profile for player id %1", _playerUID);
profileNamespace getVariable [KEY_PLAYER_PROFILES, EMPTY_HASH];
