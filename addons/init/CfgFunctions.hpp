class CfgFunctions {
    class coopr {
        class coopr_init_functions {
            file = "x\coopr\addons\init\functions";
            class initNpcs {};
            class initEventsServer {};
            class setupCommanderModule {};
            class setupQuartermasterModule {};
            class initCommanderNPC {};
            class initQuartermasterNPC {};
            class initBoxes {};
            class initCoopRServer {postInit = 1; };
            class initCoopRClients {postInit = 1; };
        }
        class coopr_init_tests {
            file = "x\coopr\addons\init\tests";
            class tests_init {};
        }
    }
}
