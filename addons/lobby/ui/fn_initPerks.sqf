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

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
private _perks = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_PERKS;

_perks ctrlShow true;
_perks ctrlEnable true;

private _perks = [];
for "_i" from 0 to 8 do { _perks pushBackUnique (_loginDialog displayCtrl PERK(_i)) };

private _perksCol1 = [_perks select 0, _perks select 3, _perks select 6];
private _perksCol2 = [_perks select 1, _perks select 4, _perks select 7];
private _perksCol3 = [_perks select 2, _perks select 5, _perks select 8];

{
    { _x ctrlRemoveAllEventHandlers "MouseButtonDown"; } forEach _x;
} forEach [_perksCol1, _perksCol2, _perksCol3];

{
    // use the index per perkCol iteration to multiply offset of col (see CoopR_Login_Dialog.hpp for perk x-axis offsets)
    private _col = _forEachIndex;
    {
        _x setVariable ["_col", _col];
        _x ctrlAddEventHandler ["ButtonClick", {
            params ["_ctrl"];
            private _col = _ctrl getVariable "_col";
            [_ctrl, 110 * _col] call coopr_fnc_togglePerkSelection;
            private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
            private _infoBoxText = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX_TEXT;
            private _infoBoxTitle = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_INFOBOX_TITLE;

            _infoBoxTitle ctrlSetText "Perk Description";
            _infoBoxText ctrlSetText "This is a perk";
         }];
    } forEach _x;
} forEach [_perksCol1, _perksCol2, _perksCol3];

