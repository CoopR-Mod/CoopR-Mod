#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Login_Dialog";

waitUntil {!isNull findDisplay 1101};

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

waitUntil {

    { _x ctrlSetText localize "str.dpl.profiles.fetch" } forEach _profileInfos;

    [player] remoteExec ["X11_fnc_syncProfileToPlayer"];
    private _fetched = player getVariable [KEY_PROFILE_FETCHED, EMPTY_HASH];
    sleep 1;

    count _fetched > 0;
};

private _playerProfiles = player getVariable [KEY_PROFILE_FETCHED, false];

{
    private _profile = _x;
    private _overlay = _profileOverlays select _forEachIndex;
    private _info = _profileInfos select _forEachIndex;

    [_profile, _info] call X11_fnc_setProfileSlot;
    [_profile, _overlay, _forEachIndex] call X11_fnc_setOverlayHandler;

} forEach _playerProfiles;





