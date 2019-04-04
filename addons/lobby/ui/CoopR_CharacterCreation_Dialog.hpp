class CoopR_CharacterCreation_Dialog {

    idd = 1103;
    movingEnabled = false;

    class Backgrounds {}

    class Controls {

        class CoopR_CharacterCreation_Background: RscText
        {
            idc = 3000;
            x = 0.164909 * safezoneW + safezoneX;
            y = 0.0928181 * safezoneH + safezoneY;
            w = 0.644406 * safezoneW;
            h = 0.770344 * safezoneH;
            colorBackground[] = {0.6,0.6,0.4,0.8};
        };
        class CoopR_CharacterCreation_Title: RscText
        {
            idc = 3001;
            text = "Neues Profil erstellen"; //--- ToDo: Localize;
            x = 0.396895 * safezoneW + safezoneX;
            y = 0.136838 * safezoneH + safezoneY;
            w = 0.190744 * safezoneW;
            h = 0.0550246 * safezoneH;
            sizeEx = 2 * GUI_GRID_H;
        };
        class CoopR_CharacterCreation_Info: RscStructuredText
        {
            idc = 3003;
            x = 0.216406 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class CoopR_CharacterCreation_Button_Create: RscButton
        {
        	idc = 3600;
        	text = "Erstellen"; //--- ToDo: Localize;
        	x = 0.216462 * safezoneW + safezoneX;
        	y = 0.533015 * safezoneH + safezoneY;
        	w = 0.103105 * safezoneW;
        	h = 0.0440197 * safezoneH;
        	colorBackground[] = {0,0,0,0.8};
        };

        class CoopR_CharacterCreation_Edit_Name: RscEdit
        {
            idc = 3400;
            x = 0.216462 * safezoneW + safezoneX;
            y = 0.279902 * safezoneH + safezoneY;
            w = 0.175278 * safezoneW;
            h = 0.0440197 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class CoopR_CharacterCreation_Label_Name: RscText
        {
            idc = 3002;
            text = "Name des Soldaten"; //--- ToDo: Localize;
            x = 0.216462 * safezoneW + safezoneX;
            y = 0.257892 * safezoneH + safezoneY;
            w = 0.0773287 * safezoneW;
            h = 0.0220098 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class CoopR_CharacterCreation_Label_Specialisation: RscText
        {
            idc = 3003;
            text = "Spezialisierung"; //--- ToDo: Localize;
            x = 0.216462 * safezoneW + safezoneX;
            y = 0.378946 * safezoneH + safezoneY;
            w = 0.0773287 * safezoneW;
            h = 0.0220098 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class CoopR_CharacterCreation_Combo_Role: RscCombo
        {
            idc = 3100;
            x = 0.216462 * safezoneW + safezoneX;
            y = 0.400956 * safezoneH + safezoneY;
            w = 0.134036 * safezoneW;
            h = 0.0330147 * safezoneH;
        };
        class CoopR_CharacterCreation_ClassPicture: RscPicture
        {
            idc = 3200;
            text = "\x\coopr\addons\lobby\data\images\group-leader-256.paa";
            x = 0.48 * safezoneW + safezoneX;
            y = 0.235882 * safezoneH + safezoneY;
            w = 0.21 * safezoneW;
            h = 0.30 * safezoneH;
            colorBackground[] = {0.6,0.6,0.4,0.8};
        };

    };
};
