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

    class SixthSense : CoopR_BaseSkill {
        name = "Sixth Sense";
        icon = "\x\coopr\addons\rpg\data\images\skills\perk-sixth.paa";
        description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
        unlockedBy[] = {
            // { <role>, { {<required role level>, <skill rank>}, {...} }}
            {"Medic", { {3, 1}, {7, 2}, {9, 3}, {11, 4} } }, // unlocks skill rank 1 at level 3, rank 2 at level 7, etc.
            {"Squadleader", { {5, 1}, {9, 2} } },
            {"Engineer", { {9, 1} } },
        };
        //onTrigger = "call coopr_fnc_skillLogic.sqf";
    };
};
