#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG};

DEBUG("initialising login ui");

private _loginDisplay = findDisplay GUI_ID_LOGIN_DIALOG;

private _profileInfos = [];
_profileInfos set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_1_INFO];
_profileInfos set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_2_INFO];
_profileInfos set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_3_INFO];

private _profileButtons = [];
_profileButtons set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_1_BUTTON];
_profileButtons set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_2_BUTTON];
_profileButtons set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_3_BUTTON];

private _profileOverlays = [];
_profileOverlays set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_1_OVERLAY];
_profileOverlays set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_2_OVERLAY];
_profileOverlays set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_3_OVERLAY];

private _characterPictures = [];
_characterPictures set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_1];
_characterPictures set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_2];
_characterPictures set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_PROFILE_3];

DEBUG("login ui initialized");

[_profileInfos, _profileOverlays, _profileButtons, _characterPictures] call coopr_fnc_updateLoginDialog;
