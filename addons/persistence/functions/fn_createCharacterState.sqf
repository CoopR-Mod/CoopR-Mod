#include "script_component.hpp"

params [["_playerId", 0],
        ["_slot", -1],
        ["_playerName","<NoName>" ],
        ["_role", COOPR_ROLE_NONE],
        ["_reputation", 0],
        ["_money", 0],
        ["_position", getPos COOPR_HQ_WEST],
        ["_state", COOPR_STATE_OK],
        ["_deathTimestamp", 0],
        ["_loadout", []]];

private _statsHash = [[COOPR_KEY_UID, _playerId],
                      [COOPR_KEY_SLOT, _slot],
                      [COOPR_KEY_NAME, _playerName],
                      [COOPR_KEY_ROLE, _role],
                      [COOPR_KEY_STATE, _state],
                      [COOPR_KEY_REPUTATION, _reputation],
                      [COOPR_KEY_MONEY, _money],
                      [COOPR_KEY_POSITION, _position],
                      [COOPR_KEY_DEATH_TIMESTAMP, _deathTimestamp],
                      [COOPR_KEY_LOADOUT, _loadout]];

DEBUG("character hash created");

private _state = [_statsHash, []] call CBA_fnc_hashCreate;
[_state] call coopr_fnc_characterStatePrettyLog;
_state;
