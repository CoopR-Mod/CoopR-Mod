#include "script_component.hpp"

params [["_logic", objNull]];

if (isServer) then {
    private _hqBoundsMarker = _logic getVariable ["HQ_Bounds", ""];
    private _hqSide = _logic getVariable ["Side", ""];
    private _faction = _logic getVariable ["Faction", ""];

    DEBUG2("Position of HQ is: %1", getPos _logic);
    DEBUG2("Side of HQ is: %1", _hqSide);
    DEBUG2("Faction of HQ is: %1", _faction);

    [_hqSide, _faction, _logic, _hqBoundsMarker] call coopr_fnc_initHQ;

    true;
} else {
    SERVER_ONLY_ERROR;
    false;
};
