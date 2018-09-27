class X11_Equipment_Dialog{

    idd = 1102;
    movingEnabled = false;

    class Backgrounds {}

    class Controls {

        class X11_Equipment_Background: RscText
        {
            idc = 1000;
            x = 0.21125 * safezoneW + safezoneX;
            y = 0.0598034 * safezoneH + safezoneY;
            w = 0.567187 * safezoneW;
            h = 0.869388 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class X11_Equipment_Listbox: RscListbox
        {
            idc = 1500;
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.235882 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.62728 * safezoneH;
            colorBackground[] = {0.6,0.6,0.4,1};
        };
        class X11_Equipment_Info_Textbox: RscStructuredText
        {
            idc = 1001;
            text = "<Placeholder Text>";
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.367941 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.484216 * safezoneH;
        };
        class X11_Equipment_Reputation_Textbox: RscText
        {
            idc = 1002;
            text = "<Placeholder Text>";
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.246887 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.0990442 * safezoneH;
            tooltip = "Das ist deine momentane Reputation"; //--- ToDo: Localize;
        };
        class X11_Equipment_Button_Equip: RscButton
        {
            idc = 1600;
            text = "Ausruesten"; //--- ToDo: Localize;
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.103823 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.0770344 * safezoneH;
        };
    }
}

