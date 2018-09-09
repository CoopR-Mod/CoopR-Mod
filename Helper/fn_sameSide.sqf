params[
    ["_first", sideUnknown, [objNull, sideEmpty]],
    ["_second", sideUnknown, [objNull, sideEmpty]]
];

_first = [_first, side _first] select (typeName _first == "OBJECT");
_second = [_second, side _second] select (typeName _second == "OBJECT");

_first == _second;
