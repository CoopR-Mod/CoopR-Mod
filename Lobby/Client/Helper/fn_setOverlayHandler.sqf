#include "..\..\constants.hpp"

params ["_profile", "_profileOverlay", "_slot"];

SLOG("setting overlay");

_profileOverlay setVariable ["_profile", _profile];

_loginHandler = {
    params ["_ctrl"];
    private _profile = _ctrl getVariable ["_profile", EMPTY_HASH];
    closeDialog 1;
    [_profile] spawn X11_fnc_login;
};

_profileOverlay ctrlAddEventHandler ["MouseButtonDown", _loginHandler];


