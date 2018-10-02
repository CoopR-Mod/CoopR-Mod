
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Login_Dialog";

waitUntil {!isNull findDisplay 1101};

private _loginDisplay = findDisplay 1101;

private _playerProfiles = player getVariable [KEY_PROFILE_FETCHED, EMPTY_HASH];
private _profilePicture1 = _loginDisplay displayCtrl 1200;
private _profilePicture2 = _loginDisplay displayCtrl 1201;
private _profilePicture3 = _loginDisplay displayCtrl 1202;

private _profileInfo1 = _loginDisplay displayCtrl 1100;
private _profileInfo2 = _loginDisplay displayCtrl 1101;
private _profileInfo3 = _loginDisplay displayCtrl 1102;

private _profileButton1 = _loginDisplay displayCtrl 1600;
private _profileButton2 = _loginDisplay displayCtrl 1601;
private _profileButton3 = _loginDisplay displayCtrl 1602;

private _profileOverlay1 = _loginDisplay displayCtrl 1210;
private _profileOverlay2 = _loginDisplay displayCtrl 1220;
private _profileOverlay3 = _loginDisplay displayCtrl 1230;

_profileOverlay1 setVariable ["_slot", 0];
_profileOverlay2 setVariable ["_slot", 1];
_profileOverlay3 setVariable ["_slot", 2];

_registerHandler = {
    params ["_ctrl"];
    private _slot = _ctrl getVariable ["_slot", -1];
    closeDialog 1;
    [_slot] spawn X11_fnc_showNewProfileDialog;
};

_profileOverlay1 ctrlAddEventHandler ["MouseButtonDown", _registerHandler];
_profileOverlay2 ctrlAddEventHandler ["MouseButtonDown", _registerHandler];
_profileOverlay3 ctrlAddEventHandler ["MouseButtonDown", _registerHandler];

private _profileLabel1 = _loginDisplay displayCtrl 1001;
//private _profileLabel2 = _loginDisplay displayCtrl 1101;
//private _profileLabel3 = _loginDisplay displayCtrl 1602;

waitUntil {
    _profileInfo1 ctrlSetText "fetching profile...";
    _profileInfo2 ctrlSetText "fetching profile...";
    _profileInfo3 ctrlSetText "fetching profile...";
    [player] remoteExec ["X11_fnc_syncProfileToPlayer"];
    private _fetched = player getVariable [KEY_PROFILE_FETCHED, EMPTY_HASH];
    sleep 1;
    count _fetched > 0;
};

private _playerProfiles = player getVariable [KEY_PROFILE_FETCHED, false];
private _profile1 = _playerProfiles select 0;
private _profile2 = _playerProfiles select 1;
private _profile3 = _playerProfiles select 2;

[_profile1, _profileInfo1] call X11_fnc_setProfileSlot;
[_profile2, _profileInfo2] call X11_fnc_setProfileSlot;
[_profile3, _profileInfo3] call X11_fnc_setProfileSlot;

_loginHandler = {
    params ["_control"];
    ctrlParent _control closeDisplay 0;
    [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];
};



