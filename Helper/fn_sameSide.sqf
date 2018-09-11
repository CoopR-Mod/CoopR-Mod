params[
    ["_first", sideUnknown, [objNull, sideEmpty, grpNull]],
    ["_second", sideUnknown, [objNull, sideEmpty, grpNull]]
];

if (typeName _first == "OBJECT" or typeName _first == "GROUP" ) then {
 _first = side _first;
};

if (typeName _second == "OBJECT" or typeName _second == "GROUP") then {
 _second = side _second;
};

_first == _second;
