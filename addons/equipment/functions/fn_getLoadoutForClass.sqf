#include "script_component.hpp"

params ["_class"];

switch (_class) do {
    case CLASS_LEADER: { COOPR_CLASS_LEADER_LOADOUT };
    case CLASS_MEDIC: { COOPR_CLASS_MEDIC_LOADOUT};
    case CLASS_ENGINEER: { COOPR_CLASS_ENGINEER_LOADOUT };
    case CLASS_DMR: { COOPR_CLASS_DMR_LOADOUT };
    case CLASS_MG: { COOPR_CLASS_MG_LOADOUT };
    default { [] };
};
