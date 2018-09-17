#include "..\globals.hpp"

params[
    ["_first", sideUnknown, [objNull, sideEmpty, grpNull]],
    ["_second", sideUnknown, [objNull, sideEmpty, grpNull]]
];

if (_first isEqualType "OBJECT" or _first isEqualType "GROUP" ) then {
 _first = side _first;
};

if (_second isEqualType "OBJECT" or _second isEqualType "GROUP") then {
 _second = side _second;
};

_first isEqualTo _second;
