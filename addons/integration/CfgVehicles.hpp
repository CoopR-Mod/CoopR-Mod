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
    class CoopR_ModuleSetupIntegration: Module_F
    {
        scope = 2;
        displayName = "CoopR Integration";
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";
        function = "coopr_fnc_setupIntegration";
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
              class ACE3 {
                  displayName = "ACE3";
                  description = "will integrate with ACE3 mod";
                  typeName = "BOOL";
              }
              class ALIVE {
                  displayName = "ALiVE";
                  description = "will integrate with ALiVE mod";
                  typeName = "BOOL";
              }
        }
        class ModuleDescription: ModuleDescription
        {
          description = "This module will allow other mods to integrate into CoopR Mod";
        };
    };
};
