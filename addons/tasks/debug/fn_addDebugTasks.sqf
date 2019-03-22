#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function is only for debugging purposes
 *
 */

if (COOPR_DEV_MODE) then {
    private _newCooprTask = EMPTY_HASH;
    [_newCooprTask, COOPR_KEY_TASK_TYPE, "coopr_task_type_sniperteam"] call CBA_fnc_hashSet;
    [_newCooprTask, COOPR_KEY_TASK_LOCATION, [17699.7, 11426, 0]] call CBA_fnc_hashSet;
    [_newCooprTask, COOPR_KEY_TASK_DESCRIPTION, "DO NOT USE SPECIAL CHARACTERS IN YOUR TEXT!"] call CBA_fnc_hashSet;
    [_newCooprTask, COOPR_KEY_TASK_REPORT_TIME, 2993.16] call CBA_fnc_hashSet;

    COOPR_TASKS_QUEUE pushBack _newCooprTask;
}
