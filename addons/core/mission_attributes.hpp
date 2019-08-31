// macros to access mission attributes a bit more conveniently
#define DEFAULT_VAL(section, id) #section get3DENMissionAttribute #id
// core addon
#define COOPR_DEV_MODE (missionNamespace getVariable ["coopr_core_dev_mode", DEFAULT_VAL(CoopR_Core,CoopRCoreDevMode)])
// rpg addon
#define COOPR_REP_INF (missionNamespace getVariable ["coopr_rpg_rep_inf", DEFAULT_VAL(CoopR_RPG,CoopRRPGRepPerInf)])
#define COOPR_WIA_REDUCTION (missionNamespace getVariable ["coopr_rpg_wia_rep_reduction", DEFAULT_VAL(CoopR_RPG,CoopRRPGWIARepReduction)])
// persistence addon
#define COOPR_PERSISTENCE_LOCATION (missionNamespace getVariable ["coopr_persistence_location", DEFAULT_VAL(CoopR_Persistence,CoopRPersistenceLocation)])
#define COOPR_SERVER_ID (missionNamespace getVariable ["coopr_persistence_serverid", DEFAULT_VAL(CoopR_Persistence,CoopRPersistenceServerId)])
// integration addon
#define COOPR_ACE3 (missionNamespace getVariable ["coopr_integration_ace", DEFAULT_VAL(CoopR_Integration,CoopRIntegrateACE3)])
#define COOPR_ALIVE (missionNamespace getVariable ["coopr_integration_alive", DEFAULT_VAL(CoopR_Integration,CoopRIntegrateALiVE)])
