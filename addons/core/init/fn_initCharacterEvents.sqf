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
player addEventHandler ["Respawn", { call coopr_fnc_initCharacterActions; }];
player addEventHandler ["Put", {params["_unit", "_container", "_item"]; [_unit, _container, _item] call coopr_fnc_playerDroppedItem}];
player addEventHandler ["Take", {params["_unit", "_container", "_item"]; [_unit, _container, _item] call coopr_fnc_playerTookItem}];

call coopr_fnc_abortButtonEventHandler;

INFO("client events initialized");
