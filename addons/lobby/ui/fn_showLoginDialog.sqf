#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG};

DEBUG("initialising login ui");

private _loginDisplay = findDisplay GUI_ID_LOGIN_DIALOG;

private _characterInfos = [];
_characterInfos set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_1_INFO];
_characterInfos set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_2_INFO];
_characterInfos set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_3_INFO];

private _characterButtons = [];
_characterButtons set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_1_BUTTON];
_characterButtons set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_2_BUTTON];
_characterButtons set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_3_BUTTON];

private _characterOverlays = [];
_characterOverlays set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_1_OVERLAY];
_characterOverlays set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_2_OVERLAY];
_characterOverlays set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_3_OVERLAY];

private _characterPictures = [];
_characterPictures set [0, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_1];
_characterPictures set [1, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_2];
_characterPictures set [2, _loginDisplay displayCtrl GUI_ID_LOGIN_DIALOG_CHARACTER_3];

DEBUG("login ui initialized");

[_characterInfos, _characterOverlays, _characterButtons, _characterPictures] call coopr_fnc_updateLoginDialog;
