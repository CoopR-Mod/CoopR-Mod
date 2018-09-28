#include "..\..\globals.hpp"
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Equipment_Dialog";
waitUntil {!isNull findDisplay 1102};

private _vendorDisplay = findDisplay 1102;
private _listBox = _vendorDisplay displayCtrl 1500;
private _textboxReputation = _vendorDisplay displayCtrl 1002;
private _textboxInfos = _vendorDisplay displayCtrl 1001;
private _buttonEquip = _vendorDisplay displayCtrl 1600;
private _currentReputation = player getVariable [KEY_REPUTATION, 0];

private _itemsHash = [REP_ITEMS, []] call CBA_fnc_hashCreate;
private _itemKeys = [_itemsHash] call CBA_fnc_hashKeys;

_buttonEquip setVariable ["_itemsHash", _itemsHash];
_buttonEquip setVariable ["_currentReputation", _currentReputation];
_buttonEquip setVariable ["_textboxInfos", _textboxInfos];
_buttonEquip setVariable ["_listBox", _listBox];

_textboxReputation ctrlSetText format["Deine momentane Reputation ist: %1", str _currentReputation];

{ _listBox lbAdd _x; } forEach _itemKeys;

_equipHandler = {
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
        _textboxInfos ctrlSetStructuredText (composeText ["Du hast nicht genug Reputation", lineBreak, "um diese Ausruestung zu erhalten"]);
    };

    player addWeapon _selectedItem;
  };

};

_buttonEquip ctrlAddEventHandler ["MouseButtonDown", _equipHandler];
