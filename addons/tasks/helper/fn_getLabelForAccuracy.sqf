#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the human readable description of the quality of report accuracy
 *
 * Arguments:
 * 0: _accuracy <NUMBER> - accuracy of a report
 *
 * Return Value:
 * _accuracyLabel <STRING>
 *
 * Example:
 * 0 call coopr_fnc_getLabelForAccuracy;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_accuracy", -1]];

if (_accuracy isEqualTo -1) exitWith { ERROR("_accuracy was not defined") };

if (_accuracy == 0) exitWith { localize "str_coopr_report_acc_useless"; };
if (_accuracy == 100) exitWith { localize "str_coopr_report_acc_confirmed"; };
if (_accuracy > COOPR_ACCURACY_THRESHOLD ) exitWith { localize "str_coopr_report_acc_accurate"; };
if (_accuracy <= COOPR_ACCURACY_THRESHOLD ) exitWith { localize "str_coopr_report_acc_inaccurate"; }; 