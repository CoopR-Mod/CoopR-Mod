class CfgFunctions {
    class coopr {
        class coopr_init_functions {
            file = "x\coopr\addons\init\functions";
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

            class setupAmmoboxModule {};
            class setupEquipmentboxModule {};

            class initCommanderNPC {};
            class initQuartermasterNPC {};
            class initIntelligenceNPC {};
            class initVehicleNPC {};
            class initHQ {};
            class initLobby {};

            class initAmmobox {};
            class initEquipmentbox {};

            class verifySetup {};
            class initCoopRServer {postInit = 1;};
            class initCoopRClients {postInit = 1; };
        }
        class coopr_init_tests {
            file = "x\coopr\addons\init\tests";
            class tests_init {};
        }
    }
}
