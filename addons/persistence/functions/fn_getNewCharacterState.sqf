#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a new fresh character state
 *
 * Arguments:
 * 0: _player <OBJECT> - the player this character will be created for
 * 1: _slot <NUMBER> - the character slot
 * 2: _characterName <String> - name of the character
 * 3: _role <String> - role of the character
 *
 * Public: No
 *
 * Scope: Global
 */
params [["_player", objNull],
        ["_slot", -1],
        ["_characterName","<NoName>" ],
        ["_role", "coopr_role_none"]];

private _loadOut = _role call coopr_fnc_getRoleLoadout;
private _characterID = floor (random [1000,5555,9999]);

private _stateHash = [[COOPR_CHAR_UID, getPlayerUID _player],
                      [COOPR_CHAR_CHARACTER_ID, _characterID],
                      [COOPR_CHAR_SLOT, _slot],
                      [COOPR_CHAR_NAME, _characterName],
                      [COOPR_CHAR_ROLE, _role],
                      [COOPR_CHAR_ROLE_LEVEL, 1],
                      [COOPR_CHAR_STATE, COOPR_STATE_OK],
                      [COOPR_CHAR_REPUTATION, 0],
                      [COOPR_CHAR_TMP_REPUTATION, 0],
                      [COOPR_CHAR_MONEY, STARTING_MONEY],
                      [COOPR_CHAR_POSITION, getPos COOPR_HQ_WEST],
                      [COOPR_CHAR_WOUNDED_TIMESTAMP, 0],
                      [COOPR_CHAR_ACTIVE_MISSION, []],
                      [COOPR_CHAR_PERKS, []],
                      [COOPR_CHAR_SKILLS, []],
                      [COOPR_CHAR_LOADOUT, _loadout]];

DEBUG("character hash created");

private _state = [_stateHash, []] call CBA_fnc_hashCreate;
[_state] call coopr_fnc_characterStatePrettyLog;
_state;
