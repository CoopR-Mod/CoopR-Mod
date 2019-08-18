#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Handles the event of the selection of the role combo box in the creation screen
 *
 * Arguments:
 * None
 *
 * Public: No
 *
 * Scope: LBSelChanged Event
 */

params ["_ctrl", "_index"];

detach COOPR_LOBBY_AGENT;
COOPR_LOBBY_AGENT setDir 0;
hideObject COOPR_LOBBY_PROP_STRETCHER;
hideObject COOPR_LOBBY_PROP_BODYBAG;
COOPR_LOBBY_AGENT hideObject false;

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;

private _pictureCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_PICTURE;
private _infobox = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX;
private _infoboxText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX_TEXT;
private _infoboxTitle = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX_TEXT;

// show description control
_infobox ctrlEnable true;
_infobox ctrlShow true;

private _roleClass = _ctrl lbData _index;
private _roleName = _ctrl lbText _index;
private _roleIcon = [_roleClass, "icon"] call coopr_fnc_getRoleData;
private _roleDescription = [_roleClass, "description"] call coopr_fnc_getRoleData;
private _loadOut = _roleClass call coopr_fnc_getRoleLoadout;

COOPR_LOBBY_AGENT setUnitLoadout _loadOut;
[_roleClass] spawn { [_this select 0] call coopr_fnc_playAnimationForRole; };

_pictureCtrl ctrlSetText _roleIcon;
_infoboxTitle ctrlSetText localize "str.coopr.character.new.infobox";
_infoboxText ctrlSetText _roleDescription;
