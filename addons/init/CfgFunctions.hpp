class CfgFunctions {
    class coopr {
        class coopr_init_functions {
            file = "x\coopr\addons\init\functions";
            class initEventsServer {};
            class addVehicleKeyWest {};

            class setupCommanderModule {};
            class setupQuartermasterModule {};
            class setupIntelligenceModule {};
            class setupVehicleModule {};
            class setupHQModule {};
            class setupAmmoboxModule {};
            class setupEquipmentboxModule {};

            class initCommanderNPC {};
            class initQuartermasterNPC {};
            class initIntelligenceNPC {};
            class initVehicleNPC {};
            class initHQ {};

            class initAmmobox {};
            class initEquipmentbox {};

            class verifySetup {};
            class initCoopRServer {postInit = 1;};
            //class initCoopRClients {postInit = 1; };
        }
        class coopr_init_tests {
            file = "x\coopr\addons\init\tests";
            class tests_init {};
        }
    }
}