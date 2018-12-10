#include "script_component.hpp"

params ["_class"];

switch (_class) do {
    case ROLE_LEADER: { COOPR_ROLE_LEADER_LOADOUT };
    case ROLE_MEDIC: { COOPR_ROLE_MEDIC_LOADOUT};
    case ROLE_ENGINEER: { COOPR_ROLE_ENGINEER_LOADOUT };
    case ROLE_DMR: { COOPR_ROLE_DMR_LOADOUT };
    case ROLE_MG: { COOPR_ROLE_MG_LOADOUT };
    default { [] };
};
