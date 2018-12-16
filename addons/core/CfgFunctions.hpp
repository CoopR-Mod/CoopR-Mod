class CfgFunctions {
    class coopr {
        class coopr_core_functions {
            file = "x\coopr\addons\core\functions";
            class checkCharacterWIAStates {};
            class death {};
            class playerKilledHandler {};
            class onKilled {};
            class playerKilledNpc {};
            class addVehicleKeyWest {};
            class addPlayerActions {};
            class updateReputation {};
            class updateTempReputation {};
            class convertTempToReputation {};
            class deliverAfterActionReport {};
            class showReputation {};
            class verifySetup {};
        }
        class coopr_core_init {
            file = "x\coopr\addons\core\init";
            class initEventsServer {};
            class initEventsClient {};
            class initCommanderNPC {};
            class initQuartermasterNPC {};
            class initIntelligenceNPC {};
            class initVehicleNPC {};
            class initHQ {};
            class initCore {};
            class setupCommanderModule {};
            class setupQuartermasterModule {};
            class setupQuartermasterItemsModule {};
            class setupIntelligenceModule {};
            class setupVehicleModule {};
            class setupHQModule {};
            class setupCoreModule {};
            class setupBasicRoleLoadoutModule {};

            class initCoopRServer {postInit = 1;};
            class initCoopRClients {postInit = 1; };
        }
        class coopr_core_helper {
            file = "x\coopr\addons\core\helper";
            class abortButtonEventHandler {};
            class initPromise {};
            class stringReplace {};
            class setLogLevel {};
            class getLogLevel {};
        }
        class coopr_core_tests {
            file = "x\coopr\addons\core\tests";
            class tests_init {};
            class tests_reputation {};
        }
    }
}
