#define COOPR_ROW_OFFSET 13
#define ICON_OFFSET(multi) (75 * multi)
#define ROW_OFFSET(multi) (96 * multi)
#define SKILL_ROW 2
#define PERK_ROW_1 3
#define PERK_ROW_2 4

class CoopR_Login_Dialog {
  idd = GUI_ID_LOGIN_DIALOG;
    class Controls {
        class Title: COOPR_Title_Center {
            COOPR_POSITION(0,0,554,80)
            text = "Character Selection"; //ToDo: Localize
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.5);
        };
        class Help: COOPR_Button {
            COOPR_POSITION(0,1048,128,32)
            text = "Help";  //ToDo: Localize
        };
        class StopReload: COOPR_Button {
            COOPR_POSITION(140,1048,140,32)
            text = "Disable GUI Reload";  //ToDo: Localize
            onMouseButtonDown = "(findDisplay 1000) displayRemoveAllEventHandlers 'Unload'; [] spawn {sleep 5; call coopr_fnc_showLoginDialog;}"
        };

        class Corner: COOPR_Picture {
            COOPR_POSITION(553,0,80,80)
           text = "\x\coopr\addons\lobby\data\images\corner.paa";
        };

        class CharacterDetails: COOPR_ControlsGroup {
            idc = GUI_ID_LOGIN_CHARACTER_DETAILS;
            COOPR_POSITION(1171,187,375,550)
            onLoad = COOPR_DISABLE_CONTROL;
            class Controls {
                class Title: COOPR_Title {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_TITLE;
                    COOPR_POSITION_CT(0,0,340,35)
                };
                class Delete: COOPR_ButtonPicture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_DELETE_BUTTON;
                    COOPR_POSITION_CT(340,0,35,35)
                    colorBackground[] = COOPR_TOCOLOR(197,58,58,1);
                    colorBackgroundActive[] = COOPR_TOCOLOR(197,58,58,0.5);
                    colorFocused[] = COOPR_TOCOLOR(197,58,58,0.5);
                    text = "\a3\ui_f\data\igui\cfg\revive\overlayicons\d100_ca.paa"; //ToDo: Change to the correct picture
                };
                class Background: COOPR_Background {
                    COOPR_POSITION_CT(0,35,375,436)
                };
                class Play: COOPR_Button_Center {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PLAY_BUTTON;
                    COOPR_POSITION_CT(0,471,375,72)
                    text = "Play"; //ToDo: Localize
                    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
                };
                class Description: COOPR_StructuredText {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_TEXT;
                    COOPR_POSITION_CT(8,44,360,190)
                };
                class Role: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_ROLE;
                    COOPR_POSITION_CT(200,45,130,130)
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Skill_0: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_SKILL_0;
                    COOPR_POSITION_CT(ICON_OFFSET(0),ROW_OFFSET(SKILL_ROW),80,80)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Skill_1: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_SKILL_1;
                    COOPR_POSITION_CT(ICON_OFFSET(1),ROW_OFFSET(SKILL_ROW),80,80)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Skill_2: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_SKILL_2;
                    COOPR_POSITION_CT(ICON_OFFSET(2),ROW_OFFSET(SKILL_ROW),80,80)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Skill_3: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_SKILL_3;
                    COOPR_POSITION_CT(ICON_OFFSET(3),ROW_OFFSET(SKILL_ROW),80,80)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Skill_4: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_SKILL_4;
                    COOPR_POSITION_CT(ICON_OFFSET(4),ROW_OFFSET(SKILL_ROW),80,80)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_0: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_0;
                    COOPR_POSITION_CT(ICON_OFFSET(0),ROW_OFFSET(PERK_ROW_1),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_1: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_1;
                    COOPR_POSITION_CT(ICON_OFFSET(1),ROW_OFFSET(PERK_ROW_1),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_2: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_2;
                    COOPR_POSITION_CT(ICON_OFFSET(2),ROW_OFFSET(PERK_ROW_1),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_3: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_3;
                    COOPR_POSITION_CT(ICON_OFFSET(3),ROW_OFFSET(PERK_ROW_1),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_4: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_4;
                    COOPR_POSITION_CT(ICON_OFFSET(4),ROW_OFFSET(PERK_ROW_1),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_5: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_5;
                    COOPR_POSITION_CT(ICON_OFFSET(0.5),ROW_OFFSET(PERK_ROW_2),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_6: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_6;
                    COOPR_POSITION_CT(ICON_OFFSET(1.5),ROW_OFFSET(PERK_ROW_2),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_7: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_7;
                    COOPR_POSITION_CT(ICON_OFFSET(2.5),ROW_OFFSET(PERK_ROW_2),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
                class Perk_8: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_DETAILS_PERK_8;
                    COOPR_POSITION_CT(ICON_OFFSET(3.5),ROW_OFFSET(PERK_ROW_2),75,75)
                    onLoad = COOPR_DISABLE_CONTROL;
                    text = "\x\coopr\addons\rpg\data\images\roles\no-role-256-white.paa";
                };
            };
        };

        class PerkButton : COOPR_ButtonPictureNoBG {
            soundClick[] = {"\x\coopr\addons\lobby\data\sounds\card_flip.ogg", 0.09, 1};
            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
        };

        class Perks: COOPR_ControlsGroup {
            idc = GUI_ID_LOGIN_CHARACTER_PERKS;
            COOPR_POSITION(381,187,375,550)
            onLoad = COOPR_DISABLE_CONTROL;
            class Controls {
                class Background: COOPR_Background {
                    COOPR_POSITION_CT(0,35,375,436)
                };
                class Title: COOPR_Title {
                    idc = GUI_ID_LOGIN_CHARACTER_PERKS_TITLE;
                    COOPR_POSITION_CT(0,0,375,35)
                    text = "Perks";
                };
                class Perks_Description: COOPR_StructuredText {
                    idc = GUI_ID_LOGIN_CHARACTER_PERKS_TEXT;
                    COOPR_POSITION_CT(8,44,346, 65)
                    text = "No Text";
                };
                class Perks_Row_1: COOPR_ControlsGroup {
                    COOPR_POSITION_CT(25,110,375,100)
                    class Controls {
                        class Perk_1: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_0;
                            COOPR_POSITION_CT(0,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                        };
                        class Perk_2: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_1;
                            COOPR_POSITION_CT(110,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                        class Perk_3: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_2;
                            COOPR_POSITION_CT(220,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                    };
                };
                class Perks_Row_2: COOPR_ControlsGroup {
                    COOPR_POSITION_CT(25,220,375,100)
                    class Controls {
                        class Perk_4: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_3;
                            COOPR_POSITION_CT(0,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                        class Perk_5: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_4;
                            COOPR_POSITION_CT(110,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                        class Perk_6: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_5;
                            COOPR_POSITION_CT(220,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                    };
                };
                class Perks_Row_3: COOPR_ControlsGroup {
                    COOPR_POSITION_CT(25,330,375,100)
                    class Controls {
                        class Perk_7: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_6;
                            COOPR_POSITION_CT(0,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                        class Perk_8: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_7;
                            COOPR_POSITION_CT(110,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                        class Perk_9: PerkButton {
                            idc = GUI_ID_LOGIN_CHARACTER_PERK_8;
                            COOPR_POSITION_CT(220,0,100,100)
                            onLoad = COOPR_DISABLE_CONTROL;
                            text = "\x\coopr\addons\rpg\data\images\skills\perk-sixth-256.paa";
                        };
                    };
                };
            };
        };

        class Infobox: COOPR_ControlsGroup {
            COOPR_POSITION(776,187,354,234)
            idc = GUI_ID_LOGIN_CHARACTER_INFOBOX;
            onLoad = COOPR_DISABLE_CONTROL;
            class Controls {
                class Infobox_Background: COOPR_Background {
                    COOPR_POSITION_CT(0,35,354, 300)
                };
                class Infobox_Title: COOPR_Title {
                    idc = GUI_ID_LOGIN_CHARACTER_INFOBOX_TITLE;
                    COOPR_POSITION_CT(0,0,354,35)
                    text = "Description"; //ToDo: Localize
                };
                class Infobox_Description: COOPR_StructuredText {
                    idc = GUI_ID_LOGIN_CHARACTER_INFOBOX_TEXT;
                    COOPR_POSITION_CT(8,44,346, 252)
                    text = "No Description";
                };
            };
        };

        class CharacterSelection: COOPR_ControlsGroup {
            COOPR_POSITION(1566,187,354,234)
            class Controls {
                class CharacterSelection_Title: COOPR_Title {
                    COOPR_POSITION_CT(0,0,354,35)
                    text = "My Character"; //ToDo: Localize
                };
                class CharacterSelection_Background: COOPR_Background {
                    COOPR_POSITION_CT(0,35,354,199)
                };
                class CharacterSelection_List: COOPR_ControlsTable {
                    idc = GUI_ID_LOGIN_CHARACTER_LIST;
                    COOPR_POSITION_CT(0,35,354,199)

                    class RowTemplate {
                        class CharacterRole {
                            controlBaseClassPath[] = {"RscPictureKeepAspect"};
                            columnX = (10 * safeZoneW) / 1920;
                            columnW = (60 * safeZoneW) / 1920;
                            controlOffsetY = 0;
                        };
                        class CharacterName {
                            controlBaseClassPath[] = {"RscText"};
                            columnX = (75 * safeZoneW) / 1920;
                            columnW = (100 * safeZoneW) / 1920;
                            controlOffsetY = ((7 + COOPR_ROW_OFFSET) * safeZoneH) / 1080;
                        };
                        class Level {
                            controlBaseClassPath[] = {"RscText"};
                            columnX = (180 * safeZoneW) / 1920;
                            columnW = (160 * safeZoneW) / 1920;
                            controlOffsetY = ((7 + COOPR_ROW_OFFSET) * safeZoneH) / 1080;
                        };
                        class State {
                            controlBaseClassPath[] = {"RscText"};
                            columnX = (250 * safeZoneW) / 1920;
                            columnW = (85 * safeZoneW) / 1920;
                            controlOffsetY = ((7 + COOPR_ROW_OFFSET) * safeZoneH) / 1080;
                        };
                        class CreateNewButton {
                            controlBaseClassPath[] = {"COOPR_Row_Button"};
                            text = "Create New Character"; //ToDo: Localize
                            columnX = (91 * safeZoneW) / 1920;
                            columnW = (172 * safeZoneW) / 1920;
                            controlOffsetY = ((7 + COOPR_ROW_OFFSET) * safeZoneH) / 1080;
                        };
                        class Select {
                            controlBaseClassPath[] = {"COOPR_Row_SelectButton"};
                            columnX = (75 * safeZoneW) / 1920;
                            columnW = 1;
                            controlOffsetY = ((7 + COOPR_ROW_OFFSET) * safeZoneH) / 1080;
                        };
                    };
                };
            };
        };

        class CharacterCreation: COOPR_ControlsGroup {
            idc = GUI_ID_LOGIN_CHARACTER_CREATION;
            COOPR_POSITION(1171,187,375,550)
            onLoad = COOPR_DISABLE_CONTROL;
            class Controls {
                class Title: COOPR_Title {
                    COOPR_POSITION_CT(0,0,340,35)
                    text = "New Character"; //ToDo: Localize
                };
                class Background: COOPR_Background {
                    COOPR_POSITION_CT(0,35,375,436)
                };
                class Create: COOPR_Button_Center {
                    idc = GUI_ID_LOGIN_CHARACTER_CREATION_CREATE;
                    COOPR_POSITION_CT(0,471,375,72)
                    text = "Create"; //ToDo: Localize
                    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
                };
                class NameLabel: COOPR_Text_Background {
                    COOPR_POSITION_CT(22,61,147,19)
                    text = "Name of Character"; //ToDo: Localize
                };
                class Error: COOPR_Error {
                    idc = GUI_ID_LOGIN_CHARACTER_CREATION_ERROR;
                    COOPR_POSITION_CT(22,112,311,21)
                };
                class NameInput: RscEdit {
                    idc = GUI_ID_LOGIN_CHARACTER_CREATION_NAME_INPUT;
                    COOPR_POSITION_CT(22,80,311,30)
                };
                class RoleLabel: COOPR_Text_Background {
                    COOPR_POSITION_CT(22,138,147,19)
                    text = "Specialization"; //ToDo: Localize
                };
                class RolePicture: COOPR_Picture {
                    idc = GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_PICTURE;
                    text = "\x\coopr\addons\rpg\data\images\perks\sprinter-256.paa"; //ToDo: Change to the correct picture
                    COOPR_POSITION_CT(22,175,311,311)
                };
                class RoleInput: RscCombo {
                    idc = GUI_ID_LOGIN_CHARACTER_CREATION_ROLE_COMBO;
                    COOPR_POSITION_CT(22,157,311,30)
                };
            };
        };
    };
};








/* #Fusori
$[
    1.063,
    ["coopr_login",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
    [1200,"coopr_rscPicture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.448438 * safezoneW + safezoneX","0.312916 * safezoneH + safezoneY","0.113437 * safezoneW","0.330147 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1600,"coopr_rscButton_Login",[1,"Login",["0.474219 * safezoneW + safezoneX","0.356936 * safezoneH + safezoneY","0.061875 * safezoneW","0.0440197 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1601,"coopr_rscButton_Register",[1,"Register",["0.474219 * safezoneW + safezoneX","0.422966 * safezoneH + safezoneY","0.061875 * safezoneW","0.0440197 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1602,"coopr_rscButton_Close",[1,"Close",["0.484531 * safezoneW + safezoneX","0.555025 * safezoneH + safezoneY","0.04125 * safezoneW","0.0440197 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

