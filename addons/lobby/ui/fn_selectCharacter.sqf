#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Event handler if a character has been selected
 *
 * Arguments:
 * 0: _characterSlot <NUMBER> - number of the slot
 *
 * Public: No
 *
 * Scope: MouseButtonDown Event
 */

params [["_ctrl", objNull]];
if (_ctrl isEqualTo objNull) exitWith { ERROR("_ctrl was objNull") };
private _characterSlot = _ctrl getVariable ["_characterSlot", objNull];
if (_characterSlot isEqualTo objNull) exitWith { ERROR("_characterSlot was objNull") };

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG_NEW;

// hide the creation control if open
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
_characterCreationCtrl ctrlShow false;
_characterCreationCtrl ctrlEnable false;

// show the description control if open
private _characterDescriptionCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION;
_characterDescriptionCtrl ctrlShow true;
_characterDescriptionCtrl ctrlEnable true;

private _roleId = [_characterSlot, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
private _roleNamesHash = [COOPR_ROLE_NAMES, []] call CBA_fnc_hashCreate;
private _roleName = [_roleNamesHash, _roleId] call CBA_fnc_hashGet;

private _reputation = [_characterSlot, COOPR_KEY_REPUTATION] call CBA_fnc_hashGet;
private _tmpReputation = [_characterSlot, COOPR_KEY_TMP_REPUTATION] call CBA_fnc_hashGet;

private _textCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_TEXT;
private _deleteButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_DELETE_BUTTON;
private _playButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_PLAY_BUTTON;
private _roleCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_ROLE;
private _perksCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_PERKS;
private _traitsCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_TRAITS;

//set role picture for selected character
private _roleImage = [_roleId] call coopr_fnc_getImageForRole;
_roleCtrl ctrlSetText _roleImage;
_perksCtrl ctrlSetText _roleImage; // TODO: change to perk icon
_traitsCtrl ctrlSetText _roleImage; // TODO: change to trait icon

private _roleText = parseText (format ["<t>Role:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, _roleName]);
private _levelText = parseText (format ["<t>Level:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, 0]);
private _perksText = parseText (format ["<t>Perks:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, "No Perk"]);
private _traitsText = parseText (format ["<t>Traits:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, "No Trait"]);
private _reputationText = parseText (format ["<t>Reputation:</t><t color='%1'> %2</t>", COOPR_POSITIVE_COLOR_HEX, _reputation]);
private _tmpReputationText = parseText (format ["<t>Temp Reputation:</t><t color='%1'> %2</t>", COOPR_POSITIVE_COLOR_HEX, _tmpReputation]);

private _composedText = composeText [_roleText, lineBreak, _levelText, lineBreak, _perksText, lineBreak, _traitsText,
                                     lineBreak, lineBreak, _reputationText, lineBreak, _tmpReputationText];

//set character text
_textCtrl ctrlSetStructuredText _composedText;

// set loadout on character preview
private _loadout = [_characterSlot, COOPR_KEY_LOADOUT] call CBA_fnc_hashGet;
if (count _loadout isEqualTo 0) then {
    ERROR("character loadout could not be revoked after selection")
} else {
    player setUnitLoadout _loadout;
    [player, "GUARD", "FULL"] call BIS_fnc_ambientAnim;
};





