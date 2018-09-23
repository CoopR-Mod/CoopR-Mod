#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_args", "_handle"];

private _renegade =  _args select 0;

private _maxPrisonTimeInSec = PRISON_TIME_IN_MIN * 60;
private _prisonStartTime = _renegade getVariable KEY_PRISON_START;

if(serverTime >= _prisonStartTime + _maxPrisonTimeInSec) then
{
    private _oldPosition =  _args select 1;
    private _savedLoadout =  _args select 2;

    ["prison time has been served out", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

    _renegade setVariable [KEY_IS_RENEGADE, false];
    _renegade setVariable [KEY_PRISON_START, 0];
    _renegade setVariable [KEY_PRISON_FREE_POSITION, []];

    _renegade setPos _oldPosition;
    ["teleport arrested player back to old position", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

    _renegade setUnitLoadout _savedLoadout;
    ["arrested player reequipped", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

    _handle call CBA_fnc_removePerFrameHandler;
    ["prison time check EH removed", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
};
