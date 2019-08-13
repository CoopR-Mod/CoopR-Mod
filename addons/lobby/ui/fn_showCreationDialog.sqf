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

_createButton ctrlAddEventHandler ["MouseButtonDown", {
    private _characterState = [player, 1, "TestName", COOPR_ROLE_LEADER] call coopr_fnc_getNewCharacterState;
    [_characterState, 1] remoteExec ["coopr_fnc_createCharacter", EXEC_SERVER];
}];

_characterCreationCtrl ctrlShow true;
_characterCreationCtrl ctrlEnable true;


