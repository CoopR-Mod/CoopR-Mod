#include "script_component.hpp"

params [["_logic", objNull]];

COOPR_ROLE_ENGINEER_LOADOUT = call compile (_logic getVariable ["EngineerLoadout", objNull]);
COOPR_ROLE_LEADER_LOADOUT = call compile (_logic getVariable ["GroupLeaderLoadout", objNull]);
COOPR_ROLE_MEDIC_LOADOUT = call compile (_logic getVariable ["MedicLoadout", objNull]);
COOPR_ROLE_DMR_LOADOUT = call compile (_logic getVariable ["DMRLoadout", objNull]);
COOPR_ROLE_MG_LOADOUT = call compile (_logic getVariable ["MGLoadout", objNull]);

if (COOPR_ROLE_ENGINEER_LOADOUT isEqualTo objNull) then { SETUPERROR("engineer loadout is not defined") };
if (COOPR_ROLE_LEADER_LOADOUT isEqualTo objNull) then { SETUPERROR("leader loadout is not defined") };
if (COOPR_ROLE_MEDIC_LOADOUT isEqualTo objNull) then { SETUPERROR("medic loadout is not defined") };
if (COOPR_ROLE_DMR_LOADOUT isEqualTo objNull) then { SETUPERROR("dmr loadout is not defined") };
if (COOPR_ROLE_MG_LOADOUT isEqualTo objNull) then { SETUPERROR("mg loadout is not defined") };

true
