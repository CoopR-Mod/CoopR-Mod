#include "script_component.hpp"

GLOB(COOPR_BOX_MAGAZINES) addAction ["Get Magazines", { [_this select 0, _this select 1] call ace_arsenal_fnc_openBox } , [], 0.5, true, true, "", "true"];
GLOB(COOPR_BOX_EQUIPMENT) addAction ["Get Equipment", { [_this select 0, _this select 1] call ace_arsenal_fnc_openBox } , [], 0.5, true, true, "", "true"];
