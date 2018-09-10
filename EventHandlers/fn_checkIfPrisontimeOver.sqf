params ["_args", "_handle"];

private _renegade =  _args select 0;
private _oldPosition =  _args select 1;
private _maxPrisonTimeInSec = 1 * 60; // 1 minute
private _prisonStartTime = _renegade getVariable "prisonTimeStart";

if(serverTime >= _prisonStartTime + _maxPrisonTimeInSec) then
{
    _renegade setVariable ["isRenegade", false];
    _renegade setPos _oldPosition;
    _handle call CBA_fnc_removePerFrameHandler;
};
