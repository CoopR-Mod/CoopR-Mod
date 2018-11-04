#include "..\constants.hpp"

private _oldPos = player getVariable [KEY_POSITION, []];
private _prisonTime = player getVariable [KEY_PRISON_START, 0];
private _isPrisoner = player getVariable [KEY_IS_PRISONER, false];
private _loadout = player getVariable [KEY_LOADOUT, []];

SLOG("post login init...");


// check if player has an old position if not spawn to hq asap
if(count _oldPos > 0) then {
   call X11_fnc_spawnAtOldPosition;
} else {
   player setPos (getPos GLOB(DPL_HQ));
};

player setUnitLoadout _loadout;

if(_isPrisoner) then {
    SLOG("player was lastly seen in prison");
    call X11_fnc_checkPrisonRefugee;
};

// temporary workaround until health persistence is implemented
[objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;

cutText ["", "BLACK IN", 0.1];

SLOG("...post login init done");
