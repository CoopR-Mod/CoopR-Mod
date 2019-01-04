#include "script_component.hpp"

params ["_target", "_caller"];

private _intelligenceItemsCount = 0;
private _items = items _caller;

ERROR("intel delivery not implemented yet");

//{ private _item = _x;
// { private _whiteListedItem = _x;

//    if(_item isEqualTo _whiteListedItem) then{
//     _intelligenceItemsCount = _intelligenceItemsCount + 1;
//     _caller removeItem _item;
//    };

// } forEach INTEL_ITEMS_WHITELIST;
//} forEach _items;

if(_intelligenceItemsCount <= 0) exitWith {
    systemChat localize "str.coopr.intelligence.chatter.nointelligence";
};

[_intelligenceItemsCount] remoteExec ["coopr_fnc_updateIntelProgress", EXEC_SERVER];
systemChat localize "str.coopr.intelligence.chatter.intelligence";

DEBUG2("%1 delivered %2 intelligence items", name _caller, _intelligenceItemsCount);
