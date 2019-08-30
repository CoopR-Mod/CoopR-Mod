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

// strip COOPR_LOBBY_AGENT
COOPR_LOBBY_AGENT setUnitLoadout EMPTY_LOADOUT;
// converts the roles macro array into a cba_hash and picks out the names only
private _rolesHash = [COOPR_CHARACTER_ROLES, []] call CBA_fnc_hashCreate;
private _roleNames = [_rolesHash] call CBA_fnc_hashKeys;

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;

// hide the description control if open
private _characterDetailsCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DETAILS;
_characterDetailsCtrl ctrlShow false;
_characterDetailsCtrl ctrlEnable false;

// enable character creation
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
_characterCreationCtrl ctrlShow true;
_characterCreationCtrl ctrlEnable true;

private _infobox = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX;
_infobox ctrlShow true;
_infobox ctrlEnable true;

private _createButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_CREATE;
private _rolesCombo = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_COMBO;

call coopr_fnc_initPerks;

// init the role selection combobox
lbClear _rolesCombo;
{
    private _index = _rolesCombo lbAdd (_x select 1);
    _rolesCombo lbSetData [_index, _x select 0];
} forEach (call coopr_fnc_getRoles);

// set default selection to first item
_rolesCombo ctrlRemoveAllEventHandlers "LBSelChanged";
_rolesCombo ctrlAddEventHandler ["LBSelChanged", { call coopr_fnc_selectRole}];
_rolesCombo lbSetCurSel 0;

_createButton setVariable ["_params", [_slot, _rolesCombo]];
_createButton ctrlRemoveAllEventHandlers "MouseButtonDown";
_createButton ctrlAddEventHandler ["MouseButtonDown", {
    params [["_ctrl", objNull]];
    private _params = _ctrl getVariable ["_params", []];
    _params params ["_slot", "_rolesCombo"];

    private _roleClass = _rolesCombo lbData (lbCurSel _rolesCombo);
    private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
    private _nameLabel = ctrlText (_loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_NAME_INPUT);
    private _errorText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ERROR;

    if (_nameLabel isEqualTo "") then {
        _errorText ctrlSetText (localize "str.coopr.character.new.error");
    } else {
        _errorText ctrlSetText "";
        private _selectedPerkClasses = (call coopr_fnc_getSelectedPerksCtrl) apply { (_x getVariable ["perk", []]) select 0 };
        if ((count _selectedPerkClasses) >= MAX_PERKS) then {
            private _characterState = [player, _slot, _nameLabel, _roleClass] call coopr_fnc_getNewCharacterState;
            private _starterSkills = [_roleClass, 1] call coopr_fnc_getSkillForLevel;
            [_characterState, COOPR_CHAR_PERKS, _selectedPerkClasses] call CBA_fnc_hashSet;
            [_characterState, COOPR_CHAR_SKILLS, _starterSkills] call CBA_fnc_hashSet;

            [_characterState, _slot] remoteExec ["coopr_fnc_createCharacter", EXEC_SERVER];
            closeDialog GUI_ID_LOGIN_DIALOG;
        } else {
            _errorText ctrlSetText (localize "str.coopr.character.perkamount.error");
        };
    }
}];
