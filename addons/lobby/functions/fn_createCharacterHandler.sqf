#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This handler creates a new character by reading user entered informations and call the function to create a new
 * character
 *
 * Arguments:
 * Handler specific
 *
 * Return Value:
 * None
 *
 * Example:
 * _createButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_createCharacterHandler}];
 *
 * Public: No
 *
 * Scope: Client
 */

private _ctrl = _this select 0;
private _nameTextEdit = _ctrl getVariable ["_nameTextEdit", objNull];
private _infoText = _ctrl getVariable ["_infoText", objNull];
private _roleSelectBox = _ctrl getVariable ["_roleSelectBox", objNull];
private _rolesHash = _ctrl getVariable ["_rolesHash", objNull];
private _slot = _ctrl getVariable ["_slot", -1];
private _uid = getPlayerUID player;
private _name = ctrlText _nameTextEdit;
private _index = lbCurSel _roleSelectBox;
private _roleName = _roleSelectBox lbText _index;
private _roleId = [_rolesHash, _roleName] call CBA_fnc_hashGet;

INFO3("creating new character for %1 at slot %1", _uid, _slot);
private _characterState = [player, _slot, _name, _roleId] call coopr_fnc_getNewCharacterState;

// textbox validation
if(_name == "" or _roleName == "") exitWith {
    _infoText ctrlSetStructuredText parseText format["<t size='1' color='#ff0000'>%1</t>", localize "str.coopr.profiles.validator"];
};

[EXEC_SERVER, "coopr_fnc_createCharacter", [_characterState, _slot], //request-related
    [_pairs], {
        params ["_args", "_result"];
        closeDialog 1;
    }
] call Promise_Create;

