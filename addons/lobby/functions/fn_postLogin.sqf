#include "script_component.hpp"

private _oldPos = player getVariable [COOPR_KEY_POSITION, []];
private _prisonTime = player getVariable [COOPR_KEY_PRISON_START, 0];
private _isPrisoner = player getVariable [COOPR_KEY_IS_PRISONER, false];
private _loadout = player getVariable [COOPR_KEY_LOADOUT, []];

SLOG("post login init...");

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

//if(_isPrisoner) then {
 //   SLOG("player was lastly seen in prison");
  //  call coopr_fnc_checkPrisonRefugee;
//};

// temporary workaround until health persistence is implemented
if(call coopr_fnc_isACE3Active) then {
    [objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
};

cutText ["", "BLACK IN", 0.1];

SLOG("...post login init done");
