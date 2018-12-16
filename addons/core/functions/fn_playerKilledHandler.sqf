#include "script_component.hpp"

if(player getVariable [COOPR_KEY_STATE, COOPR_STATE_OK] isEqualTo COOPR_STATE_OK) then {
    //TODO: no saving until db is ready
    //INFO("saving character before respawn to lobby...");
    //INFO("...saved");
    call coopr_fnc_death;
    _state = player call coopr_fnc_createCharacterStateFromPlayer;
    _baseLoadout = (player getVariable COOPR_KEY_ROLE) call coopr_fnc_getLoadoutForClass;
    [_state, COOPR_KEY_POSITION, getPos COOPR_HQ_WEST] call CBA_fnc_hashSet;
    [_state, COOPR_KEY_LOADOUT, _baseLoadout] call CBA_fnc_hashSet;
    _slot = player getVariable [COOPR_KEY_SLOT, -1];
    //[_state] call coopr_fnc_characterStatePrettyLog;
    [SERVER, "coopr_fnc_updateCharacter", [getPlayerUID player, _state, _slot], //request-related
        [], {
        sleep 5;
        call coopr_fnc_spawnInLobby;
        createDialog "coopr_Login_Dialog";
        call coopr_fnc_initLoginDialog;
        }
    ] call Promise_Create;
}
