#include "script_component.hpp"

params [["_player", objNull],
        ["_slot", -1],
        ["_playerName","<NoName>" ],
        ["_role", COOPR_ROLE_NONE]];

private _loadOut = _role call coopr_fnc_getLoadoutForRole;

private _stateHash = [[COOPR_KEY_UID, getPlayerUID _player],
                      [COOPR_KEY_SLOT, _slot],
                      [COOPR_KEY_NAME, _playerName],
                      [COOPR_KEY_ROLE, _role],
                      [COOPR_KEY_STATE, COOPR_STATE_OK],
                      [COOPR_KEY_REPUTATION, 0],
                      [COOPR_KEY_MONEY, STARTING_MONEY],
                      [COOPR_KEY_POSITION, getPos COOPR_HQ_WEST],
                      [COOPR_KEY_WOUNDED_TIMESTAMP, 0],
                      [COOPR_KEY_LOADOUT, _loadout]];

DEBUG("character hash created");

private _state = [_stateHash, []] call CBA_fnc_hashCreate;
[_state] call coopr_fnc_characterStatePrettyLog;
_state;
