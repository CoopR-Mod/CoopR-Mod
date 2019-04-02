class cfgWeapons{
	class ItemCore;
	class CBA_MiscItem_ItemInfo;

	class coopr_item_camping : ItemCore{
		scope = 2;
		author = "Gilles";
		displayName = "camping item"; // TODO-LOCALIZE
		descriptionShort = "useless";
		descriptionUse = "useless";
		picture = "\A3\Weapons_F\Data\UI\gear_item_compass_ca.paa";
		model = "\a3\Weapons_F\Ammo\mag_compass.p3d";

		class ItemInfo: CBA_MiscItem_ItemInfo{
			mass = 0.5;
			allowedSlots[] = {901};
			modelSides[] = {6};
		};
		
	};

};	