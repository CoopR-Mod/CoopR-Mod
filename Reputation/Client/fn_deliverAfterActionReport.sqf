#include "..\constants.hpp"

params ["_target", "_caller"];

private _gainedReputation = REP_AAR_MULTIPLIER call X11_fnc_convertTempToReputation;

_target commandChat localize "str.dpl.reputation.chatter.aar";

if(!isNil "_gainedReputation") then {
    systemChat format ["||Deployed|| Reputation received [%1]", _gainedReputation];
}
