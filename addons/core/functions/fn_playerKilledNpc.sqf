#include "script_component.hpp"

params ["_victim"];

private _sideKiller = side group player;
private _sideVictim = side group _victim;
private _victimWasEnemy = [_sideVictim , _sideKiller] call BIS_fnc_sideIsEnemy;
private _victimIsPerson = _victim call CBA_fnc_isPerson;
private _playerName = name player;

if (_victimWasEnemy isEqualTo false) then {
      private _lastTK = player getVariable [COOPR_KEY_TEAMKILLS, 0];
      private _newTK = _lastTK + 1;
      player setVariable [COOPR_KEY_TEAMKILLS, _newTK, true];
      DEBUG3("%1 adding TK - actual %2", _playerName, _newTk);

      if(_newTK >= MAX_TK) then {
          DEBUG2("%1 is being punished for too many blue on blues", _playerName);
          player call coopr_fnc_punishTeamkill;
      };
} else {
    DEBUG2("player %1 killed an enemy", _playerName);
    DEBUG2("reputation per man: %1", COOPR_REP_MAN);
    COOPR_REP_MAN call coopr_fnc_updateTempReputation;
}

