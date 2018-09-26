class X11_Login_Dialog{
  idd = 1101;
  movingEnabled = false;

  class controls{

    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT START (by xetra11, v1.063, #Fusori)
    ////////////////////////////////////////////////////////

    class X11_rscPicture: RscPicture
    {
        idc = 1200;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.448438 * safezoneW + safezoneX;
        y = 0.312916 * safezoneH + safezoneY;
        w = 0.113437 * safezoneW;
        h = 0.330147 * safezoneH;
    };
    class X11_rscButton_Login: RscButton
    {
        idc = 1600;
        text = "Login"; //--- ToDo: Localize;
        x = 0.474219 * safezoneW + safezoneX;
        y = 0.356936 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.0440197 * safezoneH;
    };
    class X11_rscButton_Register: RscButton
    {
        idc = 1601;
        text = "Register"; //--- ToDo: Localize;
        x = 0.474219 * safezoneW + safezoneX;
        y = 0.422966 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.0440197 * safezoneH;
    };
    class X11_rscButton_Reset: RscButton
    {
        idc = 1602;

        text = "Reset Profile"; //--- ToDo: Localize;
        x = 0.474219 * safezoneW + safezoneX;
        y = 0.533015 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.0440197 * safezoneH;
    };
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT END
    ////////////////////////////////////////////////////////

    }
}


/* #Fusori
$[
    1.063,
    ["X11_login",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
    [1200,"X11_rscPicture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.448438 * safezoneW + safezoneX","0.312916 * safezoneH + safezoneY","0.113437 * safezoneW","0.330147 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1600,"X11_rscButton_Login",[1,"Login",["0.474219 * safezoneW + safezoneX","0.356936 * safezoneH + safezoneY","0.061875 * safezoneW","0.0440197 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1601,"X11_rscButton_Register",[1,"Register",["0.474219 * safezoneW + safezoneX","0.422966 * safezoneH + safezoneY","0.061875 * safezoneW","0.0440197 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1602,"X11_rscButton_Close",[1,"Close",["0.484531 * safezoneW + safezoneX","0.555025 * safezoneH + safezoneY","0.04125 * safezoneW","0.0440197 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

