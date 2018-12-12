#include "script_component.hpp"

params [["_sideOfHQ", objNull],
        ["_faction", objNull],
        ["_reputationMan", objNull],
        ["_WIAReputation", objNull],
        ["_logic", objNull]];

if (_sideOfHQ isEqualTo objNull) exitWith { SETUPERROR("There was no side set for a HQ module") };
if (_faction isEqualTo objNull) exitWith { SETUPERROR("There was no faction set for a HQ module") };
if (_reputationMan isEqualTo objNull) exitWith { SETUPERROR("There was no reputation per man (infantry) defined") };
if (_WIAReputation isEqualTo objNull) exitWith { SETUPERROR("There was no reputation multiplier for WIA defined") };

if (_sideOfHQ isEqualTo "West") then {
    COOPR_HQ_WEST = _logic;
    COOPR_FACTION_WEST = _faction;
    COOPR_REP_MAN_WEST = _reputationMan;
    COOPR_REP_WIA_MULTIPLIER_WEST = _WIAReputation;
    SLOG("HQ West initialized");
} else {
    COOPR_HQ_EAST = _logic;
    COOPR_FACTION_EAST = _faction;
    COOPR_REP_MAN_EAST = _reputationMan;
    COOPR_REP_WIA_MULTIPLIER_EAST = _WIAReputation;
    SLOG("HQ East initialized");
};



