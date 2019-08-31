#include "script_component.hpp"

if (isNil "COOPR_HQ_WEST" && isNil "COOPR_HQ_EAST") exitWith {
    [{
        private _msg = "HQ module could not be found";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR Setup Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    },  4] call CBA_fnc_addPerFrameHandler;
    false;
};
INFO("CoopR HQ module found");
if (isNil "COOPR_LOBBY") exitWith {
    [{
        private _msg = "Lobby module could not be found";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR Setup Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    },  4] call CBA_fnc_addPerFrameHandler;
    false;
};
INFO("CoopR Lobby module found");
INFO("Verification of mandatory editor modules successful");
true; // all fine
