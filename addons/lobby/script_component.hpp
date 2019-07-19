#include "\x\coopr\addons\core\script_mod.hpp"

#define COMPONENT lobby

#define DEBUG_CTX "COOPR.LOBBY"

#define COOPR_CHARACTER_ROLES [[(localize "str.coopr.character.role.leader"), "coopr_role_leader"], [(localize "str.coopr.character.role.medic"), "coopr_role_medic"], [(localize "str.coopr.character.role.engineer"), "coopr_role_engineer"], [(localize "str.coopr.character.role.marksman"), "coopr_role_marksman"], [(localize "str.coopr.character.role.mg"), "coopr_role_mg"]]
#define COOPR_ROLE_NAMES [["coopr_role_leader", (localize "str.coopr.character.role.leader")], ["coopr_role_medic", (localize "str.coopr.character.role.medic")], ["coopr_role_engineer", (localize "str.coopr.character.role.engineer")], ["coopr_role_marksman", (localize "str.coopr.character.role.marksman")], ["coopr_role_mg", (localize "str.coopr.character.role.mg")]]

#include "\x\coopr\addons\core\script_macros.hpp"
