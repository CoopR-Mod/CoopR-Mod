#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Event handler if a character has been selected
 *
 * Arguments:
 * 0: _ctrl <CONTROL> - control of the button pressed

 * Public: No
 *
 * Scope: Client 
 */

params [["_ctrl", objNull]];
DEBUG("select called");
if (_ctrl isEqualTo objNull) exitWith { ERROR("_ctrl was objNull") };
private _characterSlot = _ctrl getVariable ["_characterSlot", objNull];
if (_characterSlot isEqualTo objNull) exitWith { ERROR("_characterSlot was objNull") };

private _loadout = [_characterSlot, COOPR_KEY_LOADOUT] call CBA_fnc_hashGet;

if (count _loadout isEqualTo 0) then {
    ERROR("character loadout could not be revoked after selection")
} else {
    player setUnitLoadout _loadout;
};





