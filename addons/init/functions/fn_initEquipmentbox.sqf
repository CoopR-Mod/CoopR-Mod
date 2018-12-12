#include "script_component.hpp"

params [["_equipmentbox", objNull]];

if (_equipmentbox isEqualTo objNull) exitWith { ERROR("_equipmentbox variable was not set") };

COOPR_EQUIPMENTBOX = _equipmentbox;

if (call coopr_fnc_isACE3Active) then {
    COOPR_EQUIPMENTBOX addAction ["Get equipment", {
            [_this select 0, _this select 1] call ace_arsenal_fnc_openBox;
    } , [], 0.5, true, true, "", "true"];
}
