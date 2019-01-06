#include "script_component.hpp"

params [["_character", []]];

if(not ([_character] call CBA_fnc_isHash)) exitWith {
    ERROR("argument has to be a cba hash");
};

INFO2("%1 is logging in", player);
[_character] call coopr_fnc_characterStatePrettyLog;

{
    player setVariable [_x, [_character, _x] call CBA_fnc_hashGet, true];
} forEach ([_character] call CBA_fnc_hashKeys);


DEBUG("stored variables saved in player namespace");

player setVariable [COOPR_KEY_PLAYER_LOGGEDIN, true, true];
INFO2("player with id %1 logged in", getPlayerUID player);
call coopr_fnc_postLogin;
