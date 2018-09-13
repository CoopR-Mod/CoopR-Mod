#include "..\constants.hpp"

params ["_target", "_caller"];

private _allDogTags = items _caller select {_x find "dogtag" > 0};
private _dogTagAmount = count _allDogTags;
private _totalEarnedRep =  _dogTagAmount * REP_PER_DOGTAG;

{ private _currentReputation = profileNamespace getVariable ["Reputation", 0];
    profileNamespace setVariable ["Reputation", _currentReputation + REP_PER_DOGTAG];
    [format ["%1 is receiving %2 rep for a dog tag", _nameOfKiller, REP_PER_DOGTAG], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
} forEach _allDogTags;

{_caller removeItems _x} forEach _allDogTags;

// persist namespace after earning RTPS
saveProfileNamespace;

systemChat format ["[*Deployed*] Du hast %1 RPTS erhalten!", _totalEarnedRep];
_target commandChat "Gute Arbeit Soldat. Weitermachen.";
