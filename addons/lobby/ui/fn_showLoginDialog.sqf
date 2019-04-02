#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG};

DEBUG("initialising login ui");

private _loginDisplay = findDisplay GUI_ID_LOGIN_DIALOG;

private _profileInfos = [];
_profileInfos set [0, _loginDisplay displayCtrl 1100];
_profileInfos set [1, _loginDisplay displayCtrl 1101];
_profileInfos set [2, _loginDisplay displayCtrl 1102];

private _profileButtons = [];
_profileButtons set [0, _loginDisplay displayCtrl 1600];
_profileButtons set [1, _loginDisplay displayCtrl 1601];
_profileButtons set [2, _loginDisplay displayCtrl 1602];

private _profileOverlays = [];
_profileOverlays set [0, _loginDisplay displayCtrl 1210];
_profileOverlays set [1, _loginDisplay displayCtrl 1220];
_profileOverlays set [2, _loginDisplay displayCtrl 1230];

private _characterPictures = [];
_characterPictures set [0, _loginDisplay displayCtrl 1200];
_characterPictures set [1, _loginDisplay displayCtrl 1201];
_characterPictures set [2, _loginDisplay displayCtrl 1202];

DEBUG("login ui initialized");

[_profileInfos, _profileOverlays, _profileButtons, _characterPictures] call coopr_fnc_updateLoginDialog;
