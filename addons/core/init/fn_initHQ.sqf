#include "script_component.hpp"

params [["_sideOfHQ", objNull],
        ["_faction", objNull],
        ["_logic", objNull]];

if (_sideOfHQ isEqualTo objNull) exitWith { SETUPERROR("There was no side set for a HQ module") };
if (_faction isEqualTo objNull) exitWith { SETUPERROR("There was no faction set for a HQ module") };

if (_sideOfHQ isEqualTo "West") then {
    COOPR_HQ_WEST = _logic;
    COOPR_FACTION_WEST = _faction;
    INFO("HQ West initialized");
} else {
    COOPR_HQ_EAST = _logic;
    COOPR_FACTION_EAST = _faction;
    INFO("HQ East initialized");
};
