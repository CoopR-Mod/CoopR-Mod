/*
 * Author: xetra11
 *
 * Configuration file for Character Roles. These are the default CoopR roles.
 *
 */

class CfgCharacterRoles {
    class CoopR_BaseRole {
        icon = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
        lobbyAnimations[] = {
            "AidlPercMstpSrasWrflDnon_G04"
        };
        onTrigger = "";
    };

    class Squadleader : CoopR_BaseRole {
        name = "Squad Leader";
        icon = "\x\coopr\addons\rpg\data\images\roles\group-leader-256-white.paa";
        description = "A squad leader takes responsibilities in combat and mission preparation. He is authorized to request missions and supplies for those. He also is authorized to report recon observations. He is the only one who is allowed to do an After Action Report at the HQ";
        loadout = "[[""arifle_MX_GL_Hamr_pointer_F"","""",""acc_pointer_IR"",""optic_Hamr"",[""30Rnd_65x39_caseless_mag"",30],[""1Rnd_HE_Grenade_shell"",1],""""],[],[""hgun_P07_F"","""","""","""",[""16Rnd_9x21_Mag"",17],[],""""],[""U_B_CombatUniform_mcam_vest"",[[""FirstAidKit"",1],[""30Rnd_65x39_caseless_mag"",2,30]]],[""V_PlateCarrierGL_rgr"",[[""30Rnd_65x39_caseless_mag"",1,30],[""30Rnd_65x39_caseless_mag_Tracer"",2,30],[""16Rnd_9x21_Mag"",2,17],[""MiniGrenade"",2,1],[""1Rnd_HE_Grenade_shell"",5,1],[""SmokeShell"",1,1],[""SmokeShellGreen"",1,1],[""SmokeShellBlue"",1,1],[""SmokeShellOrange"",1,1],[""Chemlight_green"",2,1],[""1Rnd_Smoke_Grenade_shell"",2,1],[""1Rnd_SmokeBlue_Grenade_shell"",1,1],[""1Rnd_SmokeGreen_Grenade_shell"",1,1],[""1Rnd_SmokeOrange_Grenade_shell"",1,1]]],[],""H_HelmetSpecB"","""",[""Binocular"","""","""","""",[],[],""""],[""ItemMap"",""ItemGPS"",""ItemRadio"",""ItemCompass"",""ItemWatch"",""NVGoggles""]]";
        lobbyAnimations[] = {
            "Acts_SignalToCheck",
            "Acts_listeningToRadio_in",
            "Acts_listeningToRadio_Loop"
        };
        authorized[] = {
            "squad_mission",
            "squad_supply",
            "recon",
            "aar"
        };

        class Skills {
            class Overseer {
                name = "Overseer";
                icon = "\x\coopr\addons\rpg\data\images\perks\perk-sixth.paa";
                description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
    class Medic : CoopR_BaseRole {
        name = "Medic";
        icon = "\x\coopr\addons\rpg\data\images\roles\medic-256-white.paa";
        description = "Combat medics are responsible for providing first aid and frontline trauma care on the battlefield. They are also responsible for providing continuous medical care in the absence of a readily available physician, including care for disease and battle injuries. Combat medics are normally co-located with the combat troops they serve in order to easily move with the troops and monitor ongoing health";
        loadout = "[[""arifle_MX_pointer_F"","""",""acc_pointer_IR"","""",[""30Rnd_65x39_caseless_mag"",30],[],""""],[],[""hgun_P07_F"","""","""","""",[""16Rnd_9x21_Mag"",17],[],""""],[""U_B_CombatUniform_mcam_tshirt"",[[""FirstAidKit"",1],[""30Rnd_65x39_caseless_mag"",2,30]]],[""V_PlateCarrierSpec_rgr"",[[""30Rnd_65x39_caseless_mag"",3,30],[""16Rnd_9x21_Mag"",2,17],[""SmokeShell"",1,1],[""SmokeShellGreen"",1,1],[""SmokeShellBlue"",1,1],[""SmokeShellOrange"",1,1],[""Chemlight_green"",2,1]]],[""B_AssaultPack_rgr_Medic"",[[""Medikit"",1],[""FirstAidKit"",10]]],""H_HelmetB_light_desert"",""G_Tactical_Black"",[],[""ItemMap"","""",""ItemRadio"",""ItemCompass"",""ItemWatch"",""NVGoggles""]]";
        lobbyAnimations[] = {
            "Acts_TreatingWounded_in",
            "Acts_TreatingWounded05"
        };
        authorized[] = {
            "medic"
        };

        class Skills {
            class SixthSense {
                name = "Sixth Sense";
                icon = "\x\coopr\addons\rpg\data\images\perks\perk-sixth.paa";
                description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
    class Engineer : CoopR_BaseRole {
        name = "Engineer";
        icon = "\x\coopr\addons\rpg\data\images\roles\engineer-256-white.paa";
        description = "Combat engineers conduct demolition missions and clear minefields using specialized vehicles. Typical combat engineer missions include construction and breaching of trenches, tank traps and other fortifications";
        loadout = "[[""arifle_MX_ACO_pointer_F"","""",""acc_pointer_IR"",""optic_Aco"",[""30Rnd_65x39_caseless_mag"",30],[],""""],[""launch_NLAW_F"","""","""","""",[""NLAW_F"",1],[],""""],[""hgun_P07_F"","""","""","""",[""16Rnd_9x21_Mag"",17],[],""""],[""U_B_CombatUniform_mcam"",[[""FirstAidKit"",1],[""30Rnd_65x39_caseless_mag"",2,30]]],[""V_PlateCarrier2_rgr"",[[""30Rnd_65x39_caseless_mag"",3,30],[""16Rnd_9x21_Mag"",2,17],[""SmokeShell"",1,1],[""SmokeShellGreen"",1,1],[""Chemlight_green"",2,1]]],[""B_AssaultPack_rgr_LAT"",[]],""H_HelmetB_sand"","""",[],[""ItemMap"","""",""ItemRadio"",""ItemCompass"",""ItemWatch"",""NVGoggles""]]";
        lobbyAnimations[] = {
            "AmovPercMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon"
        };
        authorized[] = {
            "defuse",
            "repair",
            "at_launcher"
        };

        class Skills {
            class SixthSense {
                name = "Sixth Sense";
                icon = "\x\coopr\addons\rpg\data\images\perks\perk-sixth.paa";
                description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
    class LightMachinegunner : CoopR_BaseRole {
        name = "Light Machine Gunner";
        icon = "\x\coopr\addons\rpg\data\images\roles\mg-gunner-256-white.paa";
        description = "The light machine gunner is in many ways the dominant soldier in an infantry battle. One well-placed machine gun can suppress enemy activity in a crucial area, and any enemy foolish enough to walk into it with be torn to shreds with in a hail of bullets.";
        loadout = "[[""MMG_02_sand_RCO_LP_F"","""",""acc_pointer_IR"",""optic_Hamr"",[""130Rnd_338_Mag"",130],[],""bipod_01_F_snd""],[],[""hgun_P07_F"","""","""","""",[""16Rnd_9x21_Mag"",17],[],""""],[""U_B_CombatUniform_mcam"",[[""FirstAidKit"",1],[""16Rnd_9x21_Mag"",2,17],[""SmokeShell"",1,1],[""SmokeShellGreen"",1,1],[""Chemlight_green"",2,1]]],[""V_PlateCarrier1_rgr"",[[""130Rnd_338_Mag"",2,130]]],[],""H_HelmetB"","""",[],[""ItemMap"","""",""ItemRadio"",""ItemCompass"",""ItemWatch"",""NVGoggles""]]";
        lobbyAnimations[] = {
            "Acts_CrouchingFiringLeftRifle04"
        };
        authorized[] = {
            "defuse",
            "repair",
            "at_launcher"
        };

