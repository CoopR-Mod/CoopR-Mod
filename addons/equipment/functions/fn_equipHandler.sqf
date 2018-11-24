#include "script_component.hpp"

private _ctrl = _this select 0;

private _itemsHash = _ctrl getVariable ["_itemsHash", []];
private _currentReputation = _ctrl getVariable ["_currentReputation", 0];
private _textboxInfos = _ctrl getVariable ["_textboxInfos", objNull];
private _listBox = _ctrl getVariable ["_listBox", objNull];
private _index = lbCurSel _listBox;

if (_index != -1) then {
private _selectedItem = _listBox lbText _index;
private _repNeeded = [_itemsHash, _selectedItem] call CBA_fnc_hashGet;

if (_repNeeded > _currentReputation) exitWith {
    [format ["not enough rep pts for item: %1", _selectedItem], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    _textboxInfos ctrlSetStructuredText composeText [localize "str.coopr.equipment.vendor.norep"];
};

player addWeapon _selectedItem;
};
