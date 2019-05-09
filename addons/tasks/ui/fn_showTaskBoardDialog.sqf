#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_TaskBoard_Dialog";
waitUntil {!isNull findDisplay GUI_ID_TASKBOARD_DIALOG};

DEBUG("initialising taskboard ui");

private _effect = ppEffectCreate ["DynamicBlur", 10];
_effect ppEffectEnable true;
_effect ppEffectAdjust [10];
_effect ppEffectCommit 0.1;

private _taskBoardDisplay = findDisplay GUI_ID_TASKBOARD_DIALOG;
_taskBoardDisplay setVariable ["effect", _effect];
_taskBoardDisplay displayAddEventHandler ["Unload", { ppEffectDestroy ((_this select 0) getVariable "effect")} ];

private _combatDocument = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_COMBAT;
private _reconDocument = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_RECON;
private _mission1 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_1;
private _mission2 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_2;
private _mission3 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_3;
private _taskTypeLabel1 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_1_TYPE_LABEL;
private _taskTypeLabel2 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_2_TYPE_LABEL;
private _taskTypeLabel3 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_3_TYPE_LABEL;
private _reportAccuracy1 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_1_ACCURACY;
private _reportAccuracy2 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_2_ACCURACY;
private _reportAccuracy3 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_3_ACCURACY;
private _allTypeLabels = [_taskTypeLabel1, _taskTypeLabel2, _taskTypeLabel3];
private _allReportAccuracies = [_reportAccuracy1, _reportAccuracy2, _reportAccuracy3];
private _allMissionSelections = [_mission1, _mission2, _mission3];

// attach data to controls
_combatDocument setVariable ["missions", _allMissionSelections];
_combatDocument setVariable ["typeLabels", _allTypeLabels];
_combatDocument setVariable ["reportAccuracies", _allReportAccuracies];
_combatDocument setVariable ["other", _reconDocument];
_reconDocument setVariable ["missions", _allMissionSelections];
_reconDocument setVariable ["other", _combatDocument];

_combatDocument ctrlShow false;

// initially hide all mission selections
{ _x ctrlShow false } forEach _allMissionSelections;
{ _x ctrlShow false } forEach _allTypeLabels;
{ _x ctrlShow false } forEach _allReportAccuracies;


[[], "coopr_fnc_getQueuedTasksCount", [_combatDocument, _reconDocument], {
    params ["_callbackArgs", "_promisedResult"];
    _callbackArgs params ["_combatDocument", "_reconDocument"];
    private _hasCombatTasks = _promisedResult > 0;

    if (_hasCombatTasks) then { _combatDocument ctrlShow true };

    _combatDocument ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectMissionType }];
    _reconDocument ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_requestCooprReconTask; closeDialog GUI_ID_TASKBOARD_DIALOG }];

    DEBUG("taskboard ui initialized");

}] call coopr_fnc_promise;

