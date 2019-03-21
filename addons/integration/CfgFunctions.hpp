class CfgFunctions {
    class coopr {
        class coopr_integration_functions {
            file = "x\coopr\addons\integration\functions";
            class setupIntegration;
        }
        class coopr_integration_ace3_functions {
            file = "x\coopr\addons\integration\functions\ace3";
            class isACE3Active {};
            class ace3_initCommander {};
            class ace3_initIntelligence {};
            class ace3_initArmory {};
            class ace3_addCharacterActions {};
        }
        class coopr_integration_alive_functions {
            file = "x\coopr\addons\integration\functions\alive";
            class alive_staticData {};
            class alive_getLowestPriorityObjective {};
            class alive_getLowestPriorityObjectiveLocation {};
        }
    }
}
