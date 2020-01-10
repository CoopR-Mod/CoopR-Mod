#include "script_component.hpp"
//
// PX_fnc_stringReplace :: Replace substrings
// Author: Colin J.D. Stewart
// Usage: ["xxx is awesome, I love xxx!", "xxx", "Arma"] call PX_fnc_stringReplace;
//

params["_str", "_find", "_replace"];

private _return = "";
private _len = count _find;
private _pos = _str find _find;

while {(_pos != -1) && (count _str > 0)} do {
    _return = _return + (_str select [0, _pos]) + _replace;

    _str = (_str select [_pos+_len]);
    _pos = _str find _find;
};
_return + _str;
