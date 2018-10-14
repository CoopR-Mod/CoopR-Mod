#include "..\constants.hpp"

params ["_profileInfos", "_profileOverlays", "_profileButtons"];

_onUnload = {
    [] spawn {
        sleep 3;
        private _playerLoggedIn = player getVariable [KEY_PLAYER_LOGGEDIN, false];
        if(!_playerLoggedIn and isNull findDisplay 1103) then {
            DEBUG("called");
            call X11_fnc_showLoginDialog;
        }
    }
};

_loginDisplay displayAddEventHandler ["Unload", _onUnload];
{ _x ctrlSetText localize "str.dpl.profiles.fetch" } forEach _profileInfos;

[SERVER, "X11_fnc_getCharacterSlots", [getPlayerUID player], //request-related
    [_profileInfos, _profileOverlays, _profileButtons], {
        params ["_args", "_result"];
        _args params ["_profileInfos", "_profileOverlays", "_profileButtons"];

        _registerHandler = {
            params ["_ctrl"];
            private _slot = _ctrl getVariable ["_slot", -1];
            closeDialog 1;
            [_slot] spawn X11_fnc_showNewProfileDialog;
        };

        private _characterSlots = _result;
        {
            private _isNotEmptySlot = [_x] call x11_fnc_isCharacterSlot;
            private _overlay = _profileOverlays select _forEachIndex;
            private _info = _profileInfos select _forEachIndex;
            private _removeButton = _profileButtons select _forEachIndex;

            _info ctrlSetText localize "str.dpl.profiles.noprofile";

            // set data to controls
            _overlay setVariable ["_slot", _forEachIndex];
            private _handlerId = _overlay ctrlAddEventHandler ["MouseButtonDown", _registerHandler];
            _overlay setVariable ["_registerHandlerId", _handlerId];

            if (_isNotEmptySlot) then {
                [_x, _info] call X11_fnc_setCharacterInfo;
                [_x, _overlay, _forEachIndex] call X11_fnc_setOverlayHandler;
                // add logic to delete character
                _removeButton setVariable ["_slot", _forEachIndex];
                _removeButton ctrlAddEventHandler ["MouseButtonDown",  {call X11_fnc_removeCharacterHandler}];
            };

        } forEach _characterSlots;
    }
] call Promise_Create;
