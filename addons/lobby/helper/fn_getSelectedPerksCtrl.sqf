#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Returns all selected perks of a character creation
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _selectedPerks - <ARRAY>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client 
 */

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
private _perks = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_PERKS;

private _perks = [];
for "_i" from 0 to 8 do { _perks pushBackUnique (_loginDialog displayCtrl PERK(_i)) };

_perks select { _x getVariable ["isSelected", false] };
