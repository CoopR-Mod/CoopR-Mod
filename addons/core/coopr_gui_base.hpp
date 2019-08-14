/**
    CoopR GUI config credits go to Heyoxe (https://steamcommunity.com/id/Heyoxe/)
    former prefix was EBA_
    was changed to COOPR_ to be uniform with mod
    allowed by original author "Heyoxe"
**/

#include "controls.hpp"

#define COOPR_COLOR_BACKGROUND {0, 0, 0, 0.5}
#define COOPR_COLOR_TRANSPARENT {0, 0, 0, 0}
#define COOPR_COLOR_WHITE {1, 1, 1, 1}
#define COOPR_COLOR_BLACK {0, 0, 0, 1}
#define COOPR_COLOR_ERROR {255, 0, 0, 1}
#define COOPR_COLOR_DISABLED {0.5, 0.5, 0.5, 1}
#define COOPR_TOCOLOR(r,g,b,a) {(r / 255), (g / 255), (b / 255), a}
#define COOPR_COLOR_MAIN COOPR_TOCOLOR(28,153,199,1)
#define COOPR_COLOR_MAIN_HOVER COOPR_TOCOLOR(28,153,199,0.5)
#define COOPR_DISABLE_CONTROL "(_this#0) ctrlEnable false; (_this#0) ctrlShow false"
#define COOPR_NO_ROLE_PICTURE "\x\coopr\addons\lobby\data\images\no-role-256-white.paa"


#define COOPR_POSITION(X,Y,W,H) \
    x = (X * safeZoneW) / 1920 + safeZoneX; \
    y = (Y * safeZoneH) / 1080 + safeZoneY; \
    w = (W * safeZoneW) / 1920; \
    h = (H * safeZoneH) / 1080;

#define COOPR_POSITION_CT(X,Y,W,H) \
    x = (X * safeZoneW) / 1920; \
    y = (Y * safeZoneH) / 1080; \
    w = (W * safeZoneW) / 1920; \
    h = (H * safeZoneH) / 1080;

#define COOPR_FULLSCREEN \
    x = safeZoneX; \
    y = safeZoneY; \
    w = safeZoneW; \
    h = safeZoneH;

class ScrollBar;

class COOPR_CommonProperites {
    idc = -1;
    moving = false;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    font = "RobotoCondensed";
    colorText[] = COOPR_COLOR_WHITE;
    colorBorder[] = COOPR_COLOR_TRANSPARENT;
    colorShadow[] = COOPR_COLOR_TRANSPARENT;
    text = "";
    shadow = 0;
    tooltip = "";
    tooltipColorShade[] = COOPR_COLOR_BACKGROUND;
    tooltipColorText[] = COOPR_COLOR_WHITE;
    tooltipColorBox[] = COOPR_COLOR_MAIN;
};

class NoScrollBar: ScrollBar {
    wdith = 0;
    height = 0;
};

//Button
class COOPR_Button: COOPR_CommonProperites {
    type = 1;
    style = 0;
    borderSize = 0;
    colorText[] = COOPR_COLOR_WHITE;
    colorBackground[] = COOPR_COLOR_MAIN;
    colorBackgroundActive[] = COOPR_COLOR_MAIN_HOVER;
    colorBackgroundDisabled[] = COOPR_COLOR_DISABLED;
    clorDisabled[] = COOPR_COLOR_WHITE;
    colorFocused[] = COOPR_COLOR_MAIN_HOVER;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;

	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
};

class COOPR_Button_Center: COOPR_Button {
    style = 2;
};

//Misc
class COOPR_Background: COOPR_CommonProperites {
    type = 0;
    style = 128;
    colorBackground[] = COOPR_COLOR_BACKGROUND;
};

class COOPR_Title: COOPR_CommonProperites {
    type = 0;
    style = 0;
    colorBackground[] = COOPR_COLOR_MAIN;
};

class COOPR_Title_Center: COOPR_Title {
    style = 2;
};

class COOPR_ButtonPicture: COOPR_Button {
    style = 48;
    text = "#(argb,8,8,3)color(0,0,1,1)";
};

class COOPR_StructuredText: COOPR_CommonProperites {
    type = 13;
    style = 0;
    size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    colorBackground[] = COOPR_COLOR_TRANSPARENT;
};

class COOPR_Picture: COOPR_CommonProperites {
    type = 0;
    style = 48;
    text = "#(argb,8,8,3)color(1,0,1,1)";
};

class COOPR_PictureRatio: COOPR_Picture {
    style = 48 + 2048;
};


class COOPR_Text: COOPR_CommonProperites {
    type = 0;
    style = 0;
    colorBackground[] = COOPR_COLOR_TRANSPARENT;
};

class COOPR_Error: COOPR_Text {
    colorText[] = COOPR_COLOR_ERROR;
};

class COOPR_Text_Background: COOPR_Text {
    colorBackground[] = COOPR_COLOR_BACKGROUND;
};

class COOPR_Input: COOPR_CommonProperites {
    type = 2;
    style = 0;
    autocomplete = "";
    colorBackground[] = COOPR_COLOR_BLACK;
    colorSelection[] = COOPR_COLOR_MAIN;
    colorDisabled[] = COOPR_COLOR_DISABLED;
    colorBorder[] = COOPR_COLOR_MAIN;
};

class COOPR_ControlsGroup: COOPR_CommonProperites {
    type = 15;
    style = 16;

    class VScrollbar: NoScrollBar {};
    class HScrollbar: NoScrollBar {};
    class ScrollBar: NoScrollBar {};
    class Controls {};
};

class COOPR_ControlsTable: COOPR_CommonProperites {
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
    class RowTemplate {};

    class HeaderTemplate {};
};

class COOPR_Row_Button: RscButton {
    colorText[] = COOPR_COLOR_WHITE;
    colorBackground[] = COOPR_COLOR_MAIN;
    colorBackgroundActive[] = COOPR_COLOR_MAIN_HOVER;
    colorBackgroundDisabled[] = COOPR_COLOR_DISABLED;
    clorDisabled[] = COOPR_COLOR_WHITE;
    colorFocused[] = COOPR_COLOR_MAIN_HOVER;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 0;
    borderSize = 0; 
};

class COOPR_Row_SelectButton: RscButton {
    colorText[] = COOPR_COLOR_TRANSPARENT;
    colorBackground[] = COOPR_COLOR_TRANSPARENT;
    colorBackgroundActive[] = COOPR_COLOR_TRANSPARENT;
    colorBackgroundDisabled[] = COOPR_COLOR_TRANSPARENT;
    clorDisabled[] = COOPR_COLOR_TRANSPARENT;
    colorFocused[] = COOPR_COLOR_TRANSPARENT;
};
