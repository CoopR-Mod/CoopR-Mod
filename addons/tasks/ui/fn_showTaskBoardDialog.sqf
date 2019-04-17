#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_TaskBoard_Dialog";
waitUntil {!isNull findDisplay GUI_ID_TASKBOARD_DIALOG};

DEBUG("initialising taskboard ui");

private _taskBoardDisplay = findDisplay GUI_ID_TASKBOARD_DIALOG;
private _combatDocument = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_COMBAT;
private _reconDocument = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_RECON;
private _mission1 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_1;
private _mission2 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_2;
private _mission3 = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_TASK_3;
private _allMissionSelections = [_mission1, _mission2, _mission3];

// attach data to controls
_combatDocument setVariable ["missions", _allMissionSelections];
_combatDocument setVariable ["other", _reconDocument];
_reconDocument setVariable ["missions", _allMissionSelections];
_reconDocument setVariable ["other", _combatDocument];

// initially hide all mission selections
_mission1 ctrlShow false;
_mission2 ctrlShow false;
_mission3 ctrlShow false;

_combatDocument ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectMissionType }];
_reconDocument ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectMissionType }];

_mission1 ctrlAddEventHandler ["MouseButtonDown", { DEBUG("test")}];
_mission2 ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectMissionType }];
_mission3 ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectMissionType }];

DEBUG("taskboard ui initialized");
