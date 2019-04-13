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
    class CoopR_TasksModule: Module_F
    {
        scope = 2;
        displayName = "CoopR Tasks";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupTasksModule"; // initially called
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
                  }
              }
              class TaskRequestItems {
                  displayName = "Task Request Item";
                  description = "The items where the task request action should be applied to";
                    typeName = "ARRAY";
              }
        }
        class ModuleDescription: ModuleDescription
        {
          description = "Sync this module with an AI unit to make it the CoopR intelligence unit";
        };
    };
};
