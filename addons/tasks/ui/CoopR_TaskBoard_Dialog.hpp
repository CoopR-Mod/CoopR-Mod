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
		
	};
	
};
