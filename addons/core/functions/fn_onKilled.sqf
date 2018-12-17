#include "script_component.hpp"

params ["_victim", "_killer", "_instigator", "_useEffects"];

private _lastDamageSource = _victim getVariable ["ace_medical_lastDamageSource", objNull];
DEBUG2("instigator: %1", _instigator);
DEBUG2("instigator is null: %1", isNull _instigator);
DEBUG2("lastDmgSrc: %1", _lastDamageSource);
DEBUG2("killer: %1", _killer);
DEBUG2("victim: %1", _victim);

// if entity died of later causes than the shot itself
if(isNull _instigator) then {
    _killer = _lastDamageSource;
};

if(isPlayer _victim) then {
    if(_victim isEqualTo _killer) then {
        INFO("player killed himself");
    } else {
     // check for PvP
     // add coopr_fnc_playerKilledPlayer;
    };
} else {
    if (isPlayer _killer) then {
        [_victim] remoteExec ["coopr_fnc_playerKilledNpc", _killer];
    };
}
