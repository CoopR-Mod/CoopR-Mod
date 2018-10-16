#include "..\constants.hpp"

player addEventHandler ["Killed", {call X11_fnc_playerKilledHandler}];
SLOG("client events initialized");
