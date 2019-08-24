/*
 * Author: xetra11
 *
 * Configuration for perks. This is the fallback and default perk list used by official CoopR. Feel free to
 * create your own configuration file in the mission folder.
 *
 */

class CfgPerks {
    class CoopR_BasePerk {
        icon = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
        onAdvantage = "";
        onDisadvantage = "";
    };
    class Sprinter : CoopR_BasePerk {
        name = "Sprinter";
        icon = "\x\coopr\addons\rpg\data\images\perk-sixth-256";
        iconSelected = "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256";
        description = "Sprinters are slick and fast but have less muscles. Therefore they can't carry a lot";
        advantage = "High stamina and therefore slower exhaustion";
        disadvantage = "Maximum carry weight reduced";
        onAdvantage = "";
        onDisadvantage = "";
    };
    class Focused : CoopR_BasePerk {
        name = "Focused";
        icon = "\x\coopr\addons\rpg\data\images\perk-sixth-256";
        iconSelected = "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256";
        description = "Has the ability to focus completly on the target";
        advantage = "Less weapon sway when aiming, longer breath-holding, wounds do not affect sway when aiming";
        disadvantage = "Sound environment is almost muted when aiming";
        onAdvantage = "";
        onDisadvantage = "";
    };
  //class Armwrestler : CoopR_BasePerk {
  //    name = "Armswrestler";
  //    icon = "\x\coopr\addons\rpg\data\images\perk-sixth-256";
  //    iconSelected = "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256";
  //    description = "Can pick up heavy things faster and stay steadfast when using heavy weapons";
  //    advantage = "Less recoil with heavy weapons, faster pickup of heavy items and persons";
  //    disadvantage = "Less precise on long ranges";
  //    onAdvantage = "";
  //    onDisadvantage = "";
  //};
  //class Cautious : CoopR_BasePerk {
  //    name = "Cautious";
  //    icon = "\x\coopr\addons\rpg\data\images\perk-sixth-256";
  //    iconSelected = "\x\coopr\addons\rpg\data\images\perk-sixth-selected-256";
  //    description = "A quiet and cautious mover. Perfect to blend into the environment";
  //    advantage = "Hard to see and hear by enemies, can go invisible in PvP at long range";
  //    disadvantage = "Less precise on long distances";
  //    onAdvantage = "";
  //    onDisadvantage = "";
  //};
};
