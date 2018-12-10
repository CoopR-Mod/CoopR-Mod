#include "script_component.hpp"

[1, [false, false, false], {
    [] spawn {
        private _wait = time + 50;
        waitUntil {
            str ((findDisplay MP_MENU) displayCtrl ABORT_BUTTON) != "No control" || (time > _wait);
        };
        ((findDisplay MP_MENU) displayCtrl ABORT_BUTTON) ctrlAddEventHandler ["ButtonClick", {
            [] spawn {
                LSTART("ABORT SYNC");
                private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
                private _isPrisoner = player getVariable [COOPR_KEY_IS_PRISONER, false];

                if(_isLoggedIn and not _isPrisoner) then {
                    SLOG("saving character state before mission end...");
                    [SERVER, "coopr_fnc_syncPlayerToServer", [player],
                        [], {
                            SLOG("...saved");
                        }
                    ] call Promise_Create;
                }else {
                    SLOG("character is still prisoner or in logged out - will not save state before mission end");
                };
                LEND("ABORT SYNC");
            };
        }];
    };
}] call CBA_fnc_addKeyHandler;



