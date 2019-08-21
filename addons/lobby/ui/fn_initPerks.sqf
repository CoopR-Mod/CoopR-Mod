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

#define PERK(var) (1600 + var)

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
    _x ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrl"];
        DEBUG2("debug perk %1", _ctrl);
        if !(_ctrl getVariable ["isSelected", false]) then {
            _ctrl setVariable ["isSelected", true];
            _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256.paa";
            //_ctrl ctrlSetScale 1.1;
            _ctrl ctrlSetPosition [ (-5 * safeZoneW) / 1920,
                                    (-5 * safeZoneH) / 1080,
                                    (110 * safeZoneW) / 1920,
                                    (110 * safeZoneH) / 1080];
            _ctrl ctrlCommit 0.2;
        } else {
            _ctrl setVariable ["isSelected", false];
            _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perk-sixth-256.paa";
            //_ctrl ctrlSetScale 1.0;
            _ctrl ctrlSetPosition [(0 * safeZoneW) / 1920,
                                   (0 * safeZoneH) / 1080,
                                   (100 * safeZoneW) / 1920,
                                   (100 * safeZoneH) / 1080];
            _ctrl ctrlCommit 0.2;
        };
     }];
} forEach _perksCol1;

//{
//    _x ctrlAddEventHandler ["ButtonClick", {
//        params ["_ctrl"];
//        DEBUG2("debug perk %1", _ctrl);
//        if !(_ctrl getVariable ["isSelected", false]) then {
//            _ctrl setVariable ["isSelected", true];
//            _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256.paa";
//            //_ctrl ctrlSetScale 1.1;
//            _ctrl ctrlSetPosition [ (105 * safeZoneW) / 1920,
//                                    (-5 * safeZoneH) / 1080,
//                                    (110 * safeZoneW) / 1920,
//                                    (110 * safeZoneH) / 1080];
//            _ctrl ctrlCommit 0.2;
//        } else {
//            _ctrl setVariable ["isSelected", false];
//            _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perk-sixth-256.paa";
//            //_ctrl ctrlSetScale 1.0;
//            _ctrl ctrlSetPosition [(110 * safeZoneW) / 1920,
//                                   (0 * safeZoneH) / 1080,
//                                   (100 * safeZoneW) / 1920,
//                                   (100 * safeZoneH) / 1080];
//            _ctrl ctrlCommit 0.2;
//        };
//     }];
//} forEach _perksCol2;

//{
//    _x ctrlAddEventHandler ["ButtonClick", {
//        params ["_ctrl"];
//        DEBUG2("debug perk %1", _ctrl);
//        if !(_ctrl getVariable ["isSelected", false]) then {
//            _ctrl setVariable ["isSelected", true];
//            _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256.paa";
//            //_ctrl ctrlSetScale 1.1;
//            _ctrl ctrlSetPosition [ (205 * safeZoneW) / 1920,
//                                    (-5 * safeZoneH) / 1080,
//                                    (110 * safeZoneW) / 1920,
//                                    (110 * safeZoneH) / 1080];
//            _ctrl ctrlCommit 0.2;
//        } else {
//            _ctrl setVariable ["isSelected", false];
//            _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perk-sixth-256.paa";
//            //_ctrl ctrlSetScale 1.0;
//            _ctrl ctrlSetPosition [(210 * safeZoneW) / 1920,
//                                   (0 * safeZoneH) / 1080,
//                                   (100 * safeZoneW) / 1920,
//                                   (100 * safeZoneH) / 1080];
//            _ctrl ctrlCommit 0.2;
//        };
//     }];
//} forEach _perksCol3;
