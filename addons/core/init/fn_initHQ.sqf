#include "script_component.hpp"

params [["_sideOfHQ", objNull],
        ["_faction", objNull],
        ["_logic", objNull],
        ["_hqBounds", objNull]];

if (_sideOfHQ isEqualTo objNull) exitWith { SETUPERROR("There was no side set for a HQ module") };
if (_faction isEqualTo objNull) exitWith { SETUPERROR("There was no faction set for a HQ module") };
if (_hqBounds isEqualTo objNull or _hqBounds isEqualTo "<NONE>") exitWith { SETUPERROR("There was no boundsmarker set for a HQ module") };

if (_sideOfHQ isEqualTo "West") then {
    COOPR_HQ_WEST = _logic;
    COOPR_HQ_WEST_BOUNDS = _hqBounds;
    COOPR_FACTION_WEST = _faction;
    INFO("HQ West initialized");
} else {
    COOPR_HQ_EAST = _logic;
    COOPR_HQ_EAST_BOUNDS = _hqBounds;
    COOPR_FACTION_EAST = _faction;
    INFO("HQ East initialized");
};

publicVariable "COOPR_HQ_WEST";
publicVariable "COOPR_HQ_WEST_BOUNDS";
publicVariable "COOPR_FACTION_WEST";
publicVariable "COOPR_HQ_EAST";
publicVariable "COOPR_HQ_EAST_BOUNDS";
publicVariable "COOPR_FACTION_EAST";
