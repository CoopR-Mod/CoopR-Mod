#include "script_component.hpp"

[{call coopr_fnc_syncPlayersToServer;},  SYNC_RATE_MIN * 60] call CBA_fnc_addPerFrameHandler;

if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
    [{call coopr_fnc_localDatabaseRefresh;}, 10] call CBA_fnc_addPerFrameHandler;
};

// regular events
["CAManBase", "killed", { call coopr_fnc_onKilled }] call CBA_fnc_addClassEventHandler;

INFO("server events initialized");
