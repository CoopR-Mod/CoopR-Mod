class CfgVehicles
{
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
    class CoopR_ModuleSetupArmory: Module_F
    {
        scope = 2;
        displayName = "CoopR Armory Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupArmoryModule";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
            class Logging {
                displayName = "Logging Level";
                description = "The Logging level to use for this module";
                typeName = "NUMBER";
                class Values {
                    class opt_1 {name = "None"; value = 0;};
                    class opt_2 {name = "Info"; value = 1; default = 1;};
                    class opt_3 {name = "Debug"; value = 2;};
                }
            }
            class Item_1 {
                displayName = "Item 1 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
                defaultValue = "['arifle_MXC_F', 15, 'MXC F', 'This weapon is pretty cool']";
            }
            class Item_2 {
                displayName = "Item 2 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
            class Item_3 {
                displayName = "Item 3 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
            class Item_4 {
                displayName = "Item 4 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
            class Item_5 {
                displayName = "Item 5 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
            class Item_6 {
                displayName = "Item 6 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
            class Item_7 {
                displayName = "Item 7 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
            class Item_8 {
                displayName = "Item 8 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "ARRAY";
            }
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Configures the list of items available in the armory menu. If synced to an NPC it will become the quartermaster";
        };
    };
};
