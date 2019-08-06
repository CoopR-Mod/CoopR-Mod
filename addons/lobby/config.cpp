#include "script_component.hpp"

class CfgPatches {
    class coopr_lobby
    {
        // Meta information for editor
        name = "CoopR Mod";
        author = "xetra11";
        url = "https://github.com/CoopR-Mod/CoopR-Mod";

        requiredVersion = 1.80;
        requiredAddons[] = {
            "coopr_core"
        };
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
        units[] = {
            "CoopR_ModuleSetupLobby";
        };
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};
    };
}

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"

// UI
#include "\x\coopr\addons\core\coopr_gui_base.hpp"
#include "ui\CoopR_Login_Dialog.hpp"
#include "ui\CoopR_Login_Dialog_New.hpp"
#include "ui\CoopR_CharacterCreation_Dialog.hpp"
