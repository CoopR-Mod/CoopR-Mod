#include "..\constants.hpp"

TSTART;

_cleanup = {
    player setVariable [KEY_REPUTATION, 0];
    player setVariable [KEY_TMP_REPUTATION, 0];
};

call _cleanup;

TEST("should add temp reputation to player namespace");

1 call X11_fnc_updateTempReputation;
1 call X11_fnc_updateTempReputation;
1 call X11_fnc_updateTempReputation;

private _currentTempRep = player getVariable [KEY_TMP_REPUTATION, 0];
TASSERT(_currentTempRep == 3);
call _cleanup;

TEST("should convert temp reputation to real reputation 1 to 1");

3 call X11_fnc_updateTempReputation;
private _before = player getVariable [KEY_REPUTATION, 0];
1 call X11_fnc_convertTempToReputation;
private _after = player getVariable [KEY_REPUTATION, 0];
TASSERT(_after == _before + 3);
call _cleanup;

TEST("should convert temp reputation to real reputation 1/5 ");

5 call X11_fnc_updateTempReputation;
private _before = player getVariable [KEY_REPUTATION, 0];
0.2 call X11_fnc_convertTempToReputation;
private _after = player getVariable [KEY_REPUTATION, 0];
TASSERT(_after == 1);
call _cleanup;

TEND;
