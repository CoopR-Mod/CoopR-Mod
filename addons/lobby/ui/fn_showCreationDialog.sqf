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

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG_NEW;
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;

_characterCreationCtrl ctrlShow true;
_characterCreationCtrl ctrlEnable true;

