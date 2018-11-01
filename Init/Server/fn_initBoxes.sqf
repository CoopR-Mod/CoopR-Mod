#include "..\constants.hpp"

GLOB(DPL_BOX_MAGAZINES) addAction ["Get Magazines", { [_this select 0, _this select 1] call ace_arsenal_fnc_openBox } , [], 0.5, true, true, "", "true"];
GLOB(DPL_BOX_EQUIPMENT) addAction ["Get Equipment", { [_this select 0, _this select 1] call ace_arsenal_fnc_openBox } , [], 0.5, true, true, "", "true"];
