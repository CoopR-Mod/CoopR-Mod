#include "..\constants.hpp"

params ["_args", "_handle"];

private _renegade =  _args select 0;

private _maxPrisonTimeInSec = PRISON_TIME_IN_MIN * 60;
private _prisonStartTime = _renegade getVariable [KEY_PRISON_START, 0];

if(serverTime >= _prisonStartTime + _maxPrisonTimeInSec) then
{
    _renegade call X11_fnc_setFree;
    _handle call CBA_fnc_removePerFrameHandler;
    SLOG("prison time check EH removed");
};
