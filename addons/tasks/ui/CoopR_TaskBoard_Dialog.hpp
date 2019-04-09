class CoopR_TaskBoard_Dialog
{
	idd = GUI_ID_TASKBOARD_DIALOG;

	class ControlsBackground
	{
		class CoopR_TaskBoard_Background : ctrlStaticPicture
		{
			idc = GUI_ID_TASKBOARD_BACKGROUND;
			x = safeZoneX + safeZoneW * 0.259375;
			y = safeZoneY + safeZoneH * 0.17555556;
			w = safeZoneW * 0.474375;
			h = safeZoneH * 0.64777778;
			text = "x\coopr\addons\tasks\data\images\taskboard_bg.paa";

		};

	};
	class Controls
	{
		class CoopR_TaskBoard_Document_Recon : ctrlButtonPictureOnly
		{
			idc = GUI_ID_TASKBOARD_DOCUMENT_RECON;
			x = safeZoneX + safeZoneW * 0.28125;
			y = safeZoneY + safeZoneH * 0.31111112;
			w = safeZoneW * 0.201875;
			h = safeZoneH * 0.36333334;
			text = "x\coopr\addons\tasks\data\images\taskboard_recon.paa";

		};
		class CoopR_TaskBoard_Document_Combat : ctrlButtonPictureOnly 
		{
			idc = GUI_ID_TASKBOARD_DOCUMENT_COMBAT;
			x = safeZoneX + safeZoneW * 0.495;
			y = safeZoneY + safeZoneH * 0.29666667;
			w = safeZoneW * 0.22125;
			h = safeZoneH * 0.38444445;
			text = "x\coopr\addons\tasks\data\images\taskboard_combat.paa";

		};
		class CoopR_TaskBoard_Document_Combat_Label
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_DOCUMENT_COMBAT_LABEL;
			x = safeZoneX + safeZoneW * 0.556875;
			y = safeZoneY + safeZoneH * 0.41888889;
			w = safeZoneW * 0.0675;
			h = safeZoneH * 0.03666667;
			style = 0;
			text = "Combat Tasks";
			colorBackground[] = {0.6353,0.3569,0.2627,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

		};
		class CoopR_TaskBoard_Document_Recon_Label
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_DOCUMENT_RECON_LABEL;
			x = safeZoneX + safeZoneW * 0.348125;
			y = safeZoneY + safeZoneH * 0.39222223;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03666667;
			style = 0;
			text = "Recon Tasks";
			colorBackground[] = {0.6353,0.3569,0.2627,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

		};

	};
	
};
