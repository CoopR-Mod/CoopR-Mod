class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
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
        displayName = "Commander Module";
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
        displayName = "Quartermaster Module";
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
        displayName = "Intelligence Module";
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
};
