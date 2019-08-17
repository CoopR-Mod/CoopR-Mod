// System Globals
#define EXEC_CLIENTS -2
#define EXEC_SERVER  2
#define EXEC_GLOBAL  0
#define EMPTY_HASH ([[],[]] call CBA_fnc_hashCreate)
#define UNDEFINED "undefined"

// NEW CHARACTER
#define STARTING_MONEY 500

#define SERVER 2
#define MAX_CHARACTERS 3
#define MAX_TK 3
#define WIA_CD 0.5

//DIALOGS
#define COOPR_LOGIN "CoopR_Login_Dialog"
#define MP_MENU 49
#define ABORT_BUTTON 104

// Campaign Params
#define COOPR_KEY_INTEL_PROGRESS "coopr_intel_progess"

// Default Loadouts
#define EMPTY_LOADOUT [[],[],[],[],[],[],"","",[],["","","","","",""]]
#define HOSTAGE_LOADOUT [[],[],[],[],[],[],"","G_Blindfold_01_white_F",[],["","","","","",""]]
#define WOUNDED_LOADOUT [[],[],[],["U_C_man_sport_3_F",[]],[],[],"","",[],["","","","","",""]]

// Character Params
#define COOPR_KEY_PLAYER_CHARACTERS "coopr_player_characters"
#define COOPR_KEY_PLAYER_LOGGEDIN "coopr_login_state"
#define COOPR_KEY_TEAMKILLS "coopr_player_teamkills"

#define COOPR_KEY_SLOT "coopr_character_slot"
#define COOPR_KEY_NAME "coopr_character_name"
#define COOPR_KEY_UID "coopr_character_user_id"
#define COOPR_KEY_CHARACTER_ID "coopr_character_id"
#define COOPR_KEY_STATE "coopr_character_state"
#define COOPR_KEY_REPUTATION "coopr_character_reputation"
#define COOPR_KEY_TMP_REPUTATION "coopr_character_tmp_reputation"
#define COOPR_KEY_MONEY "coopr_character_money"
#define COOPR_KEY_ROLE "coopr_character_role"
#define COOPR_KEY_POSITION "coopr_character_position"
#define COOPR_KEY_LOADOUT "coopr_character_loadout"
#define COOPR_KEY_WOUNDED_TIMESTAMP "coopr_character_wounded_timestamp"
#define COOPR_KEY_IN_RECON "coopr_character_in_recon"

#define COOPR_STATE_OK "coopr_character_state_ok"
#define COOPR_STATE_WIA "coopr_character_state_wia"
#define COOPR_STATE_KIA "coopr_character_state_kia"
#define COOPR_STATE_HOSTAGE "coopr_character_state_hostage"

#define COOPR_ROLE_LEADER "coopr_role_leader"
#define COOPR_ROLE_MEDIC "coopr_role_medic"
#define COOPR_ROLE_ENGINEER "coopr_role_engineer"
#define COOPR_ROLE_DMR "coopr_role_marksman"
#define COOPR_ROLE_MG "coopr_role_mg"
#define COOPR_ROLE_NONE "coopr_role_none"

// Recon Entry Keys
#define COOPR_KEY_RECON_ENTRY_ID "coopr_recon_entry_id"
#define COOPR_KEY_RECON_ENTRY_OWNER "coopr_recon_entry_owner"
#define COOPR_KEY_RECON_ENTRY_TYPE "coopr_recon_entry_type"
#define COOPR_KEY_RECON_ENTRY_STRENGTH "coopr_recon_entry_strength"
#define COOPR_KEY_RECON_ENTRY_BEHAVIOUR "coopr_recon_entry_behaviour"
#define COOPR_KEY_RECON_ENTRY_MARKER "coopr_recon_entry_marker"
#define COOPR_KEY_RECON_ENTRY_TIME "coopr_recon_entry_time"
#define COOPR_KEY_RECON_ENTRY_LOCATION "coopr_recon_entry_location"

