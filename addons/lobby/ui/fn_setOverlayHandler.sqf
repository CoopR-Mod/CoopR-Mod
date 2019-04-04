#include "script_component.hpp"

params ["_characterHash", "_profileOverlay", "_slot"];

private _state = [_characterHash, COOPR_KEY_STATE] call CBA_fnc_hashGet;
private _registerHandlerId = _profileOverlay getVariable ["_registerHandlerId", -1];

if(_state isEqualTo COOPR_STATE_KIA or _state isEqualTo COOPR_STATE_WIA) exitWith {
    DEBUG("character is kia/wia - disabling overlay button");
    _profileOverlay ctrlEnable false;
} ;

// in case it has been disabled before
_profileOverlay ctrlEnable true;
_profileOverlay setVariable ["_characterHash", _characterHash];

_loginHandler = {
    params ["_ctrl"];
    private _characterHash = _ctrl getVariable ["_characterHash", EMPTY_HASH];
    closeDialog 1;
    [_characterHash] spawn coopr_fnc_login;
};

DEBUG2("removing register handler of slot %1", _slot);
_profileOverlay ctrlRemoveEventHandler ["MouseButtonDown", _registerHandlerId];
DEBUG2("register login handler for slot %1", _slot);
_profileOverlay ctrlAddEventHandler ["MouseButtonDown", _loginHandler];


