#include "script_component.hpp"

params [["_state", []]];

if(not ([_state] call CBA_fnc_isHash)) exitWith {
    ERROR("argument has to be a cba hash");
};

private _keys = [_state] call CBA_fnc_hashKeys;
{
  private _key = _x;
  private _value = [_state, _key] call CBA_fnc_hashGet;
  DEBUG3("%1 = %2", _key, _value);
} forEach _keys;
