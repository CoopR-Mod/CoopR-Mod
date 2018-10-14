#include "..\constants.hpp"

params ["_profileInfos", "_profileOverlays", "_profileButtons"];

DEBUG("adding unload event");
_loginDisplay displayAddEventHandler ["Unload", {call X11_fnc_loginDialogUnloadHandler}];

{ _x ctrlSetText localize "str.dpl.profiles.fetch" } forEach _profileInfos;

[SERVER, "X11_fnc_getCharacterSlots", [getPlayerUID player], //request-related
    [_profileInfos, _profileOverlays, _profileButtons], {
        params ["_args", "_result"];
        _args params ["_profileInfos", "_profileOverlays", "_profileButtons"];

        private _characterSlots = _result;
        {
            private _isNotEmptySlot = [_x] call x11_fnc_isCharacterSlot;
            private _overlay = _profileOverlays select _forEachIndex;
            private _info = _profileInfos select _forEachIndex;
            private _removeButton = _profileButtons select _forEachIndex;

            _info ctrlSetText localize "str.dpl.profiles.noprofile";

            // set data to controls
            _overlay setVariable ["_slot", _forEachIndex];
            private _handlerId = _overlay ctrlAddEventHandler ["MouseButtonDown", {call X11_fnc_newCharacterButtonHandler}];
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
