class CoopR_ReconReport_Dialog
{
	idd = GUI_ID_RECON_REPORT_DIALOG;
	movingEnable = true;
	
	class ControlsBackground
	{
		class CoopR_ReconReport_Background
		{
			type = 0;
			idc = GUI_ID_RECON_REPORT_BACKGROUND;
			x = safeZoneX + safeZoneW * 0.26875;
			y = safeZoneY + safeZoneH * 0.12666667;
			w = safeZoneW * 0.4625;
			h = safeZoneH * 0.75;
			style = 2+48;
			text = "x\coopr\addons\missions\data\images\notebook_front.paa";
			colorBackground[] = {0.8392,0.8039,0.7765,1};
			colorText[] = {0.8392,0.8039,0.7765,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class CoopR_ReconReport_Marker_Edit
		{
			type = 2;
			idc = GUI_ID_RECON_REPORT_MARKER_EDIT;
			x = safeZoneX + safeZoneW * 0.584375;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.0725;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "";
			autocomplete = "";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorSelection[] = {0.8392,0.8039,0.7765,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_ReconReport_Type_Combo
		{
			type = 4;
			idc = GUI_ID_RECON_REPORT_TYPE_COMBO;
			x = safeZoneX + safeZoneW * 0.384375;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.06125;
			h = safeZoneH * 0.02;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorSelect[] = {0,0,0,1};
			colorSelectBackground[] = {0.8392,0.8039,0.7765,1};
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
				color[] = {1,1,1,0};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class CoopR_ReconReport_Strength_Combo
		{
			type = 4;
			idc = GUI_ID_RECON_REPORT_STRENGTH_COMBO;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.06125;
			h = safeZoneH * 0.02;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorSelect[] = {0,0,0,1};
			colorSelectBackground[] = {0.8392,0.8039,0.7765,1};
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
		class CoopR_ReconReport_Behaviour_Combo
		{
			type = 4;
			idc = GUI_ID_RECON_REPORT_BEHAVIOUR_COMBO;
			x = safeZoneX + safeZoneW * 0.515625;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.06125;
			h = safeZoneH * 0.02;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorSelect[] = {0,0,0,1};
			colorSelectBackground[] = {0.8392,0.8039,0.7765,1};
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
		class CoopR_ReconReport_Sender_Label
		{
			type = 0;
			idc = GUI_ID_RECON_REPORT_SENDER_LABEL;
			x = safeZoneX + safeZoneW * 0.386875;
			y = safeZoneY + safeZoneH * 0.21555556;
			w = safeZoneW * 0.055;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "xetra11";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_ReconReport_Write_Button
		{
			type = 16;
			idc = GUI_ID_RECON_REPORT_WRITE_BUTTON;
			x = safeZoneX + safeZoneW * 0.58625;
			y = safeZoneY + safeZoneH * 0.79666667;
			w = safeZoneW * 0.046875;
			h = safeZoneH * 0.02444445;
			style = 0;
			text = $STR.coopr.report.write;
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorBackground[] = {0.8392,0.8039,0.7765,1};
			colorBackground2[] = {0.8392,0.8039,0.7765,1};
			colorBackgroundFocused[] = {0.8392,0.8039,0.7765,1};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorFocused[] = {0,0,0,1};
			font = "PuristaMedium";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class CoopR_ReconReport_Remove_Button
		{
			type = 16;
			idc = GUI_ID_RECON_REPORT_REMOVE_BUTTON;
			x = safeZoneX + safeZoneW * 0.434375;
			y = safeZoneY + safeZoneH * 0.74888889;
			w = safeZoneW * 0.059375;
			h = safeZoneH * 0.02444445;
			style = 0;
			text = $STR.coopr.report.remove;
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorBackground[] = {0.8392,0.8039,0.7765,1};
			colorBackground2[] = {0.8392,0.8039,0.7765,1};
			colorBackgroundFocused[] = {0.8392,0.8039,0.7765,1};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorFocused[] = {0,0,0,1};
			font = "PuristaMedium";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class CoopR_ReconReport_Time_Label
		{
			type = 0;
			idc = GUI_ID_RECON_REPORT_TIME_LABEL;
			x = safeZoneX + safeZoneW * 0.613125;
			y = safeZoneY + safeZoneH * 0.16777778;
			w = safeZoneW * 0.045;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "1215";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_ReconReports_Entries_Struct
		{
			type = 13;
			idc = GUI_ID_RECON_REPORTS_ENTRIES_STRUCT;
			x = safeZoneX + safeZoneW * 0.384375;
			y = safeZoneY + safeZoneH * 0.37888889;
			w = safeZoneW * 0.265;
			h = safeZoneH * 0.36333334;
			style = 0;
			text = "";
			colorText[] = {0,0,0,1};
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class CoopR_ReconReport_EntryRemove_Combo
		{
			type = 4;
			idc = GUI_ID_RECON_REPORT_ENTRYREMOVE_COMBO;
			x = safeZoneX + safeZoneW * 0.386875;
			y = safeZoneY + safeZoneH * 0.75222223;
			w = safeZoneW * 0.0425;
			h = safeZoneH * 0.02;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.8392,0.8039,0.7765,0};
			colorDisabled[] = {0.8392,0.8039,0.7765,1};
			colorSelect[] = {0,0,0,1};
			colorSelectBackground[] = {0.8392,0.8039,0.7765,1};
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
