class CoopR_TaskBoard_Dialog
{
	idd = GUI_ID_TASKBOARD_DIALOG;

	class ControlsBackground
	{
		class CoopR_TaskBoard_Background : ctrlStaticPicture
		{
			idc = GUI_ID_TASKBOARD_BACKGROUND;
			x = safeZoneX + safeZoneW * 0.234375;
			y = safeZoneY + safeZoneH * 0.15111112;
			w = safeZoneW * 0.524375;
			h = safeZoneH * 0.74555556;
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
		class CoopR_TaskBoard_Task_1 : ctrlButtonPictureOnly 
		{
			idc = GUI_ID_TASKBOARD_TASK_1;
			x = safeZoneX + safeZoneW * 0.255625;
			y = safeZoneY + safeZoneH * 0.29111112;
			w = safeZoneW * 0.22125;
			h = safeZoneH * 0.38444445;
			text = "x\coopr\addons\tasks\data\images\taskboard_task_1.paa";
		};
		class CoopR_TaskBoard_Task_2 : ctrlButtonPictureOnly 
		{
			idc = GUI_ID_TASKBOARD_TASK_2;
			x = safeZoneX + safeZoneW * 0.39125;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.22125;
			h = safeZoneH * 0.38444445;
			text = "x\coopr\addons\tasks\data\images\taskboard_task_2.paa";
		};
		class CoopR_TaskBoard_Task_3 : ctrlButtonPictureOnly 
		{
			idc = GUI_ID_TASKBOARD_TASK_3;
			x = safeZoneX + safeZoneW * 0.52625;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.22125;
			h = safeZoneH * 0.38444445;
			text = "x\coopr\addons\tasks\data\images\taskboard_task_3.paa";
		};
		class CoopR_TaskBoard_Task_1_Type_Label
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_TASK_1_TYPE_LABEL;
			x = safeZoneX + safeZoneW * 0.34;
			y = safeZoneY + safeZoneH * 0.65555556;
			w = safeZoneW * 0.04875;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Sniper Task";
			colorBackground[] = {0.5451,0.7059,0.3961,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_TaskBoard_Task_1_Accuracy
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_TASK_1_ACCURACY;
			x = safeZoneX + safeZoneW * 0.33875;
			y = safeZoneY + safeZoneH * 0.68;
			w = safeZoneW * 0.07375;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Accuracy: 57%";
			colorBackground[] = {0.5451,0.7059,0.3961,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_TaskBoard_Task_2_Type_Label
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_TASK_2_TYPE_LABEL;
			x = safeZoneX + safeZoneW * 0.47875;
			y = safeZoneY + safeZoneH * 0.65555556;
			w = safeZoneW * 0.04875;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Sniper Task";
			colorBackground[] = {0.5451,0.7059,0.3961,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_TaskBoard_Task_2_Accuracy
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_TASK_2_ACCURACY;
			x = safeZoneX + safeZoneW * 0.4775;
			y = safeZoneY + safeZoneH * 0.68111112;
			w = safeZoneW * 0.07375;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Accuracy: 57%";
			colorBackground[] = {0.5451,0.7059,0.3961,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_TaskBoard_Task_3_Type_Label
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_TASK_3_TYPE_LABEL;
			x = safeZoneX + safeZoneW * 0.615;
			y = safeZoneY + safeZoneH * 0.65555556;
			w = safeZoneW * 0.04875;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Sniper Task";
			colorBackground[] = {0.5451,0.7059,0.3961,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class CoopR_TaskBoard_Task_3_Accuracy
		{
			type = 0;
			idc = GUI_ID_TASKBOARD_TASK_3_ACCURACY;
			x = safeZoneX + safeZoneW * 0.61375;
			y = safeZoneY + safeZoneH * 0.68;
			w = safeZoneW * 0.07375;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Accuracy: 57%";
			colorBackground[] = {0.5451,0.7059,0.3961,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
