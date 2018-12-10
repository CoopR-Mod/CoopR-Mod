#include "script_component.hpp"

params ["_class"];

switch (_class) do {
    case COOPR_ROLE_LEADER: { COOPR_ROLE_LEADER_LOADOUT };
    case COOPR_ROLE_MEDIC: { COOPR_ROLE_MEDIC_LOADOUT};
    case COOPR_ROLE_ENGINEER: { COOPR_ROLE_ENGINEER_LOADOUT };
    case COOPR_ROLE_DMR: { COOPR_ROLE_DMR_LOADOUT };
    case COOPR_ROLE_MG: { COOPR_ROLE_MG_LOADOUT };
    default { [] };
};
