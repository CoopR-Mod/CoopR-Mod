#include "..\..\globals.hpp"
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Login_Dialog";
waitUntil {!isNull findDisplay 1101};

private _loginDisplay = findDisplay 1101;
private _loginButton = _loginDisplay displayCtrl 1600;
private _registerButton = _loginDisplay displayCtrl 1601;
private _loggedIn =  player getVariable [KEY_PLAYER_LOGGEDIN, false];

[format ["show display for player %1", player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

_loginHandler = {
    params ["_control"];
    ctrlParent _control closeDisplay 0;
    [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];
};

_registerHandler = {
    [player, clientOwner] remoteExec ["X11_fnc_registerPlayer", SERVER];
};

_loginButton ctrlAddEventHandler ["MouseButtonDown", _loginHandler];
_registerButton ctrlAddEventHandler ["MouseButtonDown", _registerHandler];

