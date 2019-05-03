#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This handler is the action resolved when a player clicks either the recon or combat mission document in the
 * task board GUI. It therefore will hide the document GUIs and show the mission selection document icons.
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * Event Handler
 *
 * Public: No
 *
 * Scope: Client
 */

params ["_ctrl"];

private _allMissionSelections =  _ctrl getVariable ["missions", []];
private _allTypeLabels =  _ctrl getVariable ["typeLabels", []];
private _allReportAccuracies =  _ctrl getVariable ["reportAccuracies", []];
private _other =  _ctrl getVariable ["other", objNull];

if (_allMissionSelections isEqualTo []) exitWith { ERROR("no mission selections given to document handler")};

// hide documents
_ctrl ctrlShow false;
_other ctrlShow false;

// show all task selections
{
	(_allMissionSelections select _forEachIndex) ctrlAddEventHandler ["MouseButtonDown", { DEBUG("seleted mission") }];
	(_allMissionSelections select _forEachIndex) ctrlShow true;
	(_allTypeLabels select _forEachIndex) ctrlSetText "DEBUG_TYPE";
	(_allTypeLabels select _forEachIndex) ctrlShow true;
	(_allReportAccuracies select _forEachIndex) ctrlSetText "DEBUG_ACC";
	(_allReportAccuracies select _forEachIndex) ctrlShow true;
} forEach COOPR_TASKS_QUEUE;


