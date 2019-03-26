class CoopR_ReconReport_Dialog
{
	idd = 1105;
	movingEnable = true;
	
	class ControlsBackground
	{
        class CoopR_ReconReport_Background : RscPicture
		{
			type = 0;
			idc = 11050;
            x = safeZoneX + safeZoneW * 0.26875
            y = safeZoneY + safeZoneH * 0.12666667
            w = safeZoneW * 0.4625
            h = safeZoneH * 0.75
            text = "x\coopr\addons\tasks\data\images\notebook_front.paa";
            colorBackground[] = {0.2588,0.5294,0.2078,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class CoopR_ReconReport_Additional_Edit
		{
			type = 2;
			idc = 11054;
			x = safeZoneX + safeZoneW * 0.413125;
			y = safeZoneY + safeZoneH * 0.31444445;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.05222223;
			style = 0;
			text = "<marker_name>";
			autocomplete = "";
			colorBackground[] = {0.3804,0.3961,0.239,1};
			colorDisabled[] = {0.8549,0.8902,0.5373,1};
			colorSelection[] = {0.302,0.302,0.302,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_ReconReport_Write_Button
		{
			type = 1;
			idc = 11055;
			x = safeZoneX + safeZoneW * 0.553125;
			y = safeZoneY + safeZoneH * 0.31444445;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "create entry";
			borderSize = 0;
			colorBackground[] = {0.502,0.502,0.102,1};
			colorBackgroundActive[] = {0.4,0.4,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
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
		class CoopR_ReconReports_Entries_Structured
		{
			type = 13;
			idc = 11056;
			x = safeZoneX + safeZoneW * 0.413125;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.201875;
			h = safeZoneH * 0.35444445;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class CoopR_ReconReport_Combobox_1
		{
			type = 4;
			idc = 11051;
			x = safeZoneX + safeZoneW * 0.413125;
			y = safeZoneY + safeZoneH * 0.27666667;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03111112;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8549,0.8902,0.5373,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.902,0.902,0.6,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class CoopR_ReconReport_Combobox_2
		{
			type = 4;
			idc = 11052;
			x = safeZoneX + safeZoneW * 0.485;
			y = safeZoneY + safeZoneH * 0.27555556;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03111112;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8549,0.8902,0.5373,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.902,0.902,0.6,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class CoopR_ReconReport_Combobox_3
		{
			type = 4;
			idc = 11053;
			x = safeZoneX + safeZoneW * 0.55375;
			y = safeZoneY + safeZoneH * 0.27555556;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03111112;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8549,0.8902,0.5373,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.902,0.902,0.6,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		
	};
	
};
