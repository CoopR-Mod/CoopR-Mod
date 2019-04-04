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
            "coopr_core",
            "Extended_Eventhandlers" // all addons need to depend on core
        };
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
        units[] = {
            "coopr_item_camping"
        };
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {
            "coopr_item_camping"
        };
    };
};

#include "constants.hpp"
#include "cfgFunctions.hpp"
#include "cfgWeapons.hpp"
#include "cfgVehicles.hpp"