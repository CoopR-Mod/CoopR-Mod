#include "..\globals.hpp"

params[
    ["_first", sideUnknown, [objNull, sideEmpty, grpNull]],
    ["_second", sideUnknown, [objNull, sideEmpty, grpNull]]
];
if (_first isEqualTypeAny [objNull, grpNull]) then {
 _first = side _first;
};

if (_second isEqualTypeAny [objNull, grpNull]) then {
 _second = side _second;
};

_first isEqualTo _second;
