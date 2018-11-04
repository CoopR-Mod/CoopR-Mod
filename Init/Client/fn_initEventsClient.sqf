#include "..\constants.hpp"

player addEventHandler ["Killed", {call X11_fnc_playerKilledHandler}];
player addEventHandler ["Respawn", { call X11_fnc_addPlayerActions; }];
SLOG("client events initialized");
