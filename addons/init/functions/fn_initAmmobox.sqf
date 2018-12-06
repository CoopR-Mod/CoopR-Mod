#include "script_component.hpp"

params [["_ammobox", objNull]];

if (_ammobox isEqualTo objNull) exitWith { ERROR("_ammobox variable was not set") };

_ammobox addAction ["Get ammo", {
    if (call coopr_fnc_isACE3Active) then {
        [_this select 0, _this select 1] call ace_arsenal_fnc_openBox;
    } then {
        SETUPERROR("Ammobox module does only work with ACE3");
    }
} , [], 0.5, true, true, "", "true"];
