#include "..\constants.hpp"

player addAction [localize "str.dpl.init.action.rep", { player call X11_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
player addAction [localize "str.dpl.init.action.intel", { [player, clientOwner] remoteExec ["X11_fnc_showIntelProgress", SERVER]; } , [], 0.5, true, true, "", "true"];

_onLogout = {
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

};

private _logoutAction = player addAction ["<t color='#ff0000'>Logout</t>", _onLogout, [], 0.5, true, true, "", "true"];

SLOG("player actions added");

