#include "..\..\globals.hpp"
#include "..\constants.hpp"

private _oldPos = player getVariable [KEY_POSITION, []];
private _prisonTime = player getVariable [KEY_PRISON_START, 0];
private _loadout = player getVariable [KEY_LOADOUT, []];

call X11_fnc_initNpcs;
call X11_fnc_addPlayerActions;

if(count _oldPos > 0) then {
   call X11_fnc_spawnAtOldPosition;
} else {
   player setPos (getPos respawn_hq);
};

player setUnitLoadout _loadout;

call X11_fnc_checkPrisonRefugee;

["post login executed", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
