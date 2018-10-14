#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Equipment_Dialog";
waitUntil {!isNull findDisplay 1102};

private _vendorDisplay = findDisplay 1102;
private _listBox = _vendorDisplay displayCtrl 2500;
private _textboxReputation = _vendorDisplay displayCtrl 2002;
private _textboxInfos = _vendorDisplay displayCtrl 2001;
private _buttonEquip = _vendorDisplay displayCtrl 2600;
private _currentReputation = player getVariable [KEY_REPUTATION, 0];

private _itemsHash = [REP_ITEMS, []] call CBA_fnc_hashCreate;
private _itemKeys = [_itemsHash] call CBA_fnc_hashKeys;

// assign handler data to button
_buttonEquip setVariable ["_itemsHash", _itemsHash];
_buttonEquip setVariable ["_currentReputation", _currentReputation];
_buttonEquip setVariable ["_textboxInfos", _textboxInfos];
_buttonEquip setVariable ["_listBox", _listBox];

// assign handler data to listBox
_listBox setVariable ["_itemsHash", _itemsHash];
_listBox setVariable ["_currentReputation", _currentReputation];
_listBox setVariable ["_textboxInfos", _textboxInfos];

_textboxReputation ctrlSetText format[localize "str.dpl.equipment.vendor.rep", str _currentReputation];

// fill listbox with items
{ _listBox lbAdd _x; } forEach _itemKeys;

// add events
_buttonEquip ctrlAddEventHandler ["MouseButtonDown", { call X11_fnc_equipHandler}];
_listBox ctrlAddEventHandler ["LBSelChanged", { call X11_fnc_selectHandler}];
