#include "script_component.hpp"

params [["_logic", objNull]];

if (isServer) then {
    private _hqBounds = _logic getVariable ["HQ_Bounds", ""];
    private _hqSide = _logic getVariable ["Side", ""];

    DEBUG2("Position of HQ is: %1", getPos _logic);
    DEBUG2("Side of HQ is: %1", _hqSide);

    if (_hqSide isEqualTo objNull) exitWith {
        private _msg = "There was no side set for a HQ module";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR HQ Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    };
    //if (_faction isEqualTo objNull) exitWith { SETUPERROR("There was no faction set for a HQ module") };
    if (_hqBounds isEqualTo objNull or _hqBounds isEqualTo "<NONE>") exitWith {
        private _msg = "There HQ boundary marker is missing or not set in the HQ module";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR HQ Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    };

    if (_hqSide isEqualTo "West") then {
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
