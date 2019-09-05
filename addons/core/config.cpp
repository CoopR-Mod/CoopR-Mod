#include "script_component.hpp"

class CfgPatches {
    class coopr_core
    {
        // Meta information for editor
        name = "CoopR Mod";
        author = "xetra11";
        url = "https://github.com/CoopR-Mod/CoopR-Mod";

        requiredVersion = 1.80;
        requiredAddons[] = {
            "A3_3DEN",
            "cba_common",
            "cba_diagnostic",
            "cba_hashes",
        };
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
        units[] = { };
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};
    };
}

#include "CfgFunctions.hpp"
#include "CfgFactionClasses.hpp"
#include "Cfg3DEN.hpp"
