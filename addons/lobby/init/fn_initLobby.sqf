#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initialized all lobby related props
 *
 * Arguments:
 * None
 *
 * Public: No
 *
 */

if (hasInterface) then {
    INFO("initializing lobby");
    COOPR_LOBBY_CAM = objNull;
    COOPR_LOBBY_AGENT = objNull;
    COOPR_LOBBY_PROP_STRETCHER = "Land_Stretcher_01_F" createVehicle (getPos COOPR_LOBBY);
    COOPR_LOBBY_PROP_BODYBAG = "Land_Bodybag_01_black_F" createVehicle (getPos COOPR_LOBBY);
    COOPR_LOBBY_PROP_STRETCHER enableSimulation false;
    COOPR_LOBBY_PROP_BODYBAG enableSimulation false;
    INFO("lobby initialized");
}
