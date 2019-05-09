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

[[], "coopr_fnc_getAllQueuedTasks", [_ctrl], {
    params ["_callbackArgs", "_promisedResult"];
    _callbackArgs params ["_ctrl"];

    private _allMissionSelections =  _ctrl getVariable ["missions", []];
    private _allTypeLabels =  _ctrl getVariable ["typeLabels", []];
    private _allReportAccuracies =  _ctrl getVariable ["reportAccuracies", []];
    private _other =  _ctrl getVariable ["other", objNull];

    if (_allMissionSelections isEqualTo []) exitWith { ERROR("no mission selections given to document handler")};

    // hide documents
    _ctrl ctrlShow false;
    _other ctrlShow false;

    {
        private _cooprTask = _x select 0;
        private _typeLabel = [[_cooprTask, COOPR_KEY_TASK_TYPE] call CBA_fnc_hashGet] call coopr_fnc_getLabelByMissionType;
        private _accuracy = [_cooprTask, COOPR_KEY_TASK_ACCURACY] call CBA_fnc_hashGet;
        private _accuracyLabel = "Accuracy: " + (_accuracy call coopr_fnc_getLabelForAccuracy);
        private _missionSelection = _allMissionSelections select _forEachIndex;

        _missionSelection setVariable ["index", _forEachIndex];
        _missionSelection ctrlAddEventHandler ["MouseButtonDown", { [(_this select 0) getVariable "index"] call coopr_fnc_requestCooprTask }];
        _missionSelection ctrlShow true;
        (_allTypeLabels select _forEachIndex) ctrlSetText _typeLabel;
        (_allTypeLabels select _forEachIndex) ctrlShow true;
        (_allReportAccuracies select _forEachIndex) ctrlSetText _accuracyLabel;
        (_allReportAccuracies select _forEachIndex) ctrlShow true;
    } forEach _promisedResult;

}] call coopr_fnc_promise;

// show all task selections

