#include "..\constants.hpp"

[1, [false, false, false], {
    [] spawn {
        private _wait = time + 50;
        waitUntil {
            str ((findDisplay MP_MENU) displayCtrl ABORT_BUTTON) != "No control" || (time > _wait);
        };
        ((findDisplay MP_MENU) displayCtrl ABORT_BUTTON) ctrlAddEventHandler ["ButtonClick", {
            [] spawn {
                private _isPrisoner = player getVariable [KEY_IS_PRISONER, false];

                if(!_isPrisoner) then {
                    SLOG("saving character state before mission end...");
                    [SERVER, "X11_fnc_syncPlayerToServer", [player],
                        [], {
                            SLOG("...saved");
                        }
                    ] call Promise_Create;
                }else {
                    SLOG("character is still prisoner - will not save state before mission end");
                };

            };
        }];
    };
}] call CBA_fnc_addKeyHandler;



