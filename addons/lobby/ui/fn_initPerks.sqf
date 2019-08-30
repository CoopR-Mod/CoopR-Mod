#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * init function for the perk event handlers and all the magic around it
 *
 * Arguments:
 * None
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

#define PERK_NAME 1

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
private _perkDisplay = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_PERKS;
private _perkInfoText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_PERKS_TEXT;

_perkDisplay ctrlShow true;
_perkDisplay ctrlEnable true;

_perkInfoText ctrlSetStructuredText parseText (format ["You are allowed to choose a maxmium of <t color='%1'>%2</t> perks for this character", COOPR_MAIN_COLOR_HEX, COOPR_MAX_PERKS]);

private _allPerks = call coopr_fnc_getPerks;
private _perkAmount = count _allPerks;
private _perkNames = _allPerks apply { _x select PERK_NAME };

if (_perkAmount <= 0 ) exitWith { DEBUG("no perks found to initialize") };

private _perkControls = [];
for "_i" from 0 to (_perkAmount - 1) do { _perkControls pushBackUnique (_loginDialog displayCtrl PERK(_i)) };
{_x setVariable ["perk", _allPerks select _forEachIndex]} forEach _perkControls;

{
    // show perk in GUI
    _x ctrlShow true;
    _x ctrlEnable true;
    private _perk = _x getVariable "perk";
    _x ctrlSetText ([(_perk select 0), "icon"] call coopr_fnc_getPerkData);

    private _offsetMultiplier = 0;
    if (_forEachIndex in [1,4,7]) then { _offsetMultiplier = 1};
    if (_forEachIndex in [2,5,8]) then { _offsetMultiplier = 2};

    _x setVariable ["isSelected", true];
    _x setVariable ["offsetMultiplier", _offsetMultiplier];
    // initially reset offset position
    [_x, 110 * _offsetMultiplier] call coopr_fnc_togglePerkSelection;

    _x ctrlRemoveAllEventHandlers "ButtonClick";
    _x ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrl"];
        private _perk = _ctrl getVariable "perk";
        private _perkClass = _perk select 0;
        private _offsetMultiplier = _ctrl getVariable "offsetMultiplier";
        [_ctrl, 110 * _offsetMultiplier] call coopr_fnc_togglePerkSelection;
        private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
        private _infoBoxText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX_TEXT;
        private _infoBoxTitle = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX_TITLE;

        _infoBoxTitle ctrlSetText ([_perkClass, "name"] call coopr_fnc_getPerkData);
        private _description = [_perkClass, "description"] call coopr_fnc_getPerkData;
        private _advantage = [_perkClass, "advantage"] call coopr_fnc_getPerkData;
        private _disadvantage = [_perkClass, "disadvantage"] call coopr_fnc_getPerkData;
        private _infoText = format ["%1<br/>
                            <br/><t color='%2'>%3</t>
                            <br/><t color='%4'>%5</t>", _description,
                            COOPR_POSITIVE_COLOR_HEX, _advantage,
                            COOPR_ERROR_COLOR_HEX, _disadvantage];

        _infoBoxText ctrlSetStructuredText (parseText _infoText);
     }];
} forEach _perkControls;

