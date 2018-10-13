#include "..\constants.hpp"

private _isPrisoner = player getVariable [KEY_IS_RENEGADE, false];

if(!_isPrisoner) then {
    SLOG("saving character state before logout...");
    [SERVER, "X11_fnc_syncPlayerToServer", [player], //request-related
        [], {
            SLOG("...saved");
            call X11_fnc_spawnInLobby;
            call X11_fnc_showLoginDialog;
        }
    ] call Promise_Create;
}else {
    SLOG("character is still prisoner - will not save state before logout");
    call X11_fnc_spawnInLobby;
    call X11_fnc_showLoginDialog;
};

