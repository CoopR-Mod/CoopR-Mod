#include "script_component.hpp"

class CfgPatches {
    class coopr_campsite
    {
        // Meta information for editor
        name = "CoopR Mod";
        author = "Gilles";
        url = "https://github.com/CoopR-Mod/CoopR-Mod";

        requiredVersion = 1.80;
        requiredAddons[] = {
            "coopr_core" // all addons need to depend on core
        };
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
        units[] = {};
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {
            "coopr_item_camping"
        };
    };
};

#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"
