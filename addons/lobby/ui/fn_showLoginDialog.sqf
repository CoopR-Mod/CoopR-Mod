#include "script_component.hpp"

#define ARRAY 1

disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG_NEW};

DEBUG("initialising login ui");

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG_NEW;
private _characterListCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_LIST;

[EXEC_SERVER, "coopr_fnc_getCharacters", [getPlayerUID player], //request-related
    [_loginDialog, _characterListCtrl], {
        params ["_args", "_result"];
        private _characterSlots = _result;
        _args params ["_loginDialog", "_characterListCtrl"];
        {
            private _characterSlot = _x;
            private _rowArray = ((ctAddRow _characterListCtrl) select ARRAY);
            _rowArray params ["_roleColumn", "_nameColumn", "_mainWeaponPictureColumn", "_secondaryWeaponPictureColumn", "_newCharacterButton", "_selectCharacterButton"];
            _selectCharacterButton ctrlShow false;
            if (_characterSlot isEqualTo []) then {
                _newCharacterButton ctrlSetText "Create new character";
                _newCharacterButton ctrlAddEventHandler ["onClick", {[_i] call CoopR_fnc_createNewCharacterPanel}];
            } else {
                private _name = [_characterSlot, COOPR_KEY_NAME] call CBA_fnc_hashGet;
                private _reputation = [_characterSlot, COOPR_KEY_REPUTATION] call CBA_fnc_hashGet;
                private _money = [_characterSlot, COOPR_KEY_MONEY] call CBA_fnc_hashGet;
                private _state = [_characterSlot, COOPR_KEY_STATE] call CBA_fnc_hashGet;
                private _roleNamesHash = [COOPR_ROLE_NAMES, []] call CBA_fnc_hashCreate;
                private _roleId = [_characterSlot, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
                private _roleName = [_roleNamesHash, _roleId] call CBA_fnc_hashGet;
                private _woundedTimestamp = [_characterSlot, COOPR_KEY_WOUNDED_TIMESTAMP] call CBA_fnc_hashGet;

                private _roleImage = [_roleId] call coopr_fnc_getImageForRole;
                private _pathToImage = format ["\x\coopr\addons\lobby\data\images\%1", _roleImage];

                _roleColumn ctrlSetText _pathToImage;
                _nameColumn ctrlSetText _name;
                _mainWeaponPictureColumn ctrlSetText "MainText";
                _secondaryWeaponPictureColumn ctrlAddEventHandler ["onClick", {[_i] call Coopr_fnc_playCharacterPanel}];
                _newCharacterButton ctrlEnable false;
                _selectCharacterButton ctrlShow true;
            };
        } forEach _characterSlots;
    }
] call Promise_Create;
