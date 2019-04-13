#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Handle the event of taking items and calls the function if
 * the item is relevant to any function we're using.
 *
 * Arguments:
 * 0: _unit      <OBJECT> - The unit taking the item
 * 1: _container <OBJECT> - Container where the unit took the item.
 * 2: _item      <STRING> - class name of the item.
 *
 * Return Value:
 * none
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client
 */

 params ["_unit", "_container", "_item"];

 if (_item isEqualTo "coopr_item_foldedTent") exitWith {[_unit, _container] call coopr_fnc_addTentItem};