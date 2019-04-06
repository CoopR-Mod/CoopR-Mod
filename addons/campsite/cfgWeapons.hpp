class cfgWeapons{
	class ItemCore;
	class CBA_MiscItem_ItemInfo;

	class coopr_item_camping : ItemCore{
		scope = 2;
		author = "Gilles";
		displayName = "$STR.coopr.campsite.item.campsite";
		descriptionShort = "useless";
		descriptionUse = "useless";
		picture = "\A3\Weapons_F\Items\data\UI\gear_Toolkit_CA.paa";
		model = "\A3\Structures_F\Civ\Camping\Campfire_F.p3d";

		class ItemInfo: CBA_MiscItem_ItemInfo{
			mass = 0.5;
			allowedSlots[] = {901};
			modelSides[] = {6};
		};
		
	};

};	