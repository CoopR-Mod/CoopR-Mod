#include "..\globals.hpp"

params ["_target", "_caller"];

private _intelItemsCount = 0;
private _items = items _caller;

{ private _item = _x;
 { private _whiteListedItem = _x;

    if(_item isEqualTo _whiteListedItem) then{
     _intelItemsCount = _intelItemsCount + 1;
     _caller removeItem _item;
    };

 } forEach INTEL_ITEMS_WHITELIST;
} forEach _items;

if(_intelItemsCount <= 0) exitWith {
    _target commandChat "Wow Klasse! Du hast ganze 0 Dokumente dabei...";
};

[intelItemsCount] remoteExec ["X11_fnc_updateIntelProgress", 2];
_target commandChat "Gute Arbeit Soldat. Weitermachen.";
[format ["%1 delivered %2 intel items", name _caller, _intelItemsCount], DEBUG_STR_PLAYER_ACTION, DEBUG_CFG] call CBA_fnc_debug;

