#include "script_component.hpp"

disableSerialization;

createDialog "coopr_Equipment_Dialog";
waitUntil {!isNull findDisplay 1102};

private _vendorDisplay = findDisplay 1102;
private _listBox = _vendorDisplay displayCtrl 2500;
private _textboxReputation = _vendorDisplay displayCtrl 2002;
private _textboxInfos = _vendorDisplay displayCtrl 2001;
private _buttonEquip = _vendorDisplay displayCtrl 2600;
private _currentReputation = player getVariable [COOPR_KEY_REPUTATION, 0];

private _itemsHash = [COOPR_REP_ITEMS_WEST, []] call CBA_fnc_hashCreate;
private _itemKeys = [_itemsHash] call CBA_fnc_hashKeys; // ids

// assign handler data to button
_buttonEquip setVariable ["_itemsHash", _itemsHash];
_buttonEquip setVariable ["_currentReputation", _currentReputation];
_buttonEquip setVariable ["_textboxInfos", _textboxInfos];
_buttonEquip setVariable ["_listBox", _listBox];

// assign handler data to listBox
_listBox setVariable ["_itemsHash", _itemsHash];
_listBox setVariable ["_currentReputation", _currentReputation];
_listBox setVariable ["_textboxInfos", _textboxInfos];

_textboxReputation ctrlSetText format[localize "str.coopr.equipment.vendor.rep", str _currentReputation];

// fill listbox with items
{
    private _values = [_itemsHash, _x] call CBA_fnc_hashGet;
    private _itemName = _values select 1;
    _listBox lbAdd _itemName;
     DEBUG(_forEachIndex);
     DEBUG(_x);
    _listBox lbSetData [_forEachIndex, _x];
} forEach _itemKeys;

// add events
_buttonEquip ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_equipHandler}];
_listBox ctrlAddEventHandler ["LBSelChanged", { call coopr_fnc_selectHandler}];
