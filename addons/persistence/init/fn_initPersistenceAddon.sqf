#include "script_component.hpp"

params [["_logic", objNull]];

if (isServer) then {
    if ( false /** Connection to CoopR HQ Server **/) then {

    } else {
        COOPR_PERSISTENCE_HQ_CONNECTION = false;
    };

    publicVariable "COOPR_PERSISTENCE_HQ_CONNECTION";

    INFO2("CoopR Server ID: %1", COOPR_SERVER_ID);
    INFO2("persistence location is set to %1", COOPR_PERSISTENCE_LOCATION);
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
