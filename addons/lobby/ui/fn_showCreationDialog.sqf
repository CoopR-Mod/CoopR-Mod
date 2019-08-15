#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Opens the character creation control
 *
 * Arguments:
 *
 * Public: No
 *
 * Scope: MouseButtonDown Event
 */

params [["_ctrl", objNull]];
if (_ctrl isEqualTo objNull) exitWith { ERROR("_ctrl was objNull") };
private _params = _ctrl getVariable ["_params", []];
_params params ["_slot"];

// strip player
player setUnitLoadout EMPTY_LOADOUT;
// converts the roles macro array into a cba_hash and picks out the names only
private _rolesHash = [COOPR_CHARACTER_ROLES, []] call CBA_fnc_hashCreate;
private _roleNames = [_rolesHash] call CBA_fnc_hashKeys;

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;

// hide the description control if open
private _characterDescriptionCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION;
_characterDescriptionCtrl ctrlShow false;
_characterDescriptionCtrl ctrlEnable false;

// enable character creation
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
_characterCreationCtrl ctrlShow true;
_characterCreationCtrl ctrlEnable true;

private _createButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_CREATE;
private _rolesCombo = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_COMBO;

// init the role selection combobox
lbClear _rolesCombo;
{_rolesCombo lbAdd _x} forEach _roleNames;
// set default selection to first item
_rolesCombo ctrlRemoveAllEventHandlers "LBSelChanged";
_rolesCombo ctrlAddEventHandler ["LBSelChanged", { call coopr_fnc_selectRole}];
_rolesCombo lbSetCurSel 0;

_createButton setVariable ["_params", [_slot, _rolesCombo, _rolesHash]];
_createButton ctrlRemoveAllEventHandlers "MouseButtonDown";
_createButton ctrlAddEventHandler ["MouseButtonDown", {
    params [["_ctrl", objNull]];
    private _params = _ctrl getVariable ["_params", []];
    _params params ["_slot", "_rolesCombo", "_rolesHash"];

    // init role picture
    private _selectedIndex = lbCurSel _rolesCombo;
    private _roleName = _rolesCombo lbText _selectedIndex;
    private _roleId = [_rolesHash, _roleName] call CBA_fnc_hashGet;
    private _roleImage = [_roleId] call coopr_fnc_getImageForRole;

    private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
    private _nameLabel = ctrlText (_loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_NAME_INPUT);
    private _errorText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ERROR;
    if (_nameLabel isEqualTo "") then {
        _errorText ctrlSetText (localize "str.coopr.character.newprofile.error");
    } else {
        private _characterState = [player, _slot, _nameLabel, _roleId] call coopr_fnc_getNewCharacterState;
        [_characterState, _slot] remoteExec ["coopr_fnc_createCharacter", EXEC_SERVER];
    }
}];
