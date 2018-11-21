#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay 1101};
SLOG("initialising login dialog");

private _loginDisplay = findDisplay 1101;

private _profilePicture1 = _loginDisplay displayCtrl 1200;
private _profilePicture2 = _loginDisplay displayCtrl 1201;
private _profilePicture3 = _loginDisplay displayCtrl 1202;

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

private _profileLabel1 = _loginDisplay displayCtrl 1001;
//private _profileLabel2 = _loginDisplay displayCtrl 1101;
//private _profileLabel3 = _loginDisplay displayCtrl 1602;

[_profileInfos, _profileOverlays, _profileButtons] call coopr_fnc_updateLoginDialog;
