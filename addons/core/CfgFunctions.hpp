class CfgFunctions {
    class coopr {
        class coopr_core_functions {
            file = "x\coopr\addons\core\functions";
            class checkCharacterWIAStates {};
            class wounded {};
            class playerKilledHandler {ignoreAspect = 1;};
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
            class verifySetup {ignoreAspect = 1;};

            class initEventsServer {};
            class initCharacterEvents {};
            class initCharacterRoutines {};
            class initServerRoutines {};
            class initCommanderNPC {};
            class initVehicleNPC {};
            class setupVehicleModule {};
            class initCoreAddon {postInit = 1; ignoreAspect = 1; };

            class initCoopRClients {};
            class initCoopRServer {};
        }
        class coopr_core_helper {
            file = "x\coopr\addons\core\helper";
            class abortButtonEventHandler {ignoreAspect = 1;};
            class initPromise {preInit = 1;ignoreAspect = 1;};
            class getNearestLocation {};
            class countUnits {};
            class groupsByEntities { };
            class stringReplace {ignoreAspect = 1;};
            class setLogLevel {ignoreAspect = 1;};
            class getLogLevel {ignoreAspect = 1;};
            class codeAsString {ignoreAspect = 1;};
            class isInHeadquarter {};
            class increaseKillCount {};
            class serializeMarker {};
            class deserializeMarker {};
            class markerOverlaps {};
            class debugMarker {};
            class isGroupStatic {};
            class promise {ignoreAspect = 1;};
            class logHash {ignoreAspect = 1;};
            class recordFuncCall {ignoreAspect = 1;};
            class addFunctionAspects {ignoreAspect = 1;};
        }
        class coopr_core_tests {
            file = "x\coopr\addons\core\tests";
            class tests_reputation {ignoreAspect = 1;};
            class tests_markerSerialization {ignoreAspect = 1;};
            class tests_core_runSuite {ignoreAspect = 1;};
        }
    }
}
