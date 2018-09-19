#include "..\globals.hpp"

player addAction ["Show reputation", { [_this select 0, clientOwner] remoteExecCall ["X11_fnc_showReputation", 2]; } ,[],0.5];

["player actions added", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

