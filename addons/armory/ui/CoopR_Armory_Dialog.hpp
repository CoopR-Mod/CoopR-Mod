class CoopR_Armory_Dialog{

    idd = GUI_ID_ARMORY_DIALOG;
    movingEnabled = false;

    class Backgrounds {}

    class Controls {

        class CoopR_Armory_Background: RscText
        {
            idc = GUI_ID_ARMORY_BACKGROUND;
            x = 0.21125 * safezoneW + safezoneX;
            y = 0.0598034 * safezoneH + safezoneY;
            w = 0.567187 * safezoneW;
            h = 0.869388 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class CoopR_Armory_Listbox: RscListbox
        {
            idc = GUI_ID_ARMORY_LISTBOX;
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.235882 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.62728 * safezoneH;
            colorBackground[] = {0.6,0.6,0.4,1};
        };
        class CoopR_Armory_Info_Textbox: RscStructuredText
        {
            idc = GUI_ID_ARMORY_INFO_TEXTBOX;
            text = "<Placeholder Info>";
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.367941 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.484216 * safezoneH;
        };
        class CoopR_Armory_Reputation_Textbox: RscText
        {
            idc = GUI_ID_ARMORY_REPUTATION_TEXTBOX;
            text = "<Placeholder Reputation>";
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.246887 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.0990442 * safezoneH;
            tooltip = "Das ist deine momentane Reputation"; //--- ToDo: Localize;
        };
        class CoopR_Armory_Button_Equip: RscButton
        {
            idc = GUI_ID_ARMORY_BUTTON_EQUIP;
            text = "Ausruesten"; //--- ToDo: Localize;
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.103823 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.0770344 * safezoneH;
        };
    }
}

