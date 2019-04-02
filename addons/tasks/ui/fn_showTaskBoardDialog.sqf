#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_TaskBoard_Dialog";
waitUntil {!isNull findDisplay GUI_ID_TASKBOARD_DIALOG};

DEBUG("initialising taskboard ui");

private _taskBoardDisplay = findDisplay GUI_ID_TASKBOARD_DIALOG;

DEBUG("taskboard ui initialized");
