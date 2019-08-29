/*
 * Author: xetra11
 *
 * Configuration file for character skills. These are the default CoopR skills.
 *
 */

class CfgSkills {
    class CoopR_BaseSkill {
        icon = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
        lobbyAnimations[] = {
            "AidlPercMstpSrasWrflDnon_G04"
        };
        onTrigger = "";
    };

    class Skills : CoopR_BaseSkill {
        class SixthSense {
            name = "Sixth Sense";
            icon = "\x\coopr\addons\rpg\data\images\skills\perk-sixth.paa";
            description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
            levelRequirement[] = {1,3,5,7,10};
            allowedRoles = {"Medic", "Engineer", "Squadleader"};
            //onTrigger = "call coopr_fnc_skillLogic.sqf";
        };
    };
};
