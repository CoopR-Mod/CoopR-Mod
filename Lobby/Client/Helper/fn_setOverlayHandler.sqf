#include "..\..\constants.hpp"

params ["_profile", "_profileOverlay", "_slot"];

_profileOverlay setVariable ["_profile", _profile];
_profileOverlay setVariable ["_slot", _slot];

LDEBUG(before, _profile);

_registerHandler = {
    params ["_ctrl"];
    private _slot = _ctrl getVariable ["_slot", -1];
    closeDialog 1;
    [_slot] spawn X11_fnc_showNewProfileDialog;
};

_loginHandler = {
    params ["_ctrl"];
    private _profile = _ctrl getVariable ["_profile", EMPTY_HASH];
    closeDialog 1;
    [_profile] spawn X11_fnc_login;
};

if (_profile call X11_fnc_isProfileEmpty) then {
    _profileOverlay ctrlAddEventHandler ["MouseButtonDown", _registerHandler];
}else {
    _profileOverlay ctrlAddEventHandler ["MouseButtonDown", _loginHandler];
};


