class CfgFunctions {
    class coopr {
        class coopr_missions_init {
            file = "x\coopr\addons\missions\init";
            class initALiVEMissionSystem {};
            class initCooprMissionSystem {};
            class initMissionItems {};
            class initMissionTracker {};
            class initCharacterMissions {};
        }
        class coopr_missions_functions {
            file = "x\coopr\addons\missions\functions";
            class setupMissionsModule {};
            class finishReconReport {};
            class deliverAfterActionReport {};
            class convertReportToMission {};
            class createCooprMission {};
            class createReconMission {};
            class validateReportEntry {};
            class requestCooprMission {};
            class strengthAccuracy {};
            class checkMissionTracking {};
            class createMissionMarker {};
            class removeMissionMarker {};
            class checkMissionRequirements {};
            class createPatrolAreaMarker {};
            class createDefensiveAreaMarker {};
            class requestCooprReconMission {};
            class serializeMission {};
            class deserializeMission {};
            class determineUnitStrength {};
            class parseStrengthsInArea {};
        }
        class coopr_missions_routines {
            file = "x\coopr\addons\missions\routines";
            class missionRoutine {};
            class reconRoutine {};
            class desertionRoutine {};
        }
        class coopr_missions_ui {
            file = "x\coopr\addons\missions\ui";
            class showReconReportDialog {};
            class showMissionBoardDialog {};
            class writeEntry {};
            class removeEntry {};
            class updateReconReportEntries {};
            class selectMissionType {};
            class selectType {};
        }
        class coopr_missions_helper {
            file = "x\coopr\addons\missions\helper";
            class getMaxForStrength {};
            class getMinForStrength {};
            class determineMissionType {};
            class hasActiveMission {};
            class isInMissionArea {};
            class getLabelByMissionType {};
            class getLabelForAccuracy {};
            class getStrengthByUnitCount {};
            class mapEntriesToStrengthList {};
        }
        class coopr_missions_tests {
            file = "x\coopr\addons\missions\tests";
            class tests_missions_runSuite { postInit = 1 };
            class tests_strengthAccuracy {};
            class tests_minMaxForStrength {};
            class tests_determineMissionType {};
            class tests_checkMissionTracking {};
            class tests_initMissionTracker {};
        }
        class coopr_missions_debug {
            file = "x\coopr\addons\missions\debug";
        }
    }
}
