class CfgFunctions {
    class coopr {
        class coopr_core_functions {
            file = "x\coopr\addons\core\functions";
            class checkCharacterWIAStates {};
            class wounded {};
            class playerKilledHandler {};
            class onKilled {};
            class playerKilledNpc {};
            class addVehicleKeyWest {};
            class initCharacterActions {};
            class convertTempToReputation {};
            class showReputation {};
            class currentGameTime {};
        }
        class coopr_core_init {
            file = "x\coopr\addons\core\init";
            class verifySetup {};

            class initEventsServer {};
            class initCharacterEvents {};
            class initCharacterRoutines {};
            class initServerRoutines {};
            class initCommanderNPC {};
            class initVehicleNPC {};
            class setupVehicleModule {};
            class initCoreAddon {preInit = 1;};

            class initCoopRClients {};
            class initCoopRServer {postInit = 1;};
        }
        class coopr_core_helper {
            file = "x\coopr\addons\core\helper";
            class abortButtonEventHandler {};
            class initPromise {preInit = 1;};
            class getNearestLocation {};
            class countUnits {};
            class groupsByEntities {};
            class stringReplace {};
            class setLogLevel {};
            class getLogLevel {};
            class codeAsString {};
            class isInHeadquarter {};
            class increaseKillCount {};
            class serializeMarker {};
            class deserializeMarker {};
            class markerOverlaps {};
            class debugMarker {};
            class isGroupStatic {};
            class playerTookItem {};
            class playerDroppedItem {};
            class promise {};
            class logHash {};
            class isSquadLeader {};
            class getVariables {};
            class serializeWorldObject {};
            class deserializeWorldObject {};
        }
        class coopr_core_tests {
            file = "x\coopr\addons\core\tests";
            class tests_reputation {};
            class tests_markerSerialization {};
            class tests_core_runSuite {};
        }
    }
}
