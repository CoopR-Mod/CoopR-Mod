#include "..\..\globals.hpp"
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Equipment_Dialog";
waitUntil {!isNull findDisplay 1102};

private _vendorDisplay = findDisplay 1102;
private _listBox = _vendorDisplay displayCtrl 1500;
private _textboxReputation = _vendorDisplay displayCtrl 1002;
private _buttonEquip = _vendorDisplay displayCtrl 1600;
private _currentReputation = player getVariable [KEY_REPUTATION, 0];

private _itemsHash = [REP_ITEMS, []] call CBA_fnc_hashCreate;
private _itemKeys = [_itemsHash] call CBA_fnc_hashKeys;

_textboxReputation ctrlSetText format["Deine momentane Reputation ist: %1", str _currentReputation];

{
  lbAdd [1500, _x];
} forEach _itemKeys;

_equipHandler = {
  private _index = lbCurSel 1500;
  private _vendorDisplay = findDisplay 1102;
  private _itemsHash = [REP_ITEMS, []] call CBA_fnc_hashCreate;
  private _currentReputation = player getVariable [KEY_REPUTATION, 0];
  private _textboxInfos = _vendorDisplay displayCtrl 1001;

  if (_index != -1) then {
    private _selectedItem = lbText [1500, _index];
    private _repNeeded = [_itemsHash, _selectedItem] call CBA_fnc_hashGet;

    if (_repNeeded > _currentReputation) exitWith {
        [format ["not enough rep pts for item: %1", _selectedItem], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
        _textboxInfos ctrlSetText "Du hast nicht genug Reputation um diese Ausruestung zu erhalten";
    };

    player addWeapon _selectedItem;
  };

};

_buttonEquip ctrlAddEventHandler ["MouseButtonDown", _equipHandler];
