#include "script_component.hpp"

params [["_object", objNull]];

if (_object isEqualTo objNull) exitWith { false };

(count itemCargo _object == 0) and (count weaponCargo _object == 0) and (count magazineCargo _object == 0) and (count backpackCargo _object == 0)

