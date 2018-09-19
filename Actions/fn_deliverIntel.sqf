#include "..\globals.hpp"

params ["_target", "_caller"];

private _allRadios = items _caller select {_x find "ItemRadio" > 0};
private _allMaps = items _caller select {_x find "ItemMap" > 0};


_target commandChat "Gute Arbeit Soldat. Weitermachen.";

["%1 delivered intel", DEBUG_STR_PLAYER_ACTION, DEBUG_CFG] call CBA_fnc_debug;

