#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will check different situations of a killed unit. This will then orchestrate player suicides
 * PvP or PvE kills.
 *
 * Arguments:
 * Event Argument: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Killed
 *
 * Return Value:
 * None
 *
 * Example:
 * Event: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Killed
 *
 * Public: No
 *
 * Scope: Server
 */

params ["_victim", "_killer", "_instigator", "_useEffects"];

if (isServer) then {
    DEBUG2("instigator: %1", _instigator);
    DEBUG2("instigator is null: %1", isNull _instigator);
    DEBUG2("lastDmgSrc: %1", _lastDamageSource);
    DEBUG2("killer: %1", _killer);
    DEBUG2("victim: %1", _victim);

    // if entity died of later causes than the shot itself
    if (isNull _instigator) then {
        if (call coopr_fnc_isACE3Active) then {
            private _lastDamageSource = _victim getVariable ["ace_medical_lastDamageSource", objNull];
            _killer = _lastDamageSource;
        } else {
            ERROR("_instigator could not be determined");
        }
    };

    if (isPlayer _victim) then {
        if (_victim isEqualTo _killer) then {
            DEBUG("player killed himself");
        } else {
         // check for PvP
         // add coopr_fnc_playerKilledPlayer;
        };
    };

    if (isPlayer _killer) then {
        DEBUG("player killed npc");
        [_victim] remoteExec ["coopr_fnc_playerKilledNpc", _killer];
    };
}
