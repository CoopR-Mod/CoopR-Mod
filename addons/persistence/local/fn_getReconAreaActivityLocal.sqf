#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the hostile activity in strength of the recon area
 *
 * Arguments:
 * 0: _characterId <NUMBER> - ID of the character the reports belongs to
 *
 * Return Value:
 * _strengths <CBA_HASH> - all hostile strengths in the recon area
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterId", -1]];

if (isServer) then {
    if (_characterId isEqualTo -1) exitWith { ERROR("_characterId was not defined") };

    INFO2("get recon area activity for character %1", _characterId);
    private _hasUnfinishedReport = format ["SELECT count(*) FROM recon_reports WHERE character_id = %1 and finished = 0", _characterId];
    private _hasUnfinishedReport = (_hasUnfinishedReport call coopr_fnc_extDB3sql) select 0 select 0;
    if (_hasUnfinishedReport == 0) exitWith {
        DEBUG2("no unfinished recon report found for character %1", _characterId);
    };
    private _getActivity = format ["SELECT activity FROM recon_reports WHERE character_id = %1 AND finished = 0", _characterId];
    private _result = (_getActivity call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR;
};
