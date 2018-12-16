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
    class CoopR_ModuleSetupPersistence: Module_F
    {
        scope = 2;
        displayName = "CoopR Persistence";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupPersistenceModule";
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
              class PersistenceLocation {
                  displayName = "Persistence Location";
                  description = "Where to persist characters and campaign states to";
                  typeName = "STRING";
                  class Values {
                      class opt_1 {name = "Official"; value = "Official"; default = 1};
                      class opt_2 {name = "Local"; value = "Local";};
                      class opt_3 {name = "Custom"; value = "Custom";};
                  }
              }
              class CustomLocation {
                  displayName = "Custom Persistence Location";
                  description = "If 'Persistence Location' is set to 'Custom' then define the CoopR HQ here";
                  typeName = "STRING";
              }
        }

        class ModuleDescription: ModuleDescription
        {
            description = "This modules configurations to the persistence webservice 'CoopR HQ' or custom services";
        };
    };
};
