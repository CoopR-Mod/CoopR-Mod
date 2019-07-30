#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This helper function will return the actual task type for a given enemy unit strength and behaviour combination
 *
 * Arguments:
 * 0: _strength <STRING> - The reported strength of the spotted enemy ("Fireteam", "Squad", etc.)
 * 1: _type <STRING> - The reported kind of enemy ("Infantry", "Motorized", etc.)
 * 2: _behaviour <STRING> - The reported behaviour of the enemy unit ("Attacking", "Patroling")
 *
 * Return Value:
 * _taskType <STRING>
 *
 * Example:
 * [COOPR_STRENGTH_TYPE_FIRETEAM, COOPR_TASK_REPORT_TYPE_INFANTRY, COOPR_TASK_BEHAVIOUR_STATIC] call coopr_fnc_determineTaskType;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_strength", ""],
        ["_type", ""],
        ["_behaviour", ""]];

if (_strength isEqualTo "") exitWith { ERROR("_strength was empty string") };
if (_behaviour isEqualTo "") exitWith { ERROR("_behaviour was empty string") };
if (_type isEqualTo "") exitWith { ERROR("_type was empty string") };

switch (_strength) do {
    case COOPR_STRENGTH_TYPE_FIRETEAM: {
        switch (_type) do {
            case COOPR_TASK_REPORT_TYPE_INFANTRY: { COOPR_TASK_TYPE_SNIPERTEAM; };
            case COOPR_TASK_REPORT_TYPE_MOTORIZED: { COOPR_TASK_TYPE_SNIPERTEAM; };
            case COOPR_TASK_REPORT_TYPE_MECHANIZED: { COOPR_TASK_TYPE_JTAC; };
            case COOPR_TASK_REPORT_TYPE_ARMORED: { COOPR_TASK_TYPE_JTAC; };
            default { COOPR_TASK_TYPE_NONE };
        };
    };
    case COOPR_STRENGTH_TYPE_SQUAD: {
        switch (_type) do {
            case COOPR_TASK_REPORT_TYPE_INFANTRY: {
                switch (_behaviour) do {
                    case COOPR_TASK_BEHAVIOUR_DEFENSIVE: { COOPR_TASK_TYPE_CONQUER; };
                    case COOPR_TASK_BEHAVIOUR_PATROL: { COOPR_TASK_TYPE_ASYMMETRIC; };
                    default { COOPR_TASK_TYPE_ASSAULT; };
                }
            };
            case COOPR_TASK_REPORT_TYPE_MOTORIZED: { COOPR_TASK_TYPE_ASYMMETRIC; };
            case COOPR_TASK_REPORT_TYPE_MECHANIZED: { COOPR_TASK_TYPE_JTAC; };
            case COOPR_TASK_REPORT_TYPE_ARMORED: { COOPR_TASK_TYPE_JTAC; };
            default { COOPR_TASK_TYPE_NONE };
        };
    };
    case COOPR_STRENGTH_TYPE_PLATOON: {
        switch (_type) do {
            case COOPR_TASK_REPORT_TYPE_INFANTRY: {
                switch (_behaviour) do {
                    case COOPR_TASK_BEHAVIOUR_STATIC: { COOPR_TASK_TYPE_JTAC; };
                    case COOPR_TASK_BEHAVIOUR_DEFENSIVE: { COOPR_TASK_TYPE_CONQUER; };
                    case COOPR_TASK_BEHAVIOUR_PATROL: { COOPR_TASK_TYPE_AMBUSH; };
                    default { COOPR_TASK_TYPE_CONQUER; };
                }
            };
            case COOPR_TASK_REPORT_TYPE_MOTORIZED: { COOPR_TASK_TYPE_ASYMMETRIC; };
            case COOPR_TASK_REPORT_TYPE_MECHANIZED: { COOPR_TASK_TYPE_JTAC; };
            case COOPR_TASK_REPORT_TYPE_ARMORED: { COOPR_TASK_TYPE_JTAC; };
            default { COOPR_TASK_TYPE_NONE };
        };
    };
    default {
        switch (_type) do {
            case COOPR_TASK_REPORT_TYPE_MOTORIZED: { COOPR_TASK_TYPE_ASYMMETRIC; };
            case COOPR_TASK_REPORT_TYPE_MECHANIZED: { COOPR_TASK_TYPE_JTAC; };
            case COOPR_TASK_REPORT_TYPE_ARMORED: { COOPR_TASK_TYPE_JTAC; };
            default { COOPR_TASK_TYPE_NONE };
        };
    }
};
