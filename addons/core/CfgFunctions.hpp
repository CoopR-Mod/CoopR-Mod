class CfgFunctions {
    class coopr {
        class coopr_core_functions {
            file = "x\coopr\addons\core\functions";
            class sync {};
            class syncPlayersToServer {};
            class syncPlayerToServer {};

            class initEventsServer {};
            class initEventsClient {};

            class addVehicleKeyWest {};
            class addPlayerActions {};

            class setupCommanderModule {};
            class setupQuartermasterModule {};
            class setupQuartermasterItemsModule {};
            class setupIntelligenceModule {};
            class setupVehicleModule {};
            class setupHQModule {};
            class setupBasicRoleLoadoutModule {};
            class setupLobbyModule {};

            class initCommanderNPC {};
            class initQuartermasterNPC {};
            class initIntelligenceNPC {};
            class initVehicleNPC {};
            class initHQ {};
            class initLobby {};

            class verifySetup {};
            class initCoopRServer {postInit = 1;};
            class initCoopRClients {postInit = 1; };
        }
        class coopr_core_helper {
            file = "x\coopr\addons\core\helper";
            class initPromise {};
            class stringReplace {};
        }
        class coopr_core_tests {
            file = "x\coopr\addons\core\tests";
            class tests_init {};
        }
    }
}
