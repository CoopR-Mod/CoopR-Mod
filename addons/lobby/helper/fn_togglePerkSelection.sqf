#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * logic to activate / deactivate a perk icon in the character creation gui
 *
 * Arguments:
 * 0: _ctrl <CONTROL> - control of perk
 * 1: _offsetX <NUMBER> - the offset of the column in the x axis
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 *
 * Scope: Client 
 */

params [["_ctrl", objNull],
        ["_offsetX", 0]];

if (_ctrl isEqualTo objNull) exitWith { ERROR("_ctrl was undefined") };


if !(_ctrl getVariable ["isSelected", false]) then {
    // too many perks - just highlight the perk up shortly
    if (count (call coopr_fnc_getSelectedPerksCtrl) >= MAX_PERKS) then {
        [_ctrl, _offsetX] spawn {
            params ["_ctrl", "_offsetX"];
            _ctrl ctrlSetPosition [ ((_offsetX -5) * safeZoneW) / 1920,
                                    (-5 * safeZoneH) / 1080,
                                    (110 * safeZoneW) / 1920,
                                    (110 * safeZoneH) / 1080];
            _ctrl ctrlCommit 0.1;
            sleep 0.1;
            _ctrl ctrlSetPosition [(_offsetX * safeZoneW) / 1920,
                                   (0 * safeZoneH) / 1080,
                                   (100 * safeZoneW) / 1920,
                                   (100 * safeZoneH) / 1080];
            _ctrl ctrlCommit 0.1;
        };
    } else {
        // Not selected and not max perk count
        _ctrl setVariable ["isSelected", true];
        _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perks\perk-sixth-selected-256.paa";
        //_ctrl ctrlSetScale 1.1;
        _ctrl ctrlSetPosition [ ((_offsetX -5) * safeZoneW) / 1920,
                                (-5 * safeZoneH) / 1080,
                                (110 * safeZoneW) / 1920,
                                (110 * safeZoneH) / 1080];
        _ctrl ctrlCommit 0.2;
    };
} else {
    // deselect perk
    _ctrl setVariable ["isSelected", false];
    _ctrl ctrlSetText "\x\coopr\addons\rpg\data\images\perks\perk-sixth-256.paa";
    //_ctrl ctrlSetScale 1.0;
    _ctrl ctrlSetPosition [(_offsetX * safeZoneW) / 1920,
                           (0 * safeZoneH) / 1080,
                           (100 * safeZoneW) / 1920,
                           (100 * safeZoneH) / 1080];
    _ctrl ctrlCommit 0.2;
};


