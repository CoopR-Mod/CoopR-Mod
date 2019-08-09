#include "\x\coopr\addons\core\script_mod.hpp"

#define COMPONENT missions
#define DEBUG_CTX "COOPR.MISSIONS"

#define COOPR_ACCURACY_THRESHOLD 65
#define COOPR_MISSION_MIN_MISSION_TIME 5
#define COOPR_MISSION_MIN_FRESHNESS 86400
#define COOPR_MARKER_DEFENSE_DIAMETER 100

// Recon Report Options
//#define COOPR_RECONREP_TYPE_OPTIONS ["Infantry", "Motorized", "Mechanized", "Armored"]
#define COOPR_RECONREP_TYPE_OPTIONS ["Infantry", "Motorized", "Armored"]
#define COOPR_RECONREP_STRENGTH_OPTIONS ["Fireteam", "Squad", "Platoon", "Company"]
//#define COOPR_RECONREP_BEHAVIOUR_OPTIONS ["Patrol", "Combat", "Defensive"]
#define COOPR_RECONREP_BEHAVIOUR_OPTIONS ["Defensive"]

#include "\x\coopr\addons\core\script_macros.hpp"
