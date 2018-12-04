#include "script_component.hpp"

params [["_ammobox", objNull]];

if (_commander isEqualTo objNull) exitWith { ERROR("_commander variable was not set") };

_ammobox addAction ["Get ammo", { [_this select 0, _this select 1] call ace_arsenal_fnc_openBox } , [], 0.5, true, true, "", "true"];
//GLOB(COOPR_BOX_EQUIPMENT) addAction ["Get Equipment", { [_this select 0, _this select 1] call ace_arsenal_fnc_openBox } , [], 0.5, true, true, "", "true"];
