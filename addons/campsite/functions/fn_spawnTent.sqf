#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Spawn a new tent at the player desired position. New tent has the action to disasemble it.
 * //TODO implement Plank API here 
 * 
 *
 * Arguments:
 * 0: _player      - <OBJECT> Player is trying to place a tent.
 * 
 *
 * Return Value:
 * None
 *
 * Example:
 * trivial
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_player", objNull]];

private _safePos = [_player, 1, 3, 2, 0, 20, 0] call BIS_fnc_findSafePos;
if(_safePos isEqualTo [worldSize / 2, worldsize / 2, 0]) exitWith{
	[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], [localize "str.coopr.campsite.notif.cantspawntent"]] call CBA_fnc_notify
	};

private _newTent = "Land_TentA_F" createVehicle [0,0,0];
_newTent setPosATL [_safePos select 0, _safePos select 2, 0];

//Adding tent to database 
private _characterID = _player getVariable [COOPR_KEY_CHARACTER_ID, -1];
if(_characterID isEqualTo -1) exitWith {
    ERROR("For whatever reason, character has no ID")
};
_newTent setVariable ["coopr_tent_owner", _characterID];

private _foldAction = {
    params["_object"];
    _object addAction [
        localize "str.coopr.campsite.action.disassembletent", 
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            deleteVehicle _target;
            _caller addItemToBackpack "coopr_item_foldedTent";
        },
        [],
        9, 
        true, 
        true, 
        "",
        "true",
        3,
        false,
        "",
        ""
    ];
};

_newTent call _foldAction;