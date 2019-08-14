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

params [["_ctrl", objNull]];
private _params = _ctrl getVariable ["_params", []];
_params params ["_loginDialog", "_rolesHash"];

private _picture = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_PICTURE;

private _selectedIndex = lbCurSel _ctrl;
private _roleName = _ctrl lbText _selectedIndex;
private _roleId = [_rolesHash, _roleName] call CBA_fnc_hashGet;
private _roleImage = [_roleId] call coopr_fnc_getImageForRole;

private _pathToImage = format ["\x\coopr\addons\lobby\data\images\%1", _roleImage];

DEBUG3("path to image for role %1 is %2", _roleName, _pathToImage);

_picture ctrlSetText _pathToImage;
