#define DEBUG_CTX "DPL.BASE"

#define SERVER 2
#define MAX_PROFILES 3

#define KEY_PLAYER_PROFILES "dpl_player_profiles"
#define KEY_PLAYER_LOGGEDIN "dpl_login_state"
#define KEY_INTEL_PROGRESS "dpl_intel_progess"

#define KEY_SLOT "dpl_character_slot"
#define KEY_NAME "dpl_character_name"
#define KEY_UID "dpl_character_uid"
#define KEY_REPUTATION "dpl_character_reputation"
#define KEY_MONEY "dpl_character_money"
#define KEY_CLASS "dpl_character_class"
#define KEY_IS_PRISONER "dpl_character_renegade"
#define KEY_PRISON_START "dpl_character_prison_start"
#define KEY_POSITION "dpl_character_position"
#define KEY_LOADOUT "dpl_character_loadout"

#define EMPTY_HASH [] call CBA_fnc_hashCreate
#define EMPTY_LOADOUT [[],[],[],[],[],[],"","",[],["","","","","",""]]

#define CLASS_LEADER "dpl_class_leader"
#define CLASS_MEDIC "dpl_class_medic"
#define CLASS_ENGINEER "dpl_class_engineer"
#define CLASS_DMR "dpl_class_marksman"
#define CLASS_MG "dpl_class_mg"
#define CLASS_NONE "dpl_class_none"

#include "macros.hpp"
