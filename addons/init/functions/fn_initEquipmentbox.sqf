#include "script_component.hpp"

params [["_equipmentbox", objNull]];

if (_equipmentbox isEqualTo objNull) exitWith { ERROR("_equipmentbox variable was not set") };

_equipmentbox addAction ["Get equipment", {
    if (call coopr_fnc_isACE3Active) then {
        [_this select 0, _this select 1] call ace_arsenal_fnc_openBox;
    } else {
        SETUPERROR("Equipmentbox module does only work with ACE3");
    }
} , [], 0.5, true, true, "", "true"];
