// macros to access mission attributes a bit more conveniently

#define DEFAULT_VAL(section, id) #section get3DENMissionAttribute #id
// core addon
#define COOPR_DEV_MODE (missionNamespace getVariable ["coopr_core_dev_mode", DEFAULT_VAL(CoopR_Core,CoopRCoreDevMode)])
// rpg addon
#define COOPR_REP_INF (missionNamespace getVariable ["coopr_rpg_rep_inf", DEFAULT_VAL(CoopR_RPG,CoopRRPGRepPerInf)])
#define COOPR_WIA_REDUCTION (missionNamespace getVariable ["coopr_rpg_wia_rep_reduction", DEFAULT_VAL(CoopR_RPG,CoopRRPGWIARepReduction)])
