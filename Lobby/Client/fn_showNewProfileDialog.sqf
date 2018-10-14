
#include "..\constants.hpp"

params ["_slot"];

disableSerialization;

SLOG("initialising new profile dialog");

createDialog "X11_NewProfile_Dialog";
waitUntil {!isNull findDisplay 1103};

private _newProfileDisplay = findDisplay 1103;

_onUnload = {
    [] spawn X11_fnc_showLoginDialog;
};

_newProfileDisplay displayAddEventHandler ["Unload", _onUnload];

private _nameTextEdit = _newProfileDisplay displayCtrl 3400;
private _specCombobox = _newProfileDisplay displayCtrl 3100;
private _createButton = _newProfileDisplay displayCtrl 3600;
private _picture = _newProfileDisplay displayCtrl 3200;

private _classesHash = [PROFILE_CLASSES, []] call CBA_fnc_hashCreate;
private _classNames = [_classesHash] call CBA_fnc_hashKeys;

_createButton setVariable ["_nameTextEdit", _nameTextEdit];
_createButton setVariable ["_specCombobox", _specCombobox];
_createButton setVariable ["_classesHash", _classesHash];
_createButton setVariable ["_slot", _slot];

{_specCombobox lbAdd _x} forEach _classNames;

_createButton ctrlAddEventHandler ["MouseButtonDown", { call X11_fnc_createCharacterHandler}];
