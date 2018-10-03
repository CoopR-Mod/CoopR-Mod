#include "..\constants.hpp"

private _prisonTime = player getVariable [KEY_PRISON_START, 0];
private _freedomPosition = player getVariable [KEY_PRISON_FREE_POSITION, []];
private _savedLoadout = getUnitLoadout player;

SLOG("check if player has to be in prison...");
if(_prisonTime > 0 and _prisonTime < serverTime) then {
    SLOG("player has still prison time");
    [player] spawn X11_fnc_makePrisoner;
}else{
    SLOG("player has no prison time left");
    [player] spawn X11_fnc_setFree;
}
