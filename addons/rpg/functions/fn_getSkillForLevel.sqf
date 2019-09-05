#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Returns the skills unlocked for the given level and role class
 *
 * Arguments:
 * 0: _roleClass <STRING> - class name for given role
 * 1: _level <NUMBER> - level to check for
 *
 * Return Value:
 * _skillClasses <ARRAY> - skill classes arrays available for role & level
 *
 * Example:
 * ["medic", 1] call coopr_fn_getSkillForLevel;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_roleClass", ""],
        ["_level", 0]];

if (_roleClass isEqualTo "") then { ERROR("_roleClass was not defined") };
if (_level isEqualTo 0) then { ERROR("_level was not defined") };

private _skillsForRole = _roleClass call coopr_fnc_getRoleSkills;
private _skillsForLevel = [];

_searchLevel = {
    private _skillClass = _key;
    private _levelHash = _value;
    private _skillRankForLevel = [_levelHash, _level] call CBA_fnc_hashGet;
    if (_skillRankForLevel > 0) then {
        _skillsForLevel pushBackUnique _skillClass;
    };
};

if (([_skillsForRole] call CBA_fnc_hashSize) == 0) exitWith { _skillsForLevel };

[_skillsForRole, _searchLevel] call CBA_fnc_hashEachPair;

_skillsForLevel; // return
