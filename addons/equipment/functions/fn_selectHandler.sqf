#include "script_component.hpp"

private _ctrl = _this select 0;
private _index = _this select 1;

private _itemsHash = _ctrl getVariable ["_itemsHash", []];
private _currentReputation = _ctrl getVariable ["_currentReputation", 0];
private _textboxInfos = _ctrl getVariable ["_textboxInfos", objNull];
private _selectedItem = _ctrl lbText _index;
private _repNeeded = [_itemsHash, _selectedItem] call CBA_fnc_hashGet;

if (_repNeeded > _currentReputation) then {
    private _repRemain =  _repNeeded - _currentReputation;
    _textboxInfos ctrlSetStructuredText composeText [ format [localize "str.coopr.equipment.vendor.repneeded", _repNeeded], lineBreak,
                                                      format [localize "str.coopr.equipment.vendor.remain", _repRemain]];
}else {
    _textboxInfos ctrlSetStructuredText parseText format["<t size='2' color='#68b25c'>%1</t>", localize "str.coopr.equipment.vendor.allowed"];
};
