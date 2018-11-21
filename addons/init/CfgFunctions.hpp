class CfgFunctions {
    class coopr {
        class coopr_init_functions {
            file = "x\coopr\addons\init\functions";
            class initNpcs {RECOMPILE;};
            class initEventsServer {RECOMPILE;};
            class initBoxes {RECOMPILE;};
            class initCoopRServer {postInit = 1; RECOMPILE;};
            class initCoopRClients {postInit = 1; RECOMPILE;};
        }
        class coopr_init_tests {
            file = "x\coopr\addons\init\tests";
            class tests_init {RECOMPILE;};
        }
    }
}
