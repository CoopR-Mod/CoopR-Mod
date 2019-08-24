#include "\x\coopr\addons\core\script_mod.hpp"

#define COMPONENT lobby
#define DEBUG_CTX "COOPR.LOBBY"

#define PERK(var) (GUI_ID_LOGIN_CHARACTER_PERK_0 + var)
#define MAX_PERKS missionNamespace getVariable ["coopr_rpg_max_perks", 0]

#include "\x\coopr\addons\core\script_macros.hpp"
