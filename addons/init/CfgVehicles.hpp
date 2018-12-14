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
    class CoopR_QuartermasterItems: Module_F
    {
        scope = 2;
        displayName = "Quartermaster Items Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupQuartermasterItemsModule";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;


        class Arguments {
            class Item_1 {
                displayName = "Item 1 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
                defaultValue = "['arifle_MXC_F', 15, 'MXC F', 'This weapon is pretty cool']";
            }
            class Item_2 {
                displayName = "Item 2 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
            class Item_3 {
                displayName = "Item 3 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
            class Item_4 {
                displayName = "Item 4 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
            class Item_5 {
                displayName = "Item 5 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
            class Item_6 {
                displayName = "Item 6 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
            class Item_7 {
                displayName = "Item 7 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
            class Item_8 {
                displayName = "Item 8 (Array)";
                description = "The item/weapon config name. (['<config_name>', '<reputation_price>', '<dialog_name>', '<dialog_description>']"
                typeName = "STRING";
            }
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Configures the list of items available in the quartermaster menu";
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
              class SupplyCommunicationDevices {
                  displayName = "Supply Communication Devices";
                  description = "Devices that are used to communicate with the high command supply service"
                  typeName = "STRING";
              }
              class SupplyVehicle {
                  displayName = "Supply Vehicle";
                  description = "Vehicle class of the supply transport vehicle (default='B_Truck_01_ammo_F')"
                  typeName = "STRING";
                  defaultValue = "B_Truck_01_ammo_F";
              }
              class SupplyDeliveryTime {
                  displayName = "Supply time to deliver (minutes)";
                  description = "The time it takes until a supply delivery will arrive"
                  typeName = "NUMBER";
                  defaultValue = "1";
              }
              class SupplyInsertionArea {
                  displayName = "Area of supply insertion";
                  description = "Define the name of the area marker where the insertion of supply vehicles should occur";
                  typeName = "STRING";
              }
              class SupplyArrivalArea {
                  displayName = "Area of supply arrival";
                  description = "Define the name of the area marker where the supply vehicle should arrive at";
                  typeName = "STRING";
              }
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Place this module to set the CoopR HQ position";
        };
    };
    class CoopR_BasicRoleLoadouts: Module_F
    {
        scope = 2;
        displayName = "Basic Role Loadout Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupBasicRoleLoadoutModule";
        functionPriority = 2;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
            class GroupLeaderLoadout {
                displayName = "Group Leader Loadout";
                description = "The loadout array for a specific role"
                typeName = "STRING";
                defaultValue = "[['arifle_MXC_F','','','',['30Rnd_65x39_caseless_mag',30],[],''],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_CombatUniform_mcam_vest',[['FirstAidKit',1],['30Rnd_65x39_caseless_mag',2,30],['Chemlight_green',1,1]]],['V_BandollierB_rgr',[['30Rnd_65x39_caseless_mag',3,30],['16Rnd_9x21_Mag',2,16],['HandGrenade',2,1],['SmokeShell',1,1],['SmokeShellGreen',1,1],['Chemlight_green',1,1]]],[],'H_HelmetCrew_B','',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles']]";
            }
            class MedicLoadout {
                displayName = "Medic Loadout";
                description = "The loadout array for a specific role"
                typeName = "STRING";
            }
            class EngineerLoadout {
                displayName = "Engineer Loadout";
                description = "The loadout array for a specific role"
                typeName = "STRING";
            }
            class DMRLoadout {
                displayName = "DMR Loadout";
                description = "The loadout array for a specific role"
                typeName = "STRING";
            }
            class MGLoadout {
                displayName = "MG Loadout";
                description = "The loadout array for a specific role"
                typeName = "STRING";
            }
        }

        class ModuleDescription: ModuleDescription
        {
          description = "Defines the loadout for a newly created character role";
        };
    };
    class CoopR_LobbySetupHQ: Module_F
    {
        scope = 2;
        displayName = "Lobby Module";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupLobbyModule";
        functionPriority = 1;
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
