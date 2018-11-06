#include "..\constants.hpp"

params [["_playerId", 0],
        ["_slot", -1],
        ["_playerName","<NoName>" ],
        ["_classType","<None>" ],
        ["_reputation", 0],
        ["_money", 0],
        ["_prisoner", false],
        ["_prisonStart", 0],
        ["_position", getPos GLOB(DPL_HQ)],
        ["_state", STATE_OK],
        ["_deathTimestamp", 0],
        ["_loadout", []]];

private _statsHash = [[KEY_UID, _playerId],
                      [KEY_SLOT, _slot],
                      [KEY_NAME, _playerName],
                      [KEY_CLASS, _classType],
                      [KEY_STATE, _state],
                      [KEY_REPUTATION, _reputation],
                      [KEY_MONEY, _money],
                      [KEY_IS_PRISONER, _prisoner],
                      [KEY_POSITION, _position],
                      [KEY_PRISON_START, _prisonStart],
                      [KEY_DEATH_TIMESTAMP, _deathTimestamp],
                      [KEY_LOADOUT, _loadout]];

SLOG("character hash created");

private _state = [_statsHash, []] call CBA_fnc_hashCreate;
//[_state] call X11_fnc_characterStatePrettyLog;
_state;

