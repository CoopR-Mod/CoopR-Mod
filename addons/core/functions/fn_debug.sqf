#include "script_component.hpp"

params [["_isDebug", false]];

DEBUG_CFG = [false, false, false];

if(_isDebug) then {
    DEBUG_CFG = [true, true, true];
    if (is3DENMultiplayer) then { DEBUG_CFG = [true, true, false]; };
    SLOG("debugging activated");
}else {
    DEBUG_CFG = [false, false, false];
    SLOG("debugging deactivated");
};

publicVariable "DEBUG_CFG";
