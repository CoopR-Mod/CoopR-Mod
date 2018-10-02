#include "..\..\constants.hpp"

params ["_profile", "_profileOverlay", "_slot"];

_registerHandler = {
    params ["_ctrl"];
    private _slot = _ctrl getVariable ["_slot", _slot];
    closeDialog 1;
    [_slot] spawn X11_fnc_showNewProfileDialog;
};

_loginHandler = {
    params ["_control"];
    ctrlParent _control closeDisplay 0;
    [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];
};

if (_profile call X11_fnc_isProfileEmpty) then {
    _profileOverlay ctrlAddEventHandler ["MouseButtonDown", _registerHandler];
}else {
    _profileOverlay ctrlAddEventHandler ["MouseButtonDown", _loginHandler];
};


