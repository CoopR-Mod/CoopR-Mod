#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Orchestrating function for client specific events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */
player addEventHandler ["Killed", {call coopr_fnc_playerKilledHandler}];
player addEventHandler ["Respawn", { call coopr_fnc_addCharacterActions; }];
player addEventHandler ["Take", {params["_unit", "_container", "_item"]; [1, _item] call coopr_fnc_addCampsiteEH}];
player addEventHandler ["Put", {params["_unit", "_container", "_item"]; [2, _item] call coopr_fnc_addCampsiteEH}];

call coopr_fnc_abortButtonEventHandler;

INFO("client events initialized");
