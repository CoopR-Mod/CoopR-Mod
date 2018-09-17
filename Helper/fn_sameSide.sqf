#include "..\globals.hpp"

params[
    ["_first", sideUnknown, [objNull, sideEmpty, grpNull]],
    ["_second", sideUnknown, [objNull, sideEmpty, grpNull]]
];

if (typeName _first isEqualTo "OBJECT" or typeName _first == "GROUP" ) then {
 _first = side _first;
};

if (typeName _second isEqualTo "OBJECT" or typeName _second isEqualTo "GROUP") then {
 _second = side _second;
};

_first isEqualTo _second;
