#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Sends and finalizes the recon report
 *
 * Arguments:
 * 0: _unit <OBJECT> - The unit from which the reports should be broadcasted. Needs to be a player
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (isServer) then {
    if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
    if (not (isPlayer _unit)) exitWith { ERROR("_unit was not a player") };

    private _characterID = _unit getVariable [COOPR_KEY_CHARACTER_ID, -1];

    [[_characterID], "coopr_fnc_getEntriesForCharacter", [_unit, _characterID], {
      params ["_callbackArgs", "_promisedResult"];
      _callbackArgs params ["_unit", "_characterId"];
      private _reconEntries = _promisedResult;

      if ((count _reconEntries) isEqualTo 0) exitWith {
        INFO("no recon entries to finish");
        [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["no recon reports created"]] call CBA_fnc_notify;
      };

      [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["recon report completed"]] call CBA_fnc_notify;
      [_reconEntries] call coopr_fnc_convertReportToMission;
      [_characterID, true] call coopr_fnc_setReportState;
      _unit setVariable [COOPR_KEY_IN_RECON, false, true];

    }] call coopr_fnc_promise; // coopr_fnc_getEntriesForCharacter

} else {
    SERVER_ONLY_ERROR;
};
