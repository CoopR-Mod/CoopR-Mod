#include "script_component.hpp"

params [["_role", objNull]];

if (_role isEqualTo objNull) exitWith { ERROR("_role was null") };

switch (_role) do {
    case ROLE_LEADER: { "group-leader-256.paa" };
    case ROLE_MEDIC: { "medic-256.paa" };
    case ROLE_ENGINEER: { "engineer-256.paa" };
    case ROLE_DMR: { "designated-marksman-256.paa" };
    case ROLE_MG: { "mg-gunner-256.paa" };
    default { "<error>" };
}


