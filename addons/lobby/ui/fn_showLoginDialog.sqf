#include "script_component.hpp"

#define ARRAY 1

createDialog COOPR_LOGIN;
disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG};

DEBUG("initialising login ui");
// setup cam position in front of lobby agent
[] spawn { call coopr_fnc_initLobbyCam };

// init lobby agent
hideObject COOPR_LOBBY_AGENT;
COOPR_LOBBY_AGENT setUnitLoadout EMPTY_LOADOUT;
COOPR_LOBBY_AGENT switchMove "";

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
_loginDialog displayRemoveAllEventHandlers "Unload";
_loginDialog displayAddEventHandler ["Unload", { [] spawn { call coopr_fnc_showLoginDialog; }}];

// initial row setup
private _characterListCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_LIST;
{
    private _rowArray = ((ctAddRow _characterListCtrl) select ARRAY);
    _rowArray params ["_roleColumn", "_nameColumn", "_levelColumn", "_stateColumn", "_newCharacterButton", "_selectCharacterButton"];
    _newCharacterButton ctrlSetText localize "str.coopr.character.new.create";
} forEach [0,1,2];


//load characters for current user/player
[EXEC_SERVER, "coopr_fnc_getCharacters", [getPlayerUID player], //request-related
    [_loginDialog], {
        params ["_args", "_result"];
        private _characters = _result;
        _args params ["_loginDialog"];
        private _firstFoundCharacter = objNull;

        if (isNull findDisplay GUI_ID_LOGIN_DIALOG) exitWith { DEBUG("dialog closed before callback ready")};

        private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
        private _characterListCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_LIST;
        // clear initial rows
        ctClear _characterListCtrl;

        {
            private _characterHash = _x;
            private _rowArray = ((ctAddRow _characterListCtrl) select ARRAY);
            _rowArray params ["_roleColumn", "_nameColumn", "_levelColumn", "_stateColumn", "_newCharacterButton", "_selectCharacterButton"];

            // empty slot
            if (_characterHash isEqualTo []) then {
                private _ctrlParams = [_forEachIndex];
                _newCharacterButton ctrlSetText localize "str.coopr.character.new.create";
                _newCharacterButton setVariable ["_params", _ctrlParams];
                _newCharacterButton ctrlRemoveAllEventHandlers "MouseButtonDown";
                _newCharacterButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_showCreationDialog }];
                _selectCharacterButton ctrlShow false;

            // occupied slot
            } else {
                private _roleNamesHash = [COOPR_ROLE_NAMES, []] call CBA_fnc_hashCreate;

                private _name = [_characterHash, COOPR_KEY_NAME] call CBA_fnc_hashGet;
                private _reputation = [_characterHash, COOPR_KEY_REPUTATION] call CBA_fnc_hashGet;
                private _money = [_characterHash, COOPR_KEY_MONEY] call CBA_fnc_hashGet;
                private _state = [_characterHash, COOPR_KEY_STATE] call CBA_fnc_hashGet;
                private _roleId = [_characterHash, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
                private _roleName = [_roleNamesHash, _roleId] call CBA_fnc_hashGet;
                private _woundedTimestamp = [_characterHash, COOPR_KEY_WOUNDED_TIMESTAMP] call CBA_fnc_hashGet;

                private _roleIcon = [_roleId, "icon"] call coopr_fnc_getRoleData;

                _roleColumn ctrlSetText _roleIcon;
                _nameColumn ctrlSetText _name;
                _levelColumn ctrlSetText (format ["Level: %1", 0]); // add level property to character

                // determine state acrynoym
                private _stateLabel = "none";
                switch (_state) do {
                    case COOPR_STATE_OK: {
                       _stateLabel = "OK";
                    };
                    case COOPR_STATE_WIA: {
                       _stateLabel = "WIA";
                    };
                    case COOPR_STATE_KIA: {
                       _stateLabel = "KIA";
                    };
                    case COOPR_STATE_HOSTAGE: {
                       _stateLabel = "HST";
                    };
                };

                _stateColumn ctrlSetText (format ["State: %1", _stateLabel]);
                _selectCharacterButton setVariable ["_characterHash", _characterHash];
                _selectCharacterButton ctrlRemoveAllEventHandlers "MouseButtonDown";
                _selectCharacterButton ctrlAddEventHandler ["MouseButtonDown", {
                    params ["_ctrl"];
                    private _characterHash = _ctrl getVariable ["_characterHash", objNull];
                    [_characterHash] call coopr_fnc_showCharacterSelectionDisplay;
                 }];
                _newCharacterButton ctrlEnable false;
                _newCharacterButton ctrlShow false;

                _firstFoundCharacter = _characterHash;
            };
        } forEach _characters;

        // show the first character on the screen
        if (!(_firstFoundCharacter isEqualTo objNull)) then {
            [_firstFoundCharacter] call coopr_fnc_showCharacterSelectionDisplay;
        };
    }
] call Promise_Create;
