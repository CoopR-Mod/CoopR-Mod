#include "..\..\globals.hpp"
#include "..\constants.hpp"

private _prisonTime = player getVariable [KEY_PRISON_START, 0];
private _freedomPosition = player getVariable [KEY_PRISON_FREE_POSITION, []];
private _savedLoadout = getUnitLoadout player;

if(_prisonTime > 0 and _prisonTime < serverTime) then {
    ["player has still prison time", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    player call X11_fnc_makePrisoner;
    [{call X11_fnc_checkFreedom}, 3, [player]] call CBA_fnc_addPerFrameHandler;
}
