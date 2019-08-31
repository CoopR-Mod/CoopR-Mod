#include "script_component.hpp"

if (isNil "COOPR_HQ_WEST" && isNil "COOPR_HQ_EAST") exitWith {
    [{
        private _msg = "HQ module could not be found";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR Setup Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    },  4] call CBA_fnc_addPerFrameHandler;
    false;
};
if (isNil "COOPR_LOBBY") exitWith {
    [{
        private _msg = "Lobby module could not be found";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR Setup Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    },  4] call CBA_fnc_addPerFrameHandler;
    false;
};
if (isNil "COOPR_PERSISTENCE_ACTIVE") exitWith {
    [{
        private _msg = "Persistence module could not be found";
        SETUPERROR(_msg);
        [[COOPR_LOGO_SMALL], ["CoopR Setup Error", 1.3, COOPR_COLOR_ERROR], [_msg]] call CBA_fnc_notify;
    },  4] call CBA_fnc_addPerFrameHandler;
    false;
};
INFO("Verification of setup modules successful");
true; // all fine
