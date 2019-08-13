class CfgFunctions {
    class coopr {
        class coopr_campsite_module {
            file = "x\coopr\addons\campsite\functions";
            class setupCampsiteModule{};
        };

        class coopr_campsite_helper{
            file = "x\coopr\addons\campsite\helper";
            class createCampsiteMarkerUniqueName {};
            class createCampsiteMarkerArea {};
            class canBuildCampsiteStructure {};
            class isInsideCampingArea {};
        };
        
        class coopr_campsite_functions{
            file = "x\coopr\addons\campsite\functions";
            class buildCampsiteStructure {};
            class addTentItem {};
            class attachTentToPlayer {};
            class spawnTent {};
        };
    };        
};
