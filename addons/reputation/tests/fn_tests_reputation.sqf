#include "script_component.hpp"

TSTART;

_cleanup = {
    player setVariable [KEY_REPUTATION, 0];
    player setVariable [KEY_TMP_REPUTATION, 0];
};

call _cleanup;

TEST("should add temp reputation to player namespace");

1 call coopr_fnc_updateTempReputation;
1 call coopr_fnc_updateTempReputation;
1 call coopr_fnc_updateTempReputation;

private _currentTempRep = player getVariable [KEY_TMP_REPUTATION, 0];
TASSERT(_currentTempRep == 3);
call _cleanup;

TEST("should convert temp reputation to real reputation 1 to 1");

3 call coopr_fnc_updateTempReputation;
private _before = player getVariable [KEY_REPUTATION, 0];
1 call coopr_fnc_convertTempToReputation;
private _actual = player getVariable [KEY_REPUTATION, 0];
private _expected = _before + 3;
TASSERT(_actual == _expected);
call _cleanup;

TEST("should convert temp reputation to real reputation 1/5 ");

5 call coopr_fnc_updateTempReputation;
private _before = player getVariable [KEY_REPUTATION, 0];
0.2 call coopr_fnc_convertTempToReputation;
private _actual = player getVariable [KEY_REPUTATION, 0];
TASSERT(_actual == 1);
call _cleanup;

TEST("should clear temp reputation when converted ");
5 call coopr_fnc_updateTempReputation;
private _before = player getVariable [KEY_REPUTATION, 0];
1 call coopr_fnc_convertTempToReputation;
private _actual = player getVariable [KEY_TMP_REPUTATION, 0];
TASSERT(_actual == 0);
call _cleanup;

TEST("should ceal temp reputation when converted ");
3 call coopr_fnc_updateTempReputation;
private _before = player getVariable [KEY_REPUTATION, 0];
0.2 call coopr_fnc_convertTempToReputation;
private _actual = player getVariable [KEY_REPUTATION, 0];
TASSERT(_actual == 1);
call _cleanup;

TEND;
