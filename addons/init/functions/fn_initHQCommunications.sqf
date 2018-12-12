#include "script_component.hpp"

params [["_communcations", []]];

{
    (missionNamespace getVariable ([_x, " ", ""] call coopr_fnc_stringReplace)) addAction ["Call ammo resupply", {
        COOPR_AMMOBOX addMagazineAmmoCargo ["30Rnd_65x39_caseless_mag", 10, 29]
    }, [], 0.5, true, true, "", "true"];
} forEach _communcations;

