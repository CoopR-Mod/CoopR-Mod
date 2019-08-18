#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_MissionBoard_Dialog";
waitUntil {!isNull findDisplay GUI_ID_MISSIONBOARD_DIALOG};

DEBUG("initialising missionboard ui");

private _effect = ppEffectCreate ["DynamicBlur", 10];
_effect ppEffectEnable true;
_effect ppEffectAdjust [10];
_effect ppEffectCommit 0.1;

private _missionBoardDisplay = findDisplay GUI_ID_MISSIONBOARD_DIALOG;
_missionBoardDisplay setVariable ["effect", _effect];
_missionBoardDisplay displayAddEventHandler ["Unload", { ppEffectDestroy ((_this select 0) getVariable "effect")} ];

private _combatDocument = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_DOCUMENT_COMBAT;
private _reconDocument = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_DOCUMENT_RECON;
private _mission1 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_1;
private _mission2 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_2;
private _mission3 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_3;
private _missionTypeLabel1 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_1_TYPE_LABEL;
private _missionTypeLabel2 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_2_TYPE_LABEL;
private _missionTypeLabel3 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_3_TYPE_LABEL;
private _reportAccuracy1 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_1_ACCURACY;
private _reportAccuracy2 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_2_ACCURACY;
private _reportAccuracy3 = _missionBoardDisplay displayCtrl GUI_ID_MISSIONBOARD_MISSION_3_ACCURACY;
private _allTypeLabels = [_missionTypeLabel1, _missionTypeLabel2, _missionTypeLabel3];
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


[[COOPR_SERVER_ID], "coopr_fnc_getQueuedMissionsCount", [_combatDocument, _reconDocument], {
    params ["_callbackArgs", "_promisedResult"];
    _callbackArgs params ["_combatDocument", "_reconDocument"];
    private _hasCombatMissions = _promisedResult > 0;

    if (_hasCombatMissions) then { _combatDocument ctrlShow true };

    _combatDocument ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_selectMissionType }];
    _reconDocument ctrlAddEventHandler ["MouseButtonDown", { [player] remoteExec ["coopr_fnc_requestCooprReconMission", EXEC_SERVER]; closeDialog GUI_ID_MISSIONBOARD_DIALOG }];

    DEBUG("missionboard ui initialized");

}] call coopr_fnc_promise;

