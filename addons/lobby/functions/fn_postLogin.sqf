#include "script_component.hpp"

private _oldPos = player getVariable [COOPR_KEY_POSITION, []];
private _loadout = player getVariable [COOPR_KEY_LOADOUT, []];

DEBUG("post login init...");

// check if player has an old position if not spawn to hq asap
if(count _oldPos > 0) then {
   call coopr_fnc_spawnAtOldPosition;
} else {
   player setPos getPos COOPR_HQ_WEST;
};

if (count _loadout isEqualTo 0) then {
    ERROR("loadout was empty");
} else {
    player setUnitLoadout _loadout;
};

// temporary workaround until health persistence is implemented
if(call coopr_fnc_isACE3Active) then {
    [objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
};

cutText ["", "BLACK IN", 0.1];

call coopr_fnc_initEventsClient;
call coopr_fnc_initEventsRoutines;
call coopr_fnc_addPlayerActions;

DEBUG("...post login init done");
