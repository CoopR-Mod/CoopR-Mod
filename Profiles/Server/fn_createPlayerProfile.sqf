#include "..\..\globals.hpp"
#include "..\constants.hpp"

params [["_playerId", 0],
        ["_playerName","<NoName>" ],
        ["_classType","<None>" ],
        ["_reputation", 0],
        ["_money", 0],
        ["_renegade", false],
        ["_prisonStart", 0],
        ["_position", []]];

private _statsHash = [[KEY_UID, _playerId],
                      [KEY_NAME, _playerName],
                      [KEY_CLASS, _classType],
                      [KEY_REPUTATION, _reputation],
                      [KEY_MONEY, _money],
                      [KEY_IS_RENEGADE, _renegade],
                      [KEY_POSITION, _position],
                      [KEY_PRISON_START, _prisonStart]];

[format ["player profile created: %1", _statsHash], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

[_statsHash, []] call CBA_fnc_hashCreate;

