
#include "..\constants.hpp"

params [["_playerId", 0],
        ["_slot", -1],
        ["_playerName","<NoName>" ],
        ["_classType","<None>" ],
        ["_reputation", 0],
        ["_money", 0],
        ["_renegade", false],
        ["_prisonStart", 0],
        ["_position", getPos respawn_hq],
        ["_loadout", []]];

private _statsHash = [[KEY_UID, _playerId],
                      [KEY_SLOT, _slot],
                      [KEY_NAME, _playerName],
                      [KEY_CLASS, _classType],
                      [KEY_REPUTATION, _reputation],
                      [KEY_MONEY, _money],
                      [KEY_IS_PRISONER, _renegade],
                      [KEY_POSITION, _position],
                      [KEY_PRISON_START, _prisonStart],
                      [KEY_LOADOUT, _loadout]];

FLOG("character hash created: %1", _statsHash);

[_statsHash, []] call CBA_fnc_hashCreate;

