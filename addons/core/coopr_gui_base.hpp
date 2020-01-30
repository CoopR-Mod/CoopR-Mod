/**
    CoopR GUI config credits go to Heyoxe (https://steamcommunity.com/id/Heyoxe/)
    former prefix was EBA_
    was changed to COOPR_ to be uniform with mod
    allowed by original author "Heyoxe"
**/

#include "controls.hpp"

#define COOPR_COLOR_BACKGROUND {0, 0, 0, 0.5}
#define COOPR_COLOR_TRANSPARENT {0, 0, 0, 0}
#define COOPR_COLOR_SEMI_TRANSPARENT {0, 0, 0, 0.5}
#define COOPR_COLOR_WHITE {1, 1, 1, 1}
#define COOPR_COLOR_BLACK {0, 0, 0, 1}
#define COOPR_COLOR_ERROR {255, 0, 0, 1}
#define COOPR_COLOR_DISABLED {0.5, 0.5, 0.5, 1}
#define COOPR_TOCOLOR(r,g,b,a) {(r / 255), (g / 255), (b / 255), a}
#define COOPR_COLOR_MAIN COOPR_TOCOLOR(28,153,199,1)
#define COOPR_COLOR_MAIN_HOVER COOPR_TOCOLOR(28,153,199,0.5)
#define COOPR_DISABLE_CONTROL "(_this#0) ctrlEnable false; (_this#0) ctrlShow false"
#define COOPR_NO_ROLE_PICTURE "\x\coopr\addons\lobby\data\images\no-role-256-white.paa"
#define COOPR_FONTZSIZE(SIZE) #(((SIZE * 0.00222222) * (getResolution select 1)) / 1080)

/*
    @COOPR_BINDCONTROL
    "Listen" to changes to a variables and show/hide the assigned control with a fade-in-out animation of 0.3s.
        0 - Namespace<Namespace>: Namespace in which the `getVariable` will operate.
        1 - Variable<String>: Name of the variable.
        2 - Value<Any>: Check the variable against this value with `{Variable} isEqualTo {Value}`.
*/
#define COOPR_BINDCONTROL(NAMESPACE,VARIABLE,VALUE) \
"(_this#0) ctrlEnable false; (_this#0) ctrlSetFade 1; (_this#0) ctrlCommit 0; \
_this spawn { \
	private _namespace = call compile "##NAMESPACE##"; \
	private _variable = call compile '"##VARIABLE##"'; \
	private _value = call compile "##VALUE##"; \
	while { dialog } do { \
		private _control = _this#0; \
		private _state = (_namespace getVariable [_variable, false]) isEqualTo _value; \
		private _fade = [1, 0] select _state; \
		if !(_state isEqualTo (_control getVariable ['state', false])) then { \
			_control ctrlEnable _state; \
			_control ctrlSetFade _fade; \
			_control ctrlCommit 0.3; \
			_control setVariable ['state', _state]; \
		}; \
		uiSleep 0.1; \
	}; \
};"

/*
    @COOPR_BINDCONTROL
    Same as the above macro put will check both variables `({Variable1} isEqualTo {Value1}) && ({Variable2} isEqualTo {Value2})`
*/
#define COOPR_BINDCONTROL2(NAMESPACE,VARIABLE,VALUE,NAMESPACE2,VARIABLE2,VALUE2) \
"(_this#0) ctrlEnable false; (_this#0) ctrlSetFade 1; (_this#0) ctrlCommit 0; \
_this spawn { \
	private _namespace = call compile "##NAMESPACE##"; \
	private _variable = call compile '"##VARIABLE##"'; \
	private _value = call compile "##VALUE##"; \
	private _namespace2 = call compile "##NAMESPACE2##"; \
	private _variable2 = call compile '"##VARIABLE2##"'; \
	private _value2 = call compile "##VALUE2##"; \
	while { dialog } do { \
		private _control = _this#0; \
		private _state = ((_namespace getVariable [_variable, false]) isEqualTo _value) && (_namespace2 getVariable [_variable2, false]) isEqualTo _value2; \
		private _fade = [1, 0] select _state; \
		if !(_state isEqualTo (_control getVariable ['state', false])) then { \
			_control ctrlEnable _state; \
			_control ctrlSetFade _fade; \
			_control ctrlCommit 0.3; \
			_control setVariable ['state', _state]; \
		}; \
		uiSleep 0.1; \
	}; \
};"


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
    colorDisabled[] = COOPR_COLOR_WHITE;
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

class COOPR_ButtonPictureNoBG: COOPR_CommonProperites {
    style = 48;
    type = 1;
    borderSize = 0;
    colorBackground[] = COOPR_COLOR_TRANSPARENT;
    colorBackgroundActive[] = COOPR_COLOR_TRANSPARENT;
    colorBackgroundDisabled[] = COOPR_COLOR_TRANSPARENT;
    colorDisabled[] = COOPR_COLOR_TRANSPARENT;
    colorFocused[] = COOPR_COLOR_TRANSPARENT;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;

    //text = "#(argb,8,8,3)color(0,0,1,1)";

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
    rowHeight = 0.06 * safezoneH;
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
    colorDisabled[] = COOPR_COLOR_WHITE;
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
    colorBackgroundActive[] = COOPR_COLOR_MAIN_HOVER;
    colorBackgroundDisabled[] = COOPR_COLOR_TRANSPARENT;
    colorDisabled[] = COOPR_COLOR_TRANSPARENT;
    colorFocused[] = COOPR_COLOR_MAIN_HOVER;
};
