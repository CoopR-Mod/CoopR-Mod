/*
 * Author: xetra11
 *
 * Configuration file for Character Roles. These are the default CoopR roles.
 *
 */

class CfgCharacterRoles {

    class Groupleader {
        id = "coopr_role_leader";
        name = "Groupleader";
        icon = "\x\coopr\addons\lobby\data\images\group-leader-256-white.paa";
        description = "The groupleader is the leading leader of the group he has to lead";
        loadout = "[['arifle_MX_GL_Hamr_pointer_F','','acc_pointer_IR','optic_Hamr',['30Rnd_65x39_caseless_mag',30],['1Rnd_HE_Grenade_shell',1],''],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',17],[],''],['U_B_CombatUniform_mcam_vest',[['FirstAidKit',1],['30Rnd_65x39_caseless_mag',2,30]]],['V_PlateCarrierGL_rgr',[['30Rnd_65x39_caseless_mag',1,30],['30Rnd_65x39_caseless_mag_Tracer',2,30],['16Rnd_9x21_Mag',2,17],['MiniGrenade',2,1],['1Rnd_HE_Grenade_shell',5,1],['SmokeShell',1,1],['SmokeShellGreen',1,1],['SmokeShellBlue',1,1],['SmokeShellOrange',1,1],['Chemlight_green',2,1],['1Rnd_Smoke_Grenade_shell',2,1],['1Rnd_SmokeBlue_Grenade_shell',1,1],['1Rnd_SmokeGreen_Grenade_shell',1,1],['1Rnd_SmokeOrange_Grenade_shell',1,1]]],[],'H_HelmetSpecB','',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles']]";
        lobbyAnimations[] = {
            "Acts_SignalToCheck",
            "Acts_listeningToRadio_in",
            "Acts_listeningToRadio_Loop"
        };
        authorized[] = {
            "mission",
            "supply",
            "recon",
            "aar"
        };

        class Skills {
            class Overseer {
                name = "Overseer";
                icon = "\x\coopr\addons\lobby\data\images\perk-sixth.paa";
                description = "Grants the character the ability to 'feel' where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
    class Medic {
        id = "coopr_role_medic";
        name = "Medic";
        icon = "\x\coopr\addons\lobby\data\images\medic-256-white.paa";
        description = "The medic fixes peoples";
        loadout = "[['arifle_MX_pointer_F','','acc_pointer_IR','',['30Rnd_65x39_caseless_mag',30],[],''],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',17],[],''],['U_B_CombatUniform_mcam_tshirt',[['FirstAidKit',1],['30Rnd_65x39_caseless_mag',2,30]]],['V_PlateCarrierSpec_rgr',[['30Rnd_65x39_caseless_mag',3,30],['16Rnd_9x21_Mag',2,17],['SmokeShell',1,1],['SmokeShellGreen',1,1],['SmokeShellBlue',1,1],['SmokeShellOrange',1,1],['Chemlight_green',2,1]]],['B_AssaultPack_rgr_Medic',[['Medikit',1],['FirstAidKit',10]]],'H_HelmetB_light_desert','G_Tactical_Black',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles']]";
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
                icon = "\x\coopr\addons\lobby\data\images\perk-sixth.paa";
                description = "Grants the character the ability to 'feel' where his squadmembers are located. Range will increase by skill level";
                levelRequirement[] = {1,3,5,7,10};
                //onTrigger = "call coopr_fnc_skillLogic.sqf";
            };
        };
    };
};
