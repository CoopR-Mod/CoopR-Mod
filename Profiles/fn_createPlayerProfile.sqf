#include "..\globals.hpp"
#include "constants.hpp"

params ["_playerId", "_playerName", "_classType", "_reputation", "_money", "_renegade"];

//TODO renegade key missing
private _statsHash = [[KEY_UID, _playerId],
                      [KEY_NAME, _playerName],
                      [KEY_CLASS, _classType],
                      [KEY_REPUTATION, _reputation],
                      [KEY_IS_RENEGADE, _renegade],
                      [KEY_MONEY, _money]];

[format ["player profile created: %1", _statsHash], DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;

[_statsHash, []] call CBA_fnc_hashCreate;

