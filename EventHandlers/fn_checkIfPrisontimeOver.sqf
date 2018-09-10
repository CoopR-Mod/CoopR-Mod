params ["_args", "_handle"];

private _renegade =  _args select 0;
private _oldPosition =  _args select 1;
private _oldWeapons =  _args select 2;
private _oldMagazines =  _args select 2;

private _maxPrisonTimeInSec = 1 * 60; // 1 minute
private _prisonStartTime = _renegade getVariable "prisonTimeStart";

if(serverTime >= _prisonStartTime + _maxPrisonTimeInSec) then
{
    _renegade setVariable ["isRenegade", false];
    _renegade setPos _oldPosition;

    {_renegade addWeapon _x} forEach _oldWeapons;
    {_renegade addMagazine _x} forEach _oldMagazines;

    _handle call CBA_fnc_removePerFrameHandler;
};
