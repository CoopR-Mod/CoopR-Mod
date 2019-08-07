#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay GUI_ID_LOGIN_DIALOG_NEW};

DEBUG("initialising login ui");

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG_NEW;
private _characterList = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_LIST;

for "_i" from 0 to 3 do {
    private _rowArray = ((ctAddRow _characterList) select 1);
    _rowArray params ["_Role", "_Name", "_Main", "_Secondary", "_Button", "_Select"];
    if (["asd"] isEqualTo []) then {
        _Button ctrlAddEventHandler ["onClick", {[_i] call CoopR_fnc_createNewCharacterPanel}];
    } else {
        _Role ctrlSetText "RoleText";
        _Name ctrlSetText "NameText";
        _Main ctrlSetText "MainText";
        _Secondary ctrlAddEventHandler ["onClick", {[_i] call Coopr_fnc_playCharacterPanel}];
        _Button ctrlEnable false;
        _Select ctrlShow false;
    };
};
