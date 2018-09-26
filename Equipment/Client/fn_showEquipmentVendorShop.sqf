#include "..\..\globals.hpp"
#include "..\constants.hpp"

disableSerialization;

createDialog "X11_Equipment_Dialog";
waitUntil {!isNull findDisplay 1102};

private _vendorDisplay = findDisplay 1102;
private _listBox = _vendorDisplay displayCtrl 1500;
private _textboxInfos = _vendorDisplay displayCtrl 1001;
private _textboxReputation = _vendorDisplay displayCtrl 1002;
private _buttonEquip = _vendorDisplay displayCtrl 1600;
private _currentReputation = player getVariable [KEY_REPUTATION, 0];

_textboxReputation ctrlSetText format["Deine momentane Reputation ist: %1", str _currentReputation];

{
  lbAdd [1500, _x];
} forEach REPUTATION_ITEMS;

_equipHandler = {
  private _index = lbCurSel 1500;

  [format ["DEBUG: %1", _index], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
  if (_index != -1) then {
    private _selectedItem = lbText [1500, _index];
    player addWeapon _selectedItem;
    [format ["DEBUG: %1", _selectedItem], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
  };

};

_buttonEquip ctrlAddEventHandler ["MouseButtonDown", _equipHandler];