        class Skills {
            class SixthSense {
                name = "Sixth Sense";
                icon = "\x\coopr\addons\rpg\data\images\perks\perk-sixth.paa";
                description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
    class DesignatedMarksman : CoopR_BaseRole {
        name = "Designated Marksman";
        icon = "\x\coopr\addons\rpg\data\images\roles\designated-marksman-256-white.paa";
        description = "The DM is a military marksman role in an infantry squad. The DM""s role is to supply rapid accurate fire on enemy targets at ranges up to a maximum of 660 yards (600 m) with a rifle capable of semi-automatic fire called a designated marksman rifle equipped with a telescopic sight. Like snipers, DMs are trained in quick and precise shooting, but unlike the more specialized ""true"" sniper, they are an intrinsic part of an infantry fireteam and intended to lay down accurate rapid fire at valuable targets as needed, thus extending the reach of the fireteam.";
        loadout = "[[""srifle_DMR_03_tan_AMS_LP_F"","""",""acc_pointer_IR"",""optic_AMS_snd"",[""20Rnd_762x51_Mag"",20],[],""bipod_01_F_snd""],[],[""hgun_P07_F"","""","""","""",[""16Rnd_9x21_Mag"",17],[],""""],[""U_B_CombatUniform_mcam"",[[""FirstAidKit"",1],[""20Rnd_762x51_Mag"",2,20]]],[""V_PlateCarrier1_rgr"",[[""20Rnd_762x51_Mag"",5,20],[""16Rnd_9x21_Mag"",2,17],[""SmokeShell"",1,1],[""SmokeShellGreen"",1,1],[""Chemlight_green"",2,1],[""HandGrenade"",2,1]]],[],""H_HelmetB"","""",[""Binocular"","""","""","""",[],[],""""],[""ItemMap"","""",""ItemRadio"",""ItemCompass"",""ItemWatch"",""NVGoggles""]]";
        lobbyAnimations[] = {
            "AmovPsitMstpSrasWrflDnon_WeaponCheck1"
        };
        authorized[] = {
            "defuse",
            "repair",
            "at_launcher"
        };

        class Skills {
            class SixthSense {
                name = "Sixth Sense";
                icon = "\x\coopr\addons\rpg\data\images\perks\perk-sixth.paa";
                description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
    class Signaller : CoopR_BaseRole {
        name = "Signaller";
        icon = "\x\coopr\addons\rpg\data\images\roles\radioman-256-white.paa";
        description = "A signaller in the armed forces is a specialist soldier, seaman or airman responsible for military communications. Signallers, a.k.a. Combat Signallers or signalmen or women, are commonly employed as radio or telephone operators, relaying messages for field commanders at the front line (Army units, Ships or Aircraft), through a chain of command which includes field headquarters and ultimately governments and non government organisations. Messages are transmitted and received via a communications infrastructure comprising fixed and mobile installations.""true"" sniper, they are an intrinsic part of an infantry fireteam and intended to lay down accurate rapid fire at valuable targets as needed, thus extending the reach of the fireteam.";
        loadout = "[[""arifle_MX_Black_ACO_Pointer_F"","""",""acc_pointer_IR"",""optic_Aco"",[""30Rnd_65x39_caseless_black_mag"",30],[],""""],[],[""hgun_P07_khk_F"","""","""","""",[""16Rnd_9x21_Mag"",17],[],""""],[""U_B_CombatUniform_vest_mcam_wdl_f"",[[""FirstAidKit"",1],[""30Rnd_65x39_caseless_black_mag"",2,30]]],[""V_PlateCarrier1_wdl"",[[""30Rnd_65x39_caseless_black_mag"",3,30],[""16Rnd_9x21_Mag"",2,17],[""HandGrenade"",2,1],[""SmokeShell"",1,1],[""SmokeShellGreen"",1,1],[""Chemlight_green"",2,1]]],[""B_RadioBag_01_wdl_F"",[]],""H_HelmetB"",""G_Tactical_Clear"",[],[""ItemMap"","""",""ItemRadio"",""ItemCompass"",""ItemWatch"",""NVGoggles_INDEP""]]";
        authorized[] = {
            "defuse",
            "repair",
            "at_launcher"
        };

        class Skills {
            class SixthSense {
                name = "Sixth Sense";
                icon = "\x\coopr\addons\rpg\data\images\perks\perk-sixth.paa";
                description = "Grants the character the ability to ""feel"" where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
};
