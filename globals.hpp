#define DEBUG_CTX "DPL.BASE"

#define SERVER 2
#define MAX_PROFILES 3

#define KEY_PLAYER_PROFILES "dpl_player_profiles"
#define KEY_PLAYER_LOGGEDIN "dpl_login_state"
#define KEY_INTEL_PROGRESS "dpl_intel_progess"
#define KEY_PROFILE_FETCHED "dpl_profile_fetched"

#define KEY_SLOT "dpl_profile_slot"
#define KEY_NAME "dpl_profile_name"
#define KEY_UID "dpl_profile_uid"
#define KEY_REPUTATION "dpl_profile_reputation"
#define KEY_MONEY "dpl_profile_money"
#define KEY_CLASS "dpl_profile_class"
#define KEY_IS_RENEGADE "dpl_profile_renegade"
#define KEY_PRISON_START "dpl_profile_prison_start"
#define KEY_PRISON_FREE_POSITION "dpl_profile_prison_position"
#define KEY_POSITION "dpl_profile_position"
#define KEY_LOADOUT "dpl_profile_loadout"

#define EMPTY_HASH [] call CBA_fnc_hashCreate
#define EMPTY_LOADOUT [[],[],[],[],[],[],"","",[],["","","","","",""]]

#define CLASS_LEADER "dpl_class_leader"
#define CLASS_MEDIC "dpl_class_medic"
#define CLASS_ENGINEER "dpl_class_engineer"
#define CLASS_DMR "dpl_class_marksman"
#define CLASS_MG "dpl_class_mg"
#define CLASS_NONE "dpl_class_none"

#include "macros.hpp"
