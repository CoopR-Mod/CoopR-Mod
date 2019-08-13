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
 * Scope: Client 
 */

params [["_ctrl", objNull]];
if (_ctrl isEqualTo objNull) exitWith { ERROR("_ctrl was objNull") };
private _params = _ctrl getVariable ["_params", []];
_params params ["_slot"];

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG_NEW;
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
private _createButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_CREATE;

_createButton setVariable ["_params", [_loginDialog]];

_createButton ctrlAddEventHandler ["MouseButtonDown", {
    params [["_ctrl", objNull]];
    private _params = _ctrl getVariable ["_params", []];
    _params params ["_loginDialog"];

    private _nameLabel = ctrlText (_loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_NAME_INPUT);
    private _errorText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ERROR;
    if (_nameLabel isEqualTo "") then {
        _errorText ctrlSetText (localize "str.coopr.character.newprofile.error");
    } else {
        private _characterState = [player, 1, _nameLabel, COOPR_ROLE_LEADER] call coopr_fnc_getNewCharacterState;
        [_characterState, 1] remoteExec ["coopr_fnc_createCharacter", EXEC_SERVER];
    }
}];

_characterCreationCtrl ctrlShow true;
_characterCreationCtrl ctrlEnable true;
