#include "..\constants.hpp"

private _prisonTime = player getVariable [KEY_PRISON_START, 0];
private _savedLoadout = getUnitLoadout player;

SLOG("check if player still has to be in prison...");
if(_prisonTime > 0 and _prisonTime < serverTime) then {
    SLOG("player has still prison time");
    [player] spawn X11_fnc_makePrisoner;
}else{
    SLOG("player was marked as prisoner but has no prison time left");
};
