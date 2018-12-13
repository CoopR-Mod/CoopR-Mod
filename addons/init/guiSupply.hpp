//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

class CoopR_Supply_Dialog
{
    idd = 1104;
    movingEnable = false;

    class ControlsBackground
    {
        class CoopR_Supply_Background
        {
            type = 0;
            idc = 11040;
            x = safeZoneX + safeZoneW * 0.29375;
            y = safeZoneY + safeZoneH * 0.22444445;
            w = safeZoneW * 0.4125;
            h = safeZoneH * 0.55;
            style = 0;
            text = "";
            colorBackground[] = {0.4,0.6,0.4,1};
            colorText[] = {0,0,0,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

        };

    };
    class Controls
    {
        class CoopR_Supply_Ammo_Textbox
        {
            type = 13;
            idc = 11041;
            x = safeZoneX + safeZoneW * 0.31875;
            y = safeZoneY + safeZoneH * 0.27333334;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "placeholder";
            size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            access = 0;
            colorBackground[] = {1,1,1,0};
            class Attributes
            {

            };

        };
        class CoopR_Supply_Equipment_Textbox
        {
            type = 13;
            idc = 11042;
            x = safeZoneX + safeZoneW * 0.31875;
            y = safeZoneY + safeZoneH * 0.34666667;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "placeholder";
            size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            access = 0;
            colorBackground[] = {1,1,1,0};
            class Attributes
            {

            };

        };
        class CoopR_Supply_Ammo_Edit
        {
            type = 2;
            idc = 11043;
            x = safeZoneX + safeZoneW * 0.39375;
            y = safeZoneY + safeZoneH * 0.27333334;
            w = safeZoneW * 0.0375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "";
            autocomplete = "";
            colorBackground[] = {0.302,0.502,0.302,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelection[] = {1,0,0,1};
            colorText[] = {0.1529,0.1529,0.5294,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

        };
        class CoopR_Supply_Equipment_Edit
        {
            type = 2;
            idc = 11044;
            x = safeZoneX + safeZoneW * 0.39375;
            y = safeZoneY + safeZoneH * 0.34666667;
            w = safeZoneW * 0.0375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "";
            autocomplete = "";
            colorBackground[] = {0.302,0.502,0.302,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelection[] = {1,0,0,1};
            colorText[] = {0.1529,0.1529,0.5294,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            shadow = 2;

        };
        class CoopR_Supply_Request_Button
        {
            type = 1;
            idc = 11045;
            x = safeZoneX + safeZoneW * 0.44375;
            y = safeZoneY + safeZoneH * 0.66444445;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.06111112;
            style = 0+2;
            text = "Request Supply";
            borderSize = 0;
            colorBackground[] = {0.2,0.302,0.702,1};
            colorBackgroundActive[] = {0.2,0.302,0.702,1};
            colorBackgroundDisabled[] = {0.6,0.702,1,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.302,0.702,1};
            colorShadow[] = {0,0,0,1};
            colorText[] = {0.9451,0.7216,0.5059,1};
            font = "PuristaMedium";
            offsetPressedX = 0.01;
            offsetPressedY = 0.01;
            offsetX = 0.01;
            offsetY = 0.01;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};

        };

    };

};
