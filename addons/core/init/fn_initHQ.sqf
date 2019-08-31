#include "script_component.hpp"

params [["_logic", objNull]];

if (isServer) then {
    private _hqBoundsMarker = _logic getVariable ["HQ_Bounds", ""];
    private _hqSide = _logic getVariable ["Side", ""];

    DEBUG2("Position of HQ is: %1", getPos _logic);
    DEBUG2("Side of HQ is: %1", _hqSide);

    if (_sideOfHQ isEqualTo objNull) exitWith {
        SETUPERROR("There was no side set for a HQ module")
    };
    //if (_faction isEqualTo objNull) exitWith { SETUPERROR("There was no faction set for a HQ module") };
    if (_hqBounds isEqualTo objNull or _hqBounds isEqualTo "<NONE>") exitWith { SETUPERROR("There was no boundsmarker set for a HQ module") };

    if (_sideOfHQ isEqualTo "West") then {
        COOPR_HQ_WEST = _logic;
        COOPR_HQ_WEST_BOUNDS = _hqBounds;
        INFO("HQ West initialized");
    } else {
        COOPR_HQ_EAST = _logic;
        COOPR_HQ_EAST_BOUNDS = _hqBounds;
        INFO("HQ East initialized");
    };

    publicVariable "COOPR_HQ_WEST";
    publicVariable "COOPR_HQ_WEST_BOUNDS";

    publicVariable "COOPR_HQ_EAST";
    publicVariable "COOPR_HQ_EAST_BOUNDS";
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};
