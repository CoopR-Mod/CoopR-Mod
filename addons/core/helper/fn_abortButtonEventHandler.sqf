#include "script_component.hpp"

[1, [false, false, false], {
    [] spawn {
        private _wait = time + 50;
        waitUntil {
            str ((findDisplay MP_MENU) displayCtrl ABORT_BUTTON) != "No control" || (time > _wait);
        };
        ((findDisplay MP_MENU) displayCtrl ABORT_BUTTON) ctrlAddEventHandler ["ButtonClick", {
            [] spawn {
                private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];

                if(_isLoggedIn) then {
                    INFO("saving character state before mission end...");
                    [EXEC_SERVER, "coopr_fnc_syncPlayerToServer", [player],
                        [], {
                            INFO("...saved");
                        }
                    ] call Promise_Create;
                }else {
                    INFO("character is not logged in. Character state will not be saved");
                };
            };
        }];
    };
}] call CBA_fnc_addKeyHandler;



