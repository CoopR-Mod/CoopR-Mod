#include "..\constants.hpp"

player addEventHandler ["Killed", {call X11_fnc_playerKilledHandler}];
player addEventHandler ["Respawn", { call X11_fnc_addPlayerActions; }];

call X11_fnc_abortButtonEventHandler;

SLOG("client events initialized");
