#include "script_component.hpp"

params ["_profileInfos", "_profileOverlays", "_profileButtons", "_characterPictures"];

LSTART("UPDATE LOGIN DIALOG");
_loginDisplay displayRemoveAllEventHandlers "Unload";
_loginDisplay displayAddEventHandler ["Unload", {call coopr_fnc_loginDialogUnloadHandler}];

{ _x ctrlSetText localize "str.coopr.profiles.fetch" } forEach _profileInfos;

[SERVER, "coopr_fnc_getCharacterSlots", [getPlayerUID player], //request-related
    [_profileInfos, _profileOverlays, _profileButtons, _characterPictures], {
        params ["_args", "_result"];
        _args params ["_profileInfos", "_profileOverlays", "_profileButtons", "_characterPictures"];

        private _characterSlots = _result;
        {
            private _isNotEmptySlot = [_x] call coopr_fnc_isCharacterSlot;
            private _overlay = _profileOverlays select _forEachIndex;
            private _picture = _characterPictures select _forEachIndex;
            private _info = _profileInfos select _forEachIndex;
            private _removeButton = _profileButtons select _forEachIndex;

            _info ctrlSetText localize "str.coopr.profiles.noprofile";

            // set data to controls
            _overlay setVariable ["_slot", _forEachIndex];
            private _handlerId = _overlay ctrlAddEventHandler ["MouseButtonDown", {call coopr_fnc_newCharacterButtonHandler}];
            _overlay setVariable ["_registerHandlerId", _handlerId];

            if (_isNotEmptySlot) then {
                [_x, _info] call coopr_fnc_setCharacterInfo;
                [_x, _overlay, _forEachIndex] call coopr_fnc_setOverlayHandler;
                [_x, _picture, _forEachIndex] call coopr_fnc_updateCharacterPicture;
                // add logic to delete character
                _removeButton setVariable ["_slot", _forEachIndex];
                _removeButton ctrlAddEventHandler ["MouseButtonDown",  {call coopr_fnc_removeCharacterHandler}];
            };

        } forEach _characterSlots;
        LEND("UPDATE LOGIN DIALOG");
    }
] call Promise_Create;
