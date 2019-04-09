#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_TaskBoard_Dialog";
waitUntil {!isNull findDisplay GUI_ID_TASKBOARD_DIALOG};

DEBUG("initialising taskboard ui");

private _taskBoardDisplay = findDisplay GUI_ID_TASKBOARD_DIALOG;
private _combatDocument = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_COMBAT;
private _combatLabel = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_COMBAT_LABEL;
private _reconDocument = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_RECON;
private _reconLabel = _taskBoardDisplay displayCtrl GUI_ID_TASKBOARD_DOCUMENT_RECON_LABEL;

_reconDocument ctrlAddEventHandler ["MouseButtonDown", { DEBUG("Recon Document opened"); }];

DEBUG("taskboard ui initialized");
