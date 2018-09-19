#include "..\globals.hpp"

params ["_args", "_handle"];

private _renegade =  _args select 0;
private _oldPosition =  _args select 1;
private _savedLoadout =  _args select 2;

private _maxPrisonTimeInSec = 1 * 60; // 1 minute
private _prisonStartTime = _renegade getVariable "prisonTimeStart";

if(serverTime >= _prisonStartTime + _maxPrisonTimeInSec) then
{
    ["prison time has been served out", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

    _renegade setVariable ["isRenegade", false];
    _renegade setPos _oldPosition;
    ["teleport arrested player back to old position", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

    _renegade setUnitLoadout _savedLoadout;
    ["arrested player reequipped", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

    _handle call CBA_fnc_removePerFrameHandler;
    ["prison time check EH removed", DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
};
