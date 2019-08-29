#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the skillset for a role by level definition
 *
 * Arguments:
 * 0: _roleClass <STRING> - role class to get skills for
 *
 * Return Value:
 * _skillRanks <CBA_HASH> - skillset in CBA_HASH format. Key is the skill classname and value is a CBA has of level/rank pairs
 *
 * Public: No
 *
 * Scope: Global
 */
params ["_roleClass"];

if (_roleClass isEqualTo "") then { ERROR("_roleClass was not defined") };

private _skillSet = EMPTY_HASH;
private _allSkills = call coopr_fnc_getSkills;
{
    private _skillData = _x;
    private _skillClass = _skillData select 0;
    private _unlockedBy = [_skillClass, "unlockedBy"] call coopr_fnc_getSkillData;
    [_skillSet, _skillClass] call CBA_fnc_hashSet;

    {
        private _unlockEntry = _x;
        private _role = _unlockEntry select 0;

        if ((toLower _roleClass) isEqualTo (toLower _role)) then {
            private _levelRequirements = [_unlockEntry select 1, 0] call CBA_fnc_hashCreate;
            [_skillSet, _skillClass, _levelRequirements] call CBA_fnc_hashSet;
        };

    } forEach _unlockedBy;
} forEach _allSkills;

_skillSet // return
