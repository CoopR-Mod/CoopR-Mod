class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
        };
        // Description base classes, for more information see below
        class ModuleDescription
        {
            class AnyBrain;
        };
    };
    class CoopR_ModuleSetupCommander: Module_F
    {
        // Standard object definitions
        scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
        displayName = "Commander Module"; // Name displayed in the menu
        //icon = "\myTag_addonName\data\iconNuke_ca.paa"; // Map icon. Delete this entry to use the default icon
        category = "CoopR_Setup";

        // Name of function triggered once conditions are met
        function = "coopr_fnc_setupCommanderModule";
        // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
        functionPriority = 1;
        // 0 for server only execution, 1 for global execution, 2 for persistent global execution
        isGlobal = 1;
        // 1 for module waiting until all synced triggers are activated
        isTriggerActivated = 1;
        // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
        isDisposable = 1;
        // // 1 to run init function in Eden Editor as well
        is3DEN = 0;

        // Module description. Must inherit from base class, otherwise pre-defined entities won't be available
        class ModuleDescription: ModuleDescription
        {
            description = "Sync this module with an AI unit to make it the CoopR commander unit"; // Short description, will be formatted as structured text
        };
    };
};