class CoopR_Login_Dialog_New {
  idd = GUI_ID_LOGIN_DIALOG_NEW;
    class Controls {
        class Title: EBA_Title_Center {
            EBA_POSITION(0,0,554,80)
            text = "Character Selection"; //ToDo: Localize
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.5);
        };
        class Help: EBA_Button {
            EBA_POSITION(0,1048,128,32)
            text = "Help";  //ToDo: Localize
        };
        class CharacterDescription: EBA_ControlsGroup {
            EBA_POSITION(1171,187,375,534)
            onLoad = "(_this#0) ctrlEnable false; (_this#0) ctrlShow false";
            class Controls {
                class Title: EBA_Title {
                    //idc = 22305;
                    EBA_POSITION_CT(0,0,340,35)
                };
                class Delete: EBA_ButtonPicture {
                    EBA_POSITION_CT(340,0,35,35)
                    colorBackground[] = EBA_TOCOLOR(197,58,58,1);
                    colorBackgroundActive[] = EBA_TOCOLOR(197,58,58,0.5);
                    colorFocused[] = EBA_TOCOLOR(197,58,58,0.5);
                    text = "\a3\ui_f\data\igui\cfg\revive\overlayicons\d100_ca.paa"; //ToDo: Change to the correct picture
                };
                class Background: EBA_Background {
                    EBA_POSITION_CT(0,35,375,436)
                };
                class Play: EBA_Button_Center {
                    EBA_POSITION_CT(0,471,375,72)
                    text = "Play"; //ToDo: Localize
                    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
                };
                class Description: EBA_StructuredText {
                    //idc = 22300;
                    EBA_POSITION_CT(8,44,360,190)
                };
                class Role: EBA_Input {
                    //idc = 22301;
                    EBA_POSITION_CT(24,241,100,100)
                };
                class Perks: EBA_Picture {
                    //idc = 22302;
                    EBA_POSITION_CT(138,241,100,100)
                };
                class Traits: EBA_Picture {
                    //idc = 22303;
                    EBA_POSITION_CT(252,241,100,100)
                };
                class Main: EBA_Picture {
                    //idc = 22304;
                    EBA_POSITION_CT(63,347,250,110)
                };
            };
        };

        class CharacterSelection: EBA_ControlsGroup {
            EBA_POSITION(1566,187,354,234)
            class Controls {
                class CharacterSelection_Title: EBA_Title {
                    EBA_POSITION_CT(0,0,354,35)
                    text = "My Character"; //ToDo: Localize
                };
                class CharacterSelection_Background: EBA_Background {
                    EBA_POSITION_CT(0,35,354,199)
                };
                class CharacterSelection_List: EBA_ControlsTable {
                    EBA_POSITION_CT(0,35,354,199)
                };
            };
        };

        class CharacterCreation: EBA_ControlsGroup {
            EBA_POSITION(1171,187,375,534)
            onLoad = "(_this#0) ctrlEnable false; (_this#0) ctrlShow false";
            class Controls {
                class Title: EBA_Title {
                    EBA_POSITION_CT(0,0,340,35)
                    text = "New Character"; //ToDo: Localize
                };
                class Back: EBA_ButtonPicture {
                    EBA_POSITION_CT(340,0,35,35)
                    colorBackground[] = EBA_TOCOLOR(20,104,135,1);
                    colorBackgroundActive[] = EBA_TOCOLOR(20,104,135,0.5);
                    colorFocused[] = EBA_TOCOLOR(20,104,135,0.5);
                    text = "\a3\ui_f\data\igui\cfg\revive\overlayicons\d100_ca.paa"; //ToDo: Change to the correct picture
                };
                class Background: EBA_Background {
                    EBA_POSITION_CT(0,35,375,436)
                };
                class Create: EBA_Button_Center {
                    EBA_POSITION_CT(0,471,375,72)
                    text = "Create"; //ToDo: Localize
                    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
                };
                class NameText: EBA_Text_Background {
                    EBA_POSITION_CT(22,61,147,19)
                    text = "Name of the solider"; //ToDo: Localize
                };
                class NameInput: RscEdit {
                    EBA_POSITION_CT(22,80,311,30)
                };
                class RoleText: EBA_Text_Background {
                    EBA_POSITION_CT(22,138,147,19)
                    text = "Specialization"; //ToDo: Localize
                };
                class RoleInput: RscCombo {
                    EBA_POSITION_CT(22,157,311,30)
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

