#include "..\..\globals.hpp"
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Login_Dialog";
[player] remoteExec ["X11_fnc_fetchPlayerProfile"];

waitUntil {!isNull findDisplay 1101};
waitUntil { count (player getVariable [KEY_PROFILE_FETCHED, []]) > 0};

private _loginDisplay = findDisplay 1101;

private _profilePicture1 = _loginDisplay displayCtrl 1200;
private _profilePicture2 = _loginDisplay displayCtrl 1201;
private _profilePicture3 = _loginDisplay displayCtrl 1202;

private _profileButton1 = _loginDisplay displayCtrl 1600;
private _profileButton2 = _loginDisplay displayCtrl 1601;
private _profileButton3 = _loginDisplay displayCtrl 1602;

private _profileLabel1 = _loginDisplay displayCtrl 1001;
//private _profileLabel2 = _loginDisplay displayCtrl 1101;
//private _profileLabel3 = _loginDisplay displayCtrl 1602;

private _profileInfo1 = _loginDisplay displayCtrl 1100;
private _profileInfo2 = _loginDisplay displayCtrl 1101;
private _profileInfo3 = _loginDisplay displayCtrl 1102;

private _playerProfile = player getVariable [KEY_PROFILE_FETCHED, false];
private _name = [_playerProfile, KEY_NAME] call CBA_fnc_hashGet;
private _reputation = [_playerProfile, KEY_REPUTATION] call CBA_fnc_hashGet;

_profileInfo1 ctrlSetStructuredText composeText [localize "str.dpl.profile.name", _name, lineBreak,
                                                localize "str.dpl.profile.reputation: ", str _reputation, lineBreak,
                                                "Reputation: ", str _reputation, lineBreak,
                                                "Reputation: ", str _reputation];






_loginHandler = {
    params ["_control"];
    ctrlParent _control closeDisplay 0;
    [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];
};

_registerHandler = {
    closeDialog 1;
    [] spawn X11_fnc_showNewProfileDialog;
};

_resetHandler = {
    [player, clientOwner, true] remoteExec ["X11_fnc_registerPlayer", SERVER];
};

// _loginDisplay displayAddEventHandler ["KeyDown", "true"];

