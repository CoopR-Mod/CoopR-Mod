#include "script_component.hpp"

params ["_slot"];

disableSerialization;

DEBUG("initialising new profile ui");

waitUntil {!isNull findDisplay 1103};

private _newCharacterDisplay = findDisplay 1103;

private _nameTextEdit = _newCharacterDisplay displayCtrl 3400;
private _infoText = _newCharacterDisplay displayCtrl 3003;
private _roleSelectBox = _newCharacterDisplay displayCtrl 3100;
private _createButton = _newCharacterDisplay displayCtrl 3600;
private _picture = _newCharacterDisplay displayCtrl 3200;

private _rolesHash = [COOPR_CHARACTER_ROLES, []] call CBA_fnc_hashCreate;
private _roleNames = [_rolesHash] call CBA_fnc_hashKeys;

_createButton setVariable ["_nameTextEdit", _nameTextEdit];
_createButton setVariable ["_infoText", _infoText];
_createButton setVariable ["_roleSelectBox", _roleSelectBox];
_createButton setVariable ["_rolesHash", _rolesHash];
_createButton setVariable ["_slot", _slot];

{_roleSelectBox lbAdd _x} forEach _roleNames;
_roleSelectBox setVariable ["_rolesHash", _rolesHash];

// set default selection to first item
_roleSelectBox lbSetCurSel 0;

_roleSelectBox ctrlAddEventHandler ["LBSelChanged", { call coopr_fnc_roleSelectionEH}];
_createButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_createCharacterHandler}];

DEBUG("new profile ui initialized");

