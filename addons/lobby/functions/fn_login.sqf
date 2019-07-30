#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Takes a hash represting a characters state and logs the player in with the given state
 *
 * Arguments:
 * 0: _characterHash <ARRAY> - CBA hash that contains the character state
 *
 * Return Value:
 * None
 *
 * Example:
 * [_characterHash] call coopr_fnc_login
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_characterHash", []]];

if (not ([_characterHash] call CBA_fnc_isHash)) exitWith { ERROR("argument has to be a cba hash"); };

INFO2("%1 is logging in", player);
["logged in character:", _characterHash] call coopr_fnc_logHash;

private _oldPlayerUnit = player;
private _playerGroup = createGroup [west, true];
private _newLoginUnit =  _playerGroup createUnit ["B_diver_TL_F", getPos COOPR_LOBBY, [], 0, "NONE"];

// hack to get ALiVE actions back on new player control unit
//if (INTEGRATE_ALIVE) then {
    //DEBUG("resetting lost ALiVE actions");
    //{
        //private _newActionParams = player actionParams _x;
        //_newActionParams deleteAt 10; // pls do not ask
        //_newActionParams deleteAt 10;
        //_newLoginUnit addAction _newActionParams;
    //} forEach (actionIDs player);
    //[] spawn ALiVE_fnc_aceMenu; // add the ace action wheel menu
//};

DEBUG("new unit was created");
selectPlayer _newLoginUnit;
deleteVehicle _oldPlayerUnit;
DEBUG("assigned as player");
[_characterHash, player] call coopr_fnc_deserializeCoopR;
DEBUG("applied character state to new unit");
player setVariable [COOPR_KEY_PLAYER_LOGGEDIN, true, true];
INFO2("player with id %1 logged in", getPlayerUID player);

call coopr_fnc_initCharacter;
