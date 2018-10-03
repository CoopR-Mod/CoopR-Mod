
#include "..\constants.hpp"

params ["_target", "_caller"];

private _allDogTags = items _caller select {_x find "dogtag" > 0};
private _dogTagAmount = count _allDogTags;
private _totalEarnedRep =  _dogTagAmount * REP_PER_DOGTAG;

if(_dogTagAmount <= 0) exitWith {
    SLOG("cannot gather reputation points for no dogtags");
    systemChat localize "dpl.system.norep";
};

[_caller, _totalEarnedRep] call X11_fnc_updateReputation;

// remove all dogtags
{_caller removeItems _x} forEach _allDogTags;

systemChat format [localize "dpl.system.rep", _totalEarnedRep];
_target commandChat localize "dpl.chatter.rep";
