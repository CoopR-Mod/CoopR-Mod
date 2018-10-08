#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Login_Dialog";

waitUntil {!isNull findDisplay 1101};

SLOG("initialising login dialog");

private _loginDisplay = findDisplay 1101;

//_loginDisplay displayAddEventHandler ["KeyDown", "true"];

private _profilePicture1 = _loginDisplay displayCtrl 1200;
private _profilePicture2 = _loginDisplay displayCtrl 1201;
private _profilePicture3 = _loginDisplay displayCtrl 1202;

private _profileInfos = [];
_profileInfos set [0, _loginDisplay displayCtrl 1100];
_profileInfos set [1, _loginDisplay displayCtrl 1101];
_profileInfos set [2, _loginDisplay displayCtrl 1102];

private _profileButtons = [];
_profileButtons set [0, _loginDisplay displayCtrl 1600];
_profileButtons set [1, _loginDisplay displayCtrl 1601];
_profileButtons set [2, _loginDisplay displayCtrl 1602];

private _profileOverlays = [];
_profileOverlays set [0, _loginDisplay displayCtrl 1210];
_profileOverlays set [1, _loginDisplay displayCtrl 1220];
_profileOverlays set [2, _loginDisplay displayCtrl 1230];

private _profileLabel1 = _loginDisplay displayCtrl 1001;
//private _profileLabel2 = _loginDisplay displayCtrl 1101;
//private _profileLabel3 = _loginDisplay displayCtrl 1602;


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
            private _isCharacterSlot = [_x] call x11_fnc_isCharacterSlot;
            private _overlay = _profileOverlays select _forEachIndex;
            private _info = _profileInfos select _forEachIndex;
            private _removeButton = _profileButtons select _forEachIndex;

            _info ctrlSetText localize "str.dpl.profiles.noprofile";
            // first put register handler on overlay and later overwrite with login
            _overlay setVariable ["_slot", _forEachIndex];
            private _handlerId = _overlay ctrlAddEventHandler ["MouseButtonDown", _registerHandler];
            _overlay setVariable ["_registerHandlerId", _handlerId];

            if (_isCharacterSlot) then {
                [_x, _info] call X11_fnc_setProfileSlot;
                [_x, _overlay, _forEachIndex] call X11_fnc_setOverlayHandler;
                [_removeButton, _forEachIndex] call X11_fnc_setRemoveButtonHandler;
            };

        } forEach _characterSlots;
    }
] call Promise_Create;




