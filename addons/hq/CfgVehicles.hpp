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
    class CoopR_ModuleSetupCommander: Module_F
    {
        scope = 2;
        displayName = "CoopR Commander";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Mission_Framework";
        function = "coopr_fnc_initCommander";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
            description = "Sync this module with an AI unit to make it the CoopR commander unit";
        };
    };

    class CoopR_ModuleSetupHQ: Module_F
    {
        scope = 2;
        displayName = "CoopR Headquarter";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Mission_Framework";
        function = "coopr_fnc_initHQAddon";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
              class HQ_Bounds {
                  displayName = "Headquarter Boundaries";
                  description = "The name of the circle/rectangle marker that defines the boundaries of the headquarters"
                  typeName = "STRING";
                  defaultValue = "<NONE>";
              }
              class Side {
                  displayName = "Side";
                  description = "The side the HQ is bound to. (default = West)";
                  typeName = "STRING";
                  class Values {
                      class opt_1 {name = "West"; value = "West"; default = 1;};
                      //class opt_2 {name = "East"; value = "East";};
                  }
              }
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Place this module to set the CoopR HQ position";
        };
    };
};
