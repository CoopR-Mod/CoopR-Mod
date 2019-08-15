#include "script_component.hpp"

#define ARRAY 1

disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG};

DEBUG("initialising login ui");
// setup cam position in front of character
private _playerDirection = getDir player;
private _camPos = [COOPR_LOBBY, 5, _playerDirection] call BIS_fnc_relPos;
private _cam = "camera" camCreate _camPos;
_cam camSetTarget player;
_cam cameraEffect ["External", "FRONT"];
_cam camCommit 0;

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
private _characterListCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_LIST;
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;

//load characters for player
[EXEC_SERVER, "coopr_fnc_getCharacters", [getPlayerUID player], //request-related
    [_loginDialog, _characterListCtrl], {
        params ["_args", "_result"];
        private _characterSlots = _result;
        _args params ["_loginDialog", "_characterListCtrl"];
        {
            private _characterSlot = _x;
            private _rowArray = ((ctAddRow _characterListCtrl) select ARRAY);
            _rowArray params ["_roleColumn", "_nameColumn", "_mainWeaponPictureColumn", "_secondaryWeaponPictureColumn", "_newCharacterButton", "_selectCharacterButton"];

            // empty slot
            if (_characterSlot isEqualTo []) then {
                private _ctrlParams = [_forEachIndex];
                _newCharacterButton ctrlSetText localize "str.coopr.character.new.create";
                _newCharacterButton setVariable ["_params", _ctrlParams];
                _newCharacterButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_showCreationDialog }];
                _selectCharacterButton ctrlShow false;

            // occupied slot
            } else {
                private _roleNamesHash = [COOPR_ROLE_NAMES, []] call CBA_fnc_hashCreate;

                private _name = [_characterSlot, COOPR_KEY_NAME] call CBA_fnc_hashGet;
                private _reputation = [_characterSlot, COOPR_KEY_REPUTATION] call CBA_fnc_hashGet;
                private _money = [_characterSlot, COOPR_KEY_MONEY] call CBA_fnc_hashGet;
                private _state = [_characterSlot, COOPR_KEY_STATE] call CBA_fnc_hashGet;
                private _roleId = [_characterSlot, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
                private _roleName = [_roleNamesHash, _roleId] call CBA_fnc_hashGet;
                private _woundedTimestamp = [_characterSlot, COOPR_KEY_WOUNDED_TIMESTAMP] call CBA_fnc_hashGet;

                private _roleImage = [_roleId] call coopr_fnc_getImageForRole;

                _roleColumn ctrlSetText _roleImage;
                _nameColumn ctrlSetText _name;
                _mainWeaponPictureColumn ctrlSetText "MainText";
                _secondaryWeaponPictureColumn ctrlSetText "SecondaryText";
                _selectCharacterButton setVariable ["_characterSlot", _characterSlot];
                _selectCharacterButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectCharacter }];
                _newCharacterButton ctrlEnable false;
                _newCharacterButton ctrlShow false;
            };
        } forEach _characterSlots;
    }
] call Promise_Create;
