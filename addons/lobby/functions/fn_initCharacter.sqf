#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Will initialize the character that has been selected by the player
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */

private _oldPos = player getVariable [COOPR_KEY_POSITION, []];
private _loadout = player getVariable [COOPR_KEY_LOADOUT, []];

DEBUG("post login init...");

// check if player has an old position if not spawn to hq asap
if(_oldPos isEqualTo []) then {
   call coopr_fnc_spawnAtOldPosition;
} else {
   DEBUG("player position could not be revoked after login");
   player setPos getPos COOPR_HQ_WEST;
};

if (count _loadout isEqualTo 0) then {
    ERROR("player loadout could not be revoked after login")
} else {
    player setUnitLoadout _loadout;
};

// temporary workaround until health persistence is implemented
if(call coopr_fnc_isACE3Active) then {
    [objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
};

cutText ["", "BLACK IN", 0.1];

call coopr_fnc_initCharacterEvents;
call coopr_fnc_initCharacterRoutines;
call coopr_fnc_initCharacterActions;

DEBUG("...post login init done");
