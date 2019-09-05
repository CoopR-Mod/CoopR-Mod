#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
};

class cfgVehicles
{
	class Item_Base_F;

	class coopr_item_foldedTent : Item_Base_F
	{
		scope = 2;
        scopeCurator = 2;
        displayName= "$STR.coopr.campsite.item.tent";
		picture = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sleeping_bag_brown_folded_F.jpg";
        author = "Gilles";
        vehicleClass = "Tents";
        editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sleeping_bag_brown_folded_F.jpg";

        class TransportItems{
            MACRO_ADDITEM(coopr_item_foldedTent,1);
        };
	};

	class Logic;
    class Module_F: Logic
    {
        class ArgumentsBaseUnits
        {
            class Default;
            class Combo; // Default combo box (i.e., drop-down menu)
            class ModuleDescription;
        };
        // Description base classes, for more information see below
        class ModuleDescription
        {
            class AnyBrain;
        };
    };
    class CoopR_CampsiteModule: Module_F
    {
        scope = 2;
        displayName = "CoopR Campsite";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Mission_Framework";
        function = "coopr_fnc_setupCampsiteModule"; // initially called
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
        // every addon needs to define a logging level argument. If not the logging will not be enabled for this addon
              class Logging {
                  displayName = "Logging Level";
                  description = "The Logging level to use for this module";
                  typeName = "NUMBER";
                  class Values {
                      class opt_1 {name = "None"; value = 0;};
                      class opt_2 {name = "Info"; value = 1; default = 1;};
                      class opt_3 {name = "Debug"; value = 2;};
                  };
              };
        };
        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module to an unit to get instant acces to ArmA4";//TODO change this description
        };
    };
};
