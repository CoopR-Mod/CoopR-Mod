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
if (_ctrl isEqualTo objNull) exitWith { ERROR("_ctrl was objNull") };
private _characterSlot = _ctrl getVariable ["_characterSlot", objNull];
if (_characterSlot isEqualTo objNull) exitWith { ERROR("_characterSlot was objNull") };

// hide the creation control if open
private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG_NEW;
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
_characterCreationCtrl ctrlShow false;
_characterCreationCtrl ctrlEnable false;

private _loadout = [_characterSlot, COOPR_KEY_LOADOUT] call CBA_fnc_hashGet;

if (count _loadout isEqualTo 0) then {
    ERROR("character loadout could not be revoked after selection")
} else {
    player setUnitLoadout _loadout;
};





