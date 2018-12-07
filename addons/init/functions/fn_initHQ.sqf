#include "script_component.hpp"

params [["_sideOfHQ", objNull],
        ["_logic", objNull]];

if (_sideOfHQ isEqualTo objNull) exitWith { ERROR("There was no side set for a HQ module") };
if (_logic isEqualTo objNull) exitWith { ERROR("Module is not defined") };

if (_sideOfHQ isEqualTo "West") then {
    COOPR_HQ_WEST = _logic;
    SLOG("HQ West initialized");
} else {
    COOPR_HQ_EAST = _logic;
    SLOG("HQ East initialized");
};

