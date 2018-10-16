#include "..\constants.hpp"

private _isPrisoner = player getVariable [KEY_IS_PRISONER, false];

cutText ["returning to character lobby.", "BLACK OUT", 0.5];
sleep 1;
if(!_isPrisoner) then {
    cutText ["saving character...", "BLACK OUT", 0.0001];
    sleep 1;
    SLOG("saving character state before logout...");
    [SERVER, "X11_fnc_syncPlayerToServer", [player], //request-related
        [], {
            SLOG("...saved");
            cutText ["...saved!", "BLACK OUT", 0.0001];
            sleep 1;
            call X11_fnc_spawnInLobby;
            createDialog "X11_Login_Dialog";
            call X11_fnc_initLoginDialog;
        }
    ] call Promise_Create;
}else {
    SLOG("character is still prisoner - will not save state before logout");
    call X11_fnc_spawnInLobby;
    createDialog "X11_Login_Dialog";
    call X11_fnc_initLoginDialog;
};

