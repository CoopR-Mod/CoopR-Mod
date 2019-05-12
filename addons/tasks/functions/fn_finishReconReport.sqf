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

    [[_characterID], "coopr_fnc_getEntriesForCharacter", [_unit], {
      params ["_callbackArgs", "_promisedResult"];
      _callbackArgs params ["_unit"];

      private _reconEntries = _promisedResult;

      if ((count _reconEntries) isEqualTo 0) exitWith {
        INFO("no recon entries created to broadcast");
        [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["No recon reports created"]] call CBA_fnc_notify;
      };

      [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["Recon Report sent!"]] call CBA_fnc_notify;
      [_reconEntries] call coopr_fnc_convertReconReportsToTasks;
      _unit setVariable [COOPR_KEY_RECON_ENTRIES, []];

    }] call coopr_fnc_promise; // coopr_fnc_getEntriesForCharacter

} else {
    SERVER_ONLY_ERROR;
};
