#include "script_component.hpp"

params ["_character", "_profileOverlay", "_slot"];

private _state = [_character, COOPR_KEY_STATE] call CBA_fnc_hashGet;
private _registerHandlerId = _profileOverlay getVariable ["_registerHandlerId", -1];

if(_state isEqualTo COOPR_STATE_KIA or _state isEqualTo COOPR_STATE_WIA) exitWith {
    SLOG("character is kia/wia - disabling overlay button");
    _profileOverlay ctrlEnable false;
} ;

// in case it has been disabled before
_profileOverlay ctrlEnable true;
_profileOverlay setVariable ["_character", _character];

_loginHandler = {
    params ["_ctrl"];
    private _character = _ctrl getVariable ["_character", EMPTY_HASH];
    closeDialog 1;
    [_character] spawn coopr_fnc_login;
};

_profileOverlay ctrlRemoveEventHandler ["MouseButtonDown", _registerHandlerId];
_profileOverlay ctrlAddEventHandler ["MouseButtonDown", _loginHandler];


