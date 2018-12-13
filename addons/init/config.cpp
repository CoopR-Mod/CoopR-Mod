#include "script_component.hpp"

class CfgPatches {
    class coopr_init
    {
        // Meta information for editor
        name = "CoopR Mod";
        author = "xetra11";
        url = "https://github.com/CoopR-Mod/CoopR-Altis";

        requiredVersion = 1.80;
        requiredAddons[] = {
            "coopr_core",
        };
        units[] = {
            "CoopR_ModuleSetupCommander",
            "CoopR_ModuleSetupQuartermaster"
        };
        weapons[] = {};
    };
}

#include "CfgFunctions.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"

// UI
#include "\x\coopr\addons\core\define.hpp"
#include "guiSupply.hpp"
