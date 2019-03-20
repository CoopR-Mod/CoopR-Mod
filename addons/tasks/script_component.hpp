#include "\x\coopr\addons\core\script_mod.hpp"

#define COMPONENT tasks
#define DEBUG_CTX "COOPR.TASKS"

#define COOPR_ACCURACY_THRESHOLD 65
#define COOPR_TASK_MIN_TASK_TIME 5
#define COOPR_TASK_MIN_FRESHNESS 86400

// Recon Report Options
#define COOPR_RECONREP_TYPE_OPTIONS ["Infantry", "Motorized", "Mechanized", "Armored"]
#define COOPR_RECONREP_STRENGTH_OPTIONS ["Fireteam", "Squad", "Platoon", "Company"]
#define COOPR_RECONREP_BEHAVIOUR_OPTIONS ["Patrol", "Combat", "Defensive"]

#include "\x\coopr\addons\core\script_macros.hpp"
