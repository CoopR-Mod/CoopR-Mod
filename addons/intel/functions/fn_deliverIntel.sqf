#include "script_component.hpp"

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
    _target commandChat localize "str.coopr.intel.chatter.nointel";
};

[_intelItemsCount] remoteExec ["coopr_fnc_updateIntelProgress", SERVER];
_target commandChat localize "str.coopr.intel.chatter.intel";

FFLOG("%1 delivered %2 intel items", name _caller, _intelItemsCount);

