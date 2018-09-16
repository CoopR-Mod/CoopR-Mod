#include "..\global.hpp"
#include "constants.hpp"

params ["_target", "_caller"];

private _allDogTags = items _caller select {_x find "dogtag" > 0};
private _dogTagAmount = count _allDogTags;
//ToDo: move REP_PER_DOGTAG in folder specific constants.hpp
private _totalEarnedRep =  _dogTagAmount * REP_PER_DOGTAG;

[_caller, _totalEarnedRep] remoteExecCall ["X11_fnc_saveReputation", 2];

// remove all dogtags
{_caller removeItems _x} forEach _allDogTags;

systemChat format ["||DEPLOYED|| Du hast %1 RPTS erhalten!", _totalEarnedRep];
_target commandChat "Gute Arbeit Soldat. Weitermachen.";
