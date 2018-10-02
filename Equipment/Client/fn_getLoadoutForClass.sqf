
#include "..\constants.hpp"

params ["_class"];

switch (_class) do {
    case CLASS_LEADER: {  CLASS_LEADER_LOADOUT };
    case CLASS_MEDIC: { CLASS_MEDIC_LOADOUT};
    case CLASS_ENGINEER: { CLASS_ENGINEER_LOADOUT };
    case CLASS_DMR: { CLASS_DMR_LOADOUT };
    case CLASS_MG: { CLASS_MG_LOADOUT };
    default { [] };
};
