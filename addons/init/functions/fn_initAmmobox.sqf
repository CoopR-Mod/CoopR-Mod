#include "script_component.hpp"

params [["_ammobox", objNull]];

if (_ammobox isEqualTo objNull) exitWith { ERROR("_ammobox variable was not set") };

COOPR_AMMOBOX = _ammobox;

if (call coopr_fnc_isACE3Active) then {
    COOPR_AMMOBOX addAction ["Get ammo", {
            [_this select 0, _this select 1] call ace_arsenal_fnc_openBox;
    } , [], 0.5, true, true, "", "true"];
};
