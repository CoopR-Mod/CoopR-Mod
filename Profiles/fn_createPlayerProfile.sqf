#include "..\globals.hpp"

params ["_playerId", "_playerName", "_classType", "_reputation", "_money"];

private _statsHash = [["playerId", _playerId],
                      ["playerName", _playerName],
                      ["class", _classType],
                      ["reputation", _reputation],
                      ["money", _money]];

[format ["new player profile created: %1", _statsHash], DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;

[_statsHash, []] call CBA_fnc_hashCreate;