// Recon Report Params
#define COOPR_STRENGTH_TYPE_FIRETEAM "Fireteam"
#define COOPR_STRENGTH_TYPE_SQUAD "Squad"
#define COOPR_STRENGTH_TYPE_PLATOON "Platoon"
#define COOPR_STRENGTH_TYPE_COMPANY "Company"

// Mission Globals
#define COOPR_KEY_ACTIVE_MISSION "coopr_character_active_mission"
#define COOPR_KEY_MISSION_TRACKER "coopr_squad_mission_tracker"

#define COOPR_KEY_MISSION_QUEUE_ID "coopr_mission_queue_id"
#define COOPR_KEY_MISSION_TYPE "coopr_mission_type"
#define COOPR_KEY_MISSION_DESCRIPTION "coopr_mission_description"
#define COOPR_KEY_MISSION_REPORT_TIME "coopr_mission_report_time"
#define COOPR_KEY_MISSION_MARKER "coopr_mission_marker"
#define COOPR_KEY_MISSION_ACCURACY "coopr_mission_accuracy"
#define COOPR_KEY_MISSION_TARGET "coopr_mission_target"

#define COOPR_KEY_MISSION_TRACKER_MISSION_START "coopr_mission_tracker_mission_start"
#define COOPR_KEY_MISSION_TRACKER_VISITED_MISSION_AREA "coopr_mission_tracker_visited_mission_area"
#define COOPR_KEY_MISSION_TRACKER_KILL_COUNT "coopr_mission_tracker_kill_count"
#define COOPR_KEY_MISSION_TRACKER_TYPE "coopr_mission_tracker_type"
#define COOPR_KEY_MISSION_TRACKER_TARGET "coopr_mission_tracker_target"
#define COOPR_KEY_MISSION_TRACKER_RECON_COMPLETE "coopr_mission_tracker_recon_complete"

#define COOPR_MISSION_REPORT_TYPE_INFANTRY "Infantry"
#define COOPR_MISSION_REPORT_TYPE_MOTORIZED "Motorized"
#define COOPR_MISSION_REPORT_TYPE_MECHANIZED "Mechanized"
#define COOPR_MISSION_REPORT_TYPE_ARMORED "Armored"

#define COOPR_MISSION_BEHAVIOUR_DEFENSIVE "Defensive"
#define COOPR_MISSION_BEHAVIOUR_PATROL "Patrol"
#define COOPR_MISSION_BEHAVIOUR_COMBAT "Combat"

#define COOPR_MISSION_TYPE_SNIPERTEAM "coopr_mission_type_sniperteam"
#define COOPR_MISSION_TYPE_ASYMMETRIC "coopr_mission_type_asymmetric"
#define COOPR_MISSION_TYPE_ASSAULT "coopr_mission_type_assault"
#define COOPR_MISSION_TYPE_CONQUER "coopr_mission_type_conquer"
#define COOPR_MISSION_TYPE_JTAC "coopr_mission_type_jtac"
#define COOPR_MISSION_TYPE_AMBUSH "coopr_mission_type_ambush"
#define COOPR_MISSION_TYPE_NONE "coopr_mission_type_none"

#define COOPR_STRENGTH_TYPE_FIRETEAM_MIN 1
#define COOPR_STRENGTH_TYPE_FIRETEAM_MAX 4
#define COOPR_STRENGTH_TYPE_SQUAD_MIN 5
#define COOPR_STRENGTH_TYPE_SQUAD_MAX 14
#define COOPR_STRENGTH_TYPE_PLATOON_MIN 15
#define COOPR_STRENGTH_TYPE_PLATOON_MAX 45
#define COOPR_STRENGTH_TYPE_COMPANY_MIN 46
#define COOPR_STRENGTH_TYPE_COMPANY_MAX 150

// Campsite globals 
#define COOPR_CAMP_ITEM_AREA "coopr_camp_item_area"
#define COOPR_CAMP_ITEM_TENT "coopr_camp_item_tent"
