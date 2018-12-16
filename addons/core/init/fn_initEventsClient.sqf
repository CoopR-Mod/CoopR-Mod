#include "script_component.hpp"

player addEventHandler ["Killed", {call coopr_fnc_playerKilledHandler}];
player addEventHandler ["Respawn", { call coopr_fnc_addPlayerActions; }];

call coopr_fnc_abortButtonEventHandler;

INFO("client events initialized");
