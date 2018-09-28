#include "..\..\globals.hpp"
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_NewProfile_Dialog";
waitUntil {!isNull findDisplay 1103};

private _newProfileDisplay = findDisplay 1103;
private _nameTextEdit = _newProfileDisplay displayCtrl 3400;
private _specCombobox = _newProfileDisplay displayCtrl 3100;
private _createButton = _newProfileDisplay displayCtrl 3600;
private _picture = _newProfileDisplay displayCtrl 3200;

private _classesHash = [PROFILE_CLASSES, []] call CBA_fnc_hashCreate;
private _classNames = [_classesHash] call CBA_fnc_hashKeys;

_createButton setVariable ["_nameTextEdit", _nameTextEdit];
_createButton setVariable ["_specCombobox", _specCombobox];
_createButton setVariable ["_classesHash", _classesHash];

// TODO: Escape pres returns to Login
// _loginDisplay displayAddEventHandler ["KeyDown", "true"];

{_specCombobox lbAdd _x} forEach _classNames;

_createHandler = {
     private _ctrl = _this select 0;
     private _nameTextEdit = _ctrl getVariable ["_nameTextEdit", objNull];
     private _specCombobox = _ctrl getVariable ["_specCombobox", objNull];
     private _classesHash = _ctrl getVariable ["_classesHash", objNull];

     private _name = ctrlText _nameTextEdit;
     private _index = lbCurSel _specCombobox;
     private _className = _specCombobox lbText _index;
     private _classId = [_classesHash, _className] call CBA_fnc_hashGet;

     private _statsHash = [_uid, _name, _classId, 0, 500, false, 0] call X11_fnc_createPlayerProfile;
     [_statsHash, KEY_LOADOUT, NEW_PLAYER_LOADOUT] call CBA_fnc_hashSet;

    [format ["DEBUG: %1", _name], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

};

_createButton ctrlAddEventHandler ["MouseButtonDown", _createHandler];
