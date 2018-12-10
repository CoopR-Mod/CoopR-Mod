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
        displayName = "Commander NPC Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupCommanderModule";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
            description = "Sync this module with an AI unit to make it the CoopR commander unit";
        };
    };

    class CoopR_ModuleSetupQuartermaster: Module_F
    {
        scope = 2;
        displayName = "Quartermaster NPC Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupQuartermasterModule";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
            description = "Sync this module with an AI unit to make it the CoopR quartermaster unit";
        };
    };
    class CoopR_ModuleSetupIntelligence: Module_F
    {
        scope = 2;
        displayName = "Intelligence NPC Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupIntelligenceModule";
        functionPriority = 1;
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
        displayName = "Vehicle NPC Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupVehicleModule";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module with an AI unit to make it the CoopR vehicle npc unit";
        };
    };
    class CoopR_ModuleSetupAmmobox: Module_F
    {
        scope = 2;
        displayName = "Ammobox Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupAmmoboxModule";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module with an container or box to make it a CoopR ammo box";
        };
    };
    class CoopR_ModuleSetupEquipmentbox: Module_F
    {
        scope = 2;
        displayName = "Equipmentbox Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupEquipmentboxModule";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module with an container or box to make it a CoopR equipment box";
        };
    };
    class CoopR_ModuleSetupHQ: Module_F
    {
        scope = 2;
        displayName = "HQ Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupHQModule";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
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
              class InitLoadout {
                  displayName = "Initial Loadout Template";
                  description = "The template for the initial loadout for new created characters"
                  typeName = "STRING";
                  defaultvalue = "no_mods";
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
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Place this module to set the CoopR HQ position";
        };
    };
    class CoopR_LobbySetupHQ: Module_F
    {
        scope = 2;
        displayName = "Lobby Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupLobbyModule";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class ModuleDescription: ModuleDescription
        {
          description = "The lobby defines the position where players spawn before login";
        };
    };
};
