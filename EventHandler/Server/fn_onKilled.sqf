#include "..\constants.hpp"

params ["_unit", "_killer", "_instigator", "_useEffects"];

// workaround to get the actual killer unit. Something is screwing up the 'killed' handler
_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];

private _isSuicide = _unit == _killer;
private _sideKiller = side group _killer;
private _sideUnit = side group _unit;
private _badSide = sideUnknown;
private _playerIsKiller = isPlayer _killer;
private _nameOfKiller = name _killer;
private _isBlueOnBlue = [group _killer, group _unit] call X11_fnc_sameSide;

// check if killer attacked same side
if(_isSuicide) then {
 SLOG("player killed himself");
};

if (_isBlueOnBlue and not _isSuicide) then {
  if (_playerIsKiller) exitWith {
    FLOG("%1 is being punished for friendly fire", _nameOfKiller);
    _killer call X11_fnc_punishTeamkill;
  }
}else {
    [] remoteExec ["X11_fnc_addReputationForKill", owner _killer]
}
