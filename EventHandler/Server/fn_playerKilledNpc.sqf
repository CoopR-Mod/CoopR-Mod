#include "..\constants.hpp"

params ["_victim"];

private _sideKiller = side group player;
private _sideVictim = side group _victim;
private _victimWasEnemy = [_sideVictim , _sideKiller] call BIS_fnc_sideIsEnemy;
private _victimIsPerson = _victim call CBA_fnc_isPerson;
private _playerName = name player;

if (_victimWasEnemy) then {
    systemChat format ["||DEPLOYED|| Du hast %1 RPTS erhalten!", REP_PER_INF];
    [REP_PER_INF] call X11_fnc_updateReputation;
};

if (_victimWasEnemy isEqualTo false) then {
      private _lastTK = _killer getVariable [KEY_TEAMKILLS, 0];
      private _newTK = _lastTK + 1;
      _killer setVariable [KEY_TEAMKILLS,  _newTK];
      FFLOG("%1 adding TK - actual %2", _playerName, _newTk);

      if(_newTK >= MAX_TK) then {
          FLOG("%1 is being punished for too many blue on blues", _playerName);
          _killer call X11_fnc_punishTeamkill;
      };
 }
