#include "..\constants.hpp"

params ["_args", "_handle"];

private _prisoner =  _args select 0;

private _maxPrisonTimeInSec = PRISON_TIME_IN_MIN * 60;
private _prisonStartTime = _prisoner getVariable [KEY_PRISON_START, 0];
private _isLoggedIn = _prisoner getVariable [KEY_PLAYER_LOGGEDIN, false];

if(serverTime >= _prisonStartTime + _maxPrisonTimeInSec and _isLoggedIn) then
{
    if(_isLoggedIn) then {
        _prisoner call X11_fnc_setFree;
    };
    _handle call CBA_fnc_removePerFrameHandler;
    SLOG("prison time check EH removed");
};
