class cfgWeapons{
	class ItemCore;
	class CBA_MiscItem_ItemInfo;

	class coopr_item_foldedTent : ItemCore{
		scope = 2;
		author = "Gilles";
		displayName = "$STR.coopr.campsite.item.name.tent";
		descriptionShort = "$STR.coopr.campsite.item.desc.tent";
		descriptionUse = "$STR.coopr.campsite.item.desc.tent";
		picture = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sleeping_bag_brown_folded_F.jpg";
		model = "\A3\Structures_F\Civ\Camping\Sleeping_bag_brown_folded_F.p3d";
		class ItemInfo: CBA_MiscItem_ItemInfo{
			mass = 10;
			allowedSlots[] = {901};
			modelSides[] = {6};
		};
		
	};

};	