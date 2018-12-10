#include "script_component.hpp"

params ["_target", "_caller"];

private _gainedReputation = COOPR_REP_AAR_MULTIPLIER call coopr_fnc_convertTempToReputation;

_target commandChat localize "str.coopr.reputation.chatter.aar";

if(!isNil "_gainedReputation") then {
    systemChat format ["||Deployed|| Reputation received [%1]", _gainedReputation];
}
