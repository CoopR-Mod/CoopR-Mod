/**
    CoopR GUI config credits go to Heyoxe (https://steamcommunity.com/id/Heyoxe/)
**/

#include "controls.hpp"

#define EBA_COLOR_BACKGROUND {0, 0, 0, 0.5}
#define EBA_COLOR_TRANSPARENT {0, 0, 0, 0}
#define EBA_COLOR_WHITE {1, 1, 1, 1}
#define EBA_COLOR_BLACK {0, 0, 0, 1}
#define EBA_COLOR_ERROR {255, 0, 0, 1}
#define EBA_COLOR_DISABLED {0.5, 0.5, 0.5, 1}
#define EBA_TOCOLOR(r,g,b,a) {(r / 255), (g / 255), (b / 255), a}
#define EBA_COLOR_MAIN EBA_TOCOLOR(28,153,199,1)
#define EBA_COLOR_MAIN_HOVER EBA_TOCOLOR(28,153,199,0.5)
#define COOPR_DISABLE_CONTROL "(_this#0) ctrlEnable false; (_this#0) ctrlShow false"


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

	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
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

class EBA_Error: EBA_Text {
    colorText[] = EBA_COLOR_ERROR;
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
    class RowTemplate {};

    class HeaderTemplate {};
};

class EBA_Row_Button: RscButton {
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
    shadow = 0;
    borderSize = 0; 
};

class EBA_Row_SelectButton: RscButton {
    colorText[] = EBA_COLOR_TRANSPARENT;
    colorBackground[] = EBA_COLOR_TRANSPARENT;
    colorBackgroundActive[] = EBA_COLOR_TRANSPARENT;
    colorBackgroundDisabled[] = EBA_COLOR_TRANSPARENT;
    clorDisabled[] = EBA_COLOR_TRANSPARENT;
    colorFocused[] = EBA_COLOR_TRANSPARENT;
};
