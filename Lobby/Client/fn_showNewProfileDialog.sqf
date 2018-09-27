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


// TODO: Escape pres returns to Login
// _loginDisplay displayAddEventHandler ["KeyDown", "true"];

{_specCombobox lbAdd _x} forEach _classNames;

_createHandler = {
     private _ctrl = _this select 0;
     private _nameTextEdit = _ctrl getVariable ["_nameTextEdit", objNull];

     private _name = ctrlText _nameTextEdit;

    [format ["DEBUG: %1", _name], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

};

_createButton ctrlAddEventHandler ["MouseButtonDown", _createHandler];
