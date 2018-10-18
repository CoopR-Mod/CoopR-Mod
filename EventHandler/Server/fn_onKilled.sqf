#include "..\constants.hpp"

params ["_unit", "_killer", "_instigator", "_useEffects"];

LSTART("ON KILL");
private _isSuicide = _unit == _killer;
// when player then skip - has own handler
if(isPlayer _unit) then {
    if(_isSuicide) then {
        SLOG("player killed himself");
    };
} else {
    // workaround to get the actual killer unit. Something is screwing up the 'killed' handler
    _killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];

    private _isSuicide = _unit == _killer;
    private _sideKiller = side group _killer;
    private _sideVictim = side group _unit;
    private _badSide = sideUnknown;
    private _playerIsKiller = isPlayer _killer;
    private _nameOfKiller = name _killer;
    private _isBlueOnBlue = [group _killer, group _unit] call X11_fnc_sameSide;

    FLOG("killer: %1", _killer);
    FLOG("victim: %1", _unit);

    if (_playerIsKiller) then {

        if(_sideKiller == west) then{
            _badSide = east;
            SLOG("bad guy is east");
        };
        if (_sideKiller == east) then {
            _badSide = west;
            SLOG("bad guy is west");
        };

        if (_sideVictim == _badSide and (_unit call CBA_fnc_isPerson)) then {
            systemChat format ["||DEPLOYED|| Du hast %1 RPTS erhalten!", REP_PER_DOGTAG];
            [REP_PER_DOGTAG] remoteExec ["X11_fnc_updateReputation"];
         };

        if (_isBlueOnBlue and not _isSuicide) then {
              private _lastTK = _killer getVariable [KEY_TEAMKILLS, 0];
              private _newTK = _lastTK + 1;
              _killer setVariable [KEY_TEAMKILLS,  _newTK];
              FFLOG("%1 adding TK - actual %2", _nameOfKiller, _newTk);

              if(_newTK >= MAX_TK) then {
                  FLOG("%1 is being punished for too many blue on blues", _nameOfKiller);
                  _killer call X11_fnc_punishTeamkill;
              };
         }
    };
    LEND("ON KILL");
}
