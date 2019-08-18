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
    class CoopR_ModuleSetupCore: Module_F
    {
        scope = 2;
        displayName = "CoopR Core";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupCoreModule";
        functionPriority = 1;
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
              class ReputationMan {
                  displayName = "Reputation per enemy (infantry)";
                  description = "The amount of reputation points a player will receive for eliminating an enemy infantry unit"
                  typeName = "NUMBER";
                  defaultvalue = 1;
              }
              class WIAReputation {
                  displayName = "Wounded in Action malus multiplier";
                  description = "When a player is killed in action during a mission he will only receive a lowered amount of reputaton"
                  typeName = "NUMBER";
                  defaultvalue = 0.2;
              }
              class DeveloperMode {
                  displayName = "Developer Mode";
                  description = "When developer mode is active debug functions can be used to provide debug gameplay states"
                  typeName = "BOOL";
              }
        }

        class ModuleDescription: ModuleDescription
        {
            description = "The core of power";
        };
    }
    class CoopR_ModuleSetupCommander: Module_F
    {
        scope = 2;
        displayName = "CoopR Commander NPC";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupCommanderModule";
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

    class CoopR_ModuleSetupIntelligence: Module_F
    {
        scope = 2;
        displayName = "CoopR Intelligence NPC";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupIntelligenceModule";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module with an AI unit to make it the CoopR intelligence unit";
        };
    };
    class CoopR_ModuleSetupVehicle: Module_F
    {
        scope = 2;
        displayName = "CoopR Vehicle NPC";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupVehicleModule";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module with an AI unit to make it the CoopR vehicle npc unit";
        };
    };
    class CoopR_ModuleSetupHQ: Module_F
    {
        scope = 2;
        displayName = "CoopR Headquarter";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupHQModule";
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
                      class opt_2 {name = "East"; value = "East";};
                  }
              }
              class Faction {
                  displayName = "Faction";
                  description = "The unit faction of this HQ"
                  typeName = "STRING";
                  defaultvalue = "BLU_F";
              }
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Place this module to set the CoopR HQ position";
        };
    };
};
