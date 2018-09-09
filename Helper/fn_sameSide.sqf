params[
    ["_first", sideUnknown, [objNull, sideEmpty]],
    ["_second", sideUnknown, [objNull, sideEmpty]]
];

if (typeName _first == "OBJECT") then
{
 _first = side _first;
};

if (typeName _second == "OBJECT") then
{
 _second = side _second;
};

_first == _second;
