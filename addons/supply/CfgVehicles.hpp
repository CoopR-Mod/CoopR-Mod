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
    class CoopR_ModuleSetupSupply: Module_F
    {
        scope = 2;
        displayName = "CoopR Supply";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupSupplyModule";
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
          description = "Defines the CoopR Supply feature";
        };
    };
};
