#include "constants.hpp"

params ["_isDebug"];

DEBUG_CFG = [false, false, false];

if(_isDebug) then {
    DEBUG_CFG = [true, true, true];
    if (is3DENMultiplayer) then { DEBUG_CFG = [true, true, false]; };
}else {
    DEBUG_CFG = [false, false, false];
};

publicVariable "DEBUG_CFG";
