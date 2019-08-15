#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Handles the event of the selection of the role combo box in the creation screen
 *
 * Arguments:
 * 0: _loginDialog <CONTROL> - the login dialog
 * 1: _rolesHash <CBA_HASH> - the roles hash
 *
 * Public: No
 *
 * Scope: LBSelChanged Event
 */

params ["_ctrl", "_index"];

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
private _rolesHash = [COOPR_CHARACTER_ROLES, []] call CBA_fnc_hashCreate;

private _picture = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_PICTURE;
private _roleName = _ctrl lbText _index;
private _roleId = [_rolesHash, _roleName] call CBA_fnc_hashGet;
private _roleImage = [_roleId] call coopr_fnc_getImageForRole;

_picture ctrlSetText _roleImage;
