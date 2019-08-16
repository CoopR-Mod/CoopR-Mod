#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Routine running when a character is being logged out
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client
 */

private _lobbyText = format ["<t size='3' color='%1'>Return To Character Lobby</t>", COOPR_MAIN_COLOR_HEX];
0 cutText ["", "BLACK OUT", 0.5, false, true];
1 cutText [_lobbyText, "BLACK OUT", 0.5, false, true];
sleep 1;
INFO2("player with id %1 is logging out to lobby", getPlayerUid player);

[] call coopr_fnc_cleanUp;

DEBUG("saving character state before logout...");
player call coopr_fnc_updateState;
[EXEC_SERVER, "coopr_fnc_updateCharacter", [player call coopr_fnc_serializeCoopR], //request-related
    [], {
        1 cutText ["", "PLAIN", 0.1, false, true];
        private _saveText1 = "<t size='3'>Saving Character.</t>";
        private _saveText2 = "<t size='3'>Saving Character..</t>";
        private _saveText3 = "<t size='3'>Saving Character...</t>";

        2 cutText [_saveText1, "PLAIN", 1.0, false, true];
        sleep 1;
        2 cutText [_saveText2, "PLAIN", 1.0, false, true];
        sleep 1;
        2 cutText [_saveText3, "PLAIN", 1.0, false, true];
        sleep 2;
        2 cutText [_saveText3, "PLAIN", 1.0, false, true];
        2 cutText ["", "PLAIN", 1.0, false, true];

        { _x cutFadeOut 0.001 } forEach allCutLayers;

        DEBUG("character saved");
        cutText ["", "BLACK IN", 1];
        [] spawn {
            call coopr_fnc_spawnInLobby;
            call coopr_fnc_showLoginDialog;
        };
    }
] call Promise_Create;

