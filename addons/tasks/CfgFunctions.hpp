class CfgFunctions {
    class coopr {
        class coopr_tasks_functions {
            file = "x\coopr\addons\tasks\functions";
            class setupTasksModule {};
            class finishReconReport {};
            class deliverAfterActionReport {};
            class convertReportToMission {};
            class createCooprTask {};
            class createReconTask {};
            class validateReport {};
            class requestCooprTask {};
            class strengthAccuracy {};
            class checkTaskTracking {};
            class initTaskTracker {};
            class createTaskMarker {};
            class removeTaskMarker {};
            class checkTaskRequirements {};
            class createPatrolAreaMarker {};
            class createDefensiveAreaMarker {};
            class requestCooprReconTask {};
            class initTaskItems {};
            class serializeTask {};
            class deserializeTask {};
            class initCharacterMissions {};
        }
        class coopr_tasks_routines {
            file = "x\coopr\addons\tasks\routines";
            class taskRoutine {};
            class desertionRoutine {};
        }
        class coopr_tasks_ui {
            file = "x\coopr\addons\tasks\ui";
            class showReconReportDialog {};
            class showTaskBoardDialog {};
            class writeEntry {};
            class removeEntry {};
            class updateReconReportEntries {};
            class selectMissionType {};
        }
        class coopr_tasks_helper {
            file = "x\coopr\addons\tasks\helper";
            class getMaxForStrength {};
            class getMinForStrength {};
            class determineTaskType {};
            class hasActiveTask {};
            class isInTaskArea {};
            class getLabelByMissionType {};
            class getLabelForAccuracy {};
            class extractReportedStrength {};
        }
        class coopr_tasks_tests {
            file = "x\coopr\addons\tasks\tests";
            class tests_tasks_runSuite { postInit = 1 };
            class tests_strengthAccuracy {};
            class tests_minMaxForStrength {};
            class tests_determineTaskType {};
            class tests_checkTaskTracking {};
            class tests_initTaskTracker {};
        }
        class coopr_tasks_debug {
            file = "x\coopr\addons\tasks\debug";
        }
    }
}
