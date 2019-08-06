/**
    CoopR GUI config credits go to Heyoxe (https://steamcommunity.com/id/Heyoxe/)
**/

#include "controls.hpp"

#define EBA_TOCOLOR(r,g,b,a) {r / 255, g / 255, b / 255, a}
#define EBA_COLOR_BACKGROUND {0, 0, 0, 0.5}
#define EBA_COLOR_TRANSPARENT {0, 0, 0, 0}
#define EBA_COLOR_MAIN EBA_TOCOLOR(28,153,199,1)
#define EBA_COLOR_MAIN_HOVER EBA_TOCOLOR(28,153,199,0.5)
#define EBA_COLOR_WHITE {1, 1, 1, 1}
#define EBA_COLOR_BLACK {0, 0, 0, 1}
#define EBA_COLOR_DISABLED {0.5, 0.5, 0.5, 1}

#define EBA_POSITION(X,Y,W,H) \
    x = (X * safeZoneW) / 1920 + safeZoneX; \
    y = (Y * safeZoneH) / 1080 + safeZoneY; \
    w = (W * safeZoneW) / 1920; \
    h = (H * safeZoneH) / 1080;

#define EBA_POSITION_CT(X,Y,W,H) \
    x = (X * safeZoneW) / 1920; \
    y = (Y * safeZoneH) / 1080; \
    w = (W * safeZoneW) / 1920; \
    h = (H * safeZoneH) / 1080;

#define EBA_FULLSCREEN \
    x = safeZoneX; \
    y = safeZoneY; \
    w = safeZoneW; \
    h = safeZoneH;

class ScrollBar;

class EBA_CommonProperites {
    idc = -1;
    moving = false;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    font = "RobotoCondensed";
    colorText[] = EBA_COLOR_WHITE;
    colorBorder[] = EBA_COLOR_TRANSPARENT;
    colorShadow[] = EBA_COLOR_TRANSPARENT;
    text = "";
    shadow = 0;
    tooltip = "";
    tooltipColorShade[] = EBA_COLOR_BACKGROUND;
    tooltipColorText[] = EBA_COLOR_WHITE;
    tooltipColorBox[] = EBA_COLOR_MAIN;
};

class NoScrollBar: ScrollBar {
    wdith = 0;
    height = 0;
};

//Button
class EBA_Button: EBA_CommonProperites {
    type = 1;
    style = 0;
    borderSize = 0;
    colorText[] = EBA_COLOR_WHITE;
    colorBackground[] = EBA_COLOR_MAIN;
    colorBackgroundActive[] = EBA_COLOR_MAIN_HOVER;
    colorBackgroundDisabled[] = EBA_COLOR_DISABLED;
    clorDisabled[] = EBA_COLOR_WHITE;
    colorFocused[] = EBA_COLOR_MAIN_HOVER;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
};

class EBA_Button_Center: EBA_Button {
    style = 2;
};

//Misc
class EBA_Background: EBA_CommonProperites {
    type = 0;
    style = 128;
    colorBackground[] = EBA_COLOR_BACKGROUND;
};

class EBA_Title: EBA_CommonProperites {
    type = 0;
    style = 0;
    colorBackground[] = EBA_COLOR_MAIN;
};

class EBA_Title_Center: EBA_Title {
    style = 2;
};

class EBA_ButtonPicture: EBA_Button {
    style = 48;
    text = "#(argb,8,8,3)color(0,0,1,1)";
};

class EBA_StructuredText: EBA_CommonProperites {
    type = 13;
    style = 0;
    size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    colorBackground[] = EBA_COLOR_TRANSPARENT;
};

class EBA_Picture: EBA_CommonProperites {
    type = 0;
    style = 48;
    text = "#(argb,8,8,3)color(1,0,1,1)";
};

class EBA_PictureRatio: EBA_Picture {
    style = 48 + 2048;
};

class EBA_Text: EBA_CommonProperites {
    type = 0;
    style = 0;
    colorBackground[] = EBA_COLOR_TRANSPARENT;
};

class EBA_Text_Background: EBA_Text {
    colorBackground[] = EBA_COLOR_BACKGROUND;
};

class EBA_Input: EBA_CommonProperites {
    type = 2;
    style = 0;
    autocomplete = "";
    colorBackground[] = EBA_COLOR_BLACK;
    colorSelection[] = EBA_COLOR_MAIN;
    colorDisabled[] = EBA_COLOR_DISABLED;
    colorBorder[] = EBA_COLOR_MAIN;
};

class EBA_ControlsGroup: EBA_CommonProperites {
    type = 15;
    style = 16;

    class VScrollbar: NoScrollBar {};
    class HScrollbar: NoScrollBar {};
    class ScrollBar: NoScrollBar {};
    class Controls {};
};

class EBA_ControlsTable: EBA_CommonProperites {
    type = 19;
    style = 16;

    lineSpacing = 0;
    rowHeight = 0.033 * safezoneH;
    headerHeight = 0 * safezoneH;

    firstIDC = 26000;
    lastIDC = 27000;

    selectedRowColorFrom[] = {1, 1, 1, 0};
    selectedRowColorTo[] = {1, 1, 1, 0};
    selectedRowAnimLength = 0;

    class VScrollBar: NoScrollBar {};
    class HScrollBar: NoScrollBar {};

    class RowTemplate {
        class CharacterRole {
            controlBaseClassPath[] = {"EBA_PictureRatio"};
            columnX = (10 * safeZoneW) / 1920;
            columnW = (30 * safeZoneW) / 1920;
            controlOffsetY = 0;
        };
        class CharacterName {
            controlBaseClassPath[] = {"EBA_Text"};
            columnX = (54 * safeZoneW) / 1920;
            columnW = (86 * safeZoneW) / 1920;
            controlOffsetY = (7 * safeZoneH) / 1080;
        };
        class WeaponMainPicture {
            controlBaseClassPath[] = {"EBA_PictureRatio"};
            columnX = (174 * safeZoneW) / 1920;
            columnW = (86 * safeZoneW) / 1920;
            controlOffsetY = 0;
        };
        class WeaponSecondaryPicture {
            controlBaseClassPath[] = {"EBA_PictureRatio"};
            columnX = (260 * safeZoneW) / 1920;
            columnW = (86 * safeZoneW) / 1920;
            controlOffsetY = 0;
        };
        class CreateNewButton {
            controlBaseClassPath[] = {"EBA_Button"};
            columnX = (91 * safeZoneW) / 1920;
            columnW = (172 * safeZoneW) / 1920;
            controlOffsetY = (7 * safeZoneH) / 1080;
        };
        class Select {
            controlBaseClassPath[] = {"RscButton"};
            columnX = 0;
            columnW = 1;
            controlOffsetY = (7 * safeZoneH) / 1080;
        };
    };

    class HeaderTemplate {};
};

class CoopR_GUI {
    idd = 19000;
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
