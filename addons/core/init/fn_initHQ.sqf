#include "script_component.hpp"

params [["_sideOfHQ", objNull],
        ["_faction", objNull],
        ["_logic", objNull],
        ["_hqBoundsMarker", objNull]];

if (_sideOfHQ isEqualTo objNull) exitWith { SETUPERROR("There was no side set for a HQ module") };
if (_faction isEqualTo objNull) exitWith { SETUPERROR("There was no faction set for a HQ module") };
if (_hqBoundsMarker isEqualTo objNull or _hqBoundsMarker isEqualTo "<NONE>") exitWith { SETUPERROR("There was no boundsmarker set for a HQ module") };

if (_sideOfHQ isEqualTo "West") then {
    COOPR_HQ_WEST = _logic;
    COOPR_FACTION_WEST = _faction;
    COOPR_HQ_BOUNDARIES_WEST = _hqBoundsMarker;
    INFO("HQ West initialized");
} else {
    COOPR_HQ_EAST = _logic;
    COOPR_FACTION_EAST = _faction;
    COOPR_HQ_BOUNDARIES_EAST = _hqBoundsMarker;
    INFO("HQ East initialized");
};

publicVariable "COOPR_HQ_WEST";
publicVariable "COOPR_FACTION_WEST";
publicVariable "COOPR_HQ_BOUNDARIES_WEST";
publicVariable "COOPR_HQ_EAST";
publicVariable "COOPR_FACTION_EAST";
publicVariable "COOPR_HQ_BOUNDARIES_EAST";
