#include "script_component.hpp"

params [["_object", objNull]];

if (_object isEqualTo objNull) exitWith { false };

(count itemCargo _object isEqualTo 0) and (count weaponCargo _object isEqualTo 0) and (count magazineCargo _object isEqualTo 0) and (count backpackCargo _object isEqualTo 0)

