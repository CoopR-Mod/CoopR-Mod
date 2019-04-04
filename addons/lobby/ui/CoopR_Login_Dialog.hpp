class CoopR_Login_Dialog {
  idd = 1101;
  movingEnabled = false;

  class Backgrounds {}

  class Controls{

   class coopr_Login_Background: RscText
   {
   	idc = 1000;
   	x = 0.0875804 * safezoneW + safezoneX;
   	y = 0.0928181 * safezoneH + safezoneY;
   	w = 0.824839 * safezoneW;
   	h = 0.825369 * safezoneH;
   	colorBackground[] = {0.6,0.6,0.4,0.8};
   };
   class coopr_Login_Profile_1: RscPicture
   {
   	idc = 1200;
   	x = 0.154599 * safezoneW + safezoneX;
   	y = 0.224877 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.385172 * safezoneH;
   };
   class coopr_Login_Profile_1_Overlay: RscButtonMenu
   {
   	idc = 1210;
   	x = 0.154599 * safezoneW + safezoneX;
   	y = 0.224877 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.385172 * safezoneH;
   	colorBackgroundActive[] = {0,0,0,0};
   	color[] = {0,0,0,0};
   	color2[] = {0,0,0,0};
   	colorBackground[] = {0,0,0,0};
   	colorBackground2[] = {0,0,0,0};
   };
   class coopr_Login_Profile_2: RscPicture
   {
   	idc = 1201;
   	x = 0.422671 * safezoneW + safezoneX;
   	y = 0.224877 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.385172 * safezoneH;
   };
   class coopr_Login_Profile_2_Overlay: RscButtonMenu
   {
   	idc = 1220;
   	x = 0.422671 * safezoneW + safezoneX;
   	y = 0.224877 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.385172 * safezoneH;
   	colorBackgroundActive[] = {0,0,0,0};
   	color[] = {0,0,0,0};
   	color2[] = {0,0,0,0};
   	colorBackground[] = {0,0,0,0};
   	colorBackground2[] = {0,0,0,0};
   };
   class coopr_Login_Profile_3: RscPicture
   {
   	idc = 1202;
   	x = 0.685589 * safezoneW + safezoneX;
   	y = 0.224877 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.385172 * safezoneH;
   };
   // https://forums.bohemia.net/forums/topic/161429-button-texture/
   class coopr_Login_Profile_3_Overlay: RscButtonMenu
   {
   	idc = 1230;
   	x = 0.685589 * safezoneW + safezoneX;
   	y = 0.224877 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.385172 * safezoneH;
   	colorBackgroundActive[] = {0,0,0,0};
   	color[] = {0,0,0,0};
   	color2[] = {0,0,0,0};
   	colorBackground[] = {0,0,0,0};
   	colorBackground2[] = {0,0,0,0};
   };
   class coopr_Login_Profile_1_Button: RscButton
   {
   	idc = 1600;
   	text = "Entfernen"; //--- ToDo: Localize;
   	x = 0.154599 * safezoneW + safezoneX;
   	y = 0.621054 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.0550246 * safezoneH;
   	colorBackground[] = {0,0,0,1};
   };
   class coopr_Login_Profile_2_Button: RscButton
   {
   	idc = 1601;
   	text = "Entfernen"; //--- ToDo: Localize;
   	x = 0.422671 * safezoneW + safezoneX;
   	y = 0.621054 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.0550246 * safezoneH;
   	colorBackground[] = {0,0,0,1};
   };
   class coopr_Login_Profile_3_Button: RscButton
   {
   	idc = 1602;
   	text = "Entfernen"; //--- ToDo: Localize;
   	x = 0.685589 * safezoneW + safezoneX;
   	y = 0.621054 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.0550246 * safezoneH;
   	colorBackground[] = {0,0,0,1};
   };
   class coopr_Login_Profile_1_Label: RscText
   {
   	idc = 1001;
   	text = "Profil 1"; //--- ToDo: Localize;
   	x = 0.200996 * safezoneW + safezoneX;
   	y = 0.169853 * safezoneH + safezoneY;
   	w = 0.0567077 * safezoneW;
   	h = 0.0440197 * safezoneH;
   	sizeEx = 2 * GUI_GRID_H;
   };
   class coopr_Login_Profile_1_Info: RscStructuredText
   {
   	idc = 1100;
   	x = 0.154599 * safezoneW + safezoneX;
   	y = 0.687084 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.143064 * safezoneH;
   };
   class coopr_Login_Profile_2_Info: RscStructuredText
   {
   	idc = 1101;
   	x = 0.422671 * safezoneW + safezoneX;
   	y = 0.687084 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.143064 * safezoneH;
   };
   class coopr_Login_Profile_3_Info: RscStructuredText
   {
   	idc = 1102;
   	x = 0.685589 * safezoneW + safezoneX;
   	y = 0.687084 * safezoneH + safezoneY;
   	w = 0.159813 * safezoneW;
   	h = 0.143064 * safezoneH;
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

