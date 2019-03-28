class CfgFunctions {
    class coopr {
        class coopr_tasks_functions {
            file = "x\coopr\addons\tasks\functions";
            class setupTasksModule {};
            class broadcastReconReports {};
            class removeRedundantReports {};
            class deliverAfterActionReport {};
            class convertReconReportsToTasks {};
            class createCooprTask {};
            class createReconTask {};
            class validateReport {};
            class countTask {};
            class requestCooprTask {};
            class strengthAccuracy {};
            class checkTaskTracking {};
            class initTaskTracker {};
            class createTaskMarker {};
            class removeTaskMarker {};
            class completeReconSubtask {};
            class checkTaskRequirements {};
            class createPatrolAreaMarker {};
            class createDefensiveAreaMarker {};
        }
        class coopr_tasks_routines {
            file = "x\coopr\addons\tasks\routines";
            class taskRoutine {};
            class desertionRoutine {};
            class taskFreshnessRoutine {};
        }
        class coopr_tasks_ui {
            file = "x\coopr\addons\tasks\ui";
            class initReconRepDialog {};
            class writeEntry {};
            class removeEntry {};
            class updateReconReportEntries {};
        }
        class coopr_tasks_helper {
            file = "x\coopr\addons\tasks\helper";
            class getMaxForStrength {};
            class getMinForStrength {};
            class determineTaskType {};
            class hasActiveTask {};
            class isInTaskArea {};
        }
        class coopr_tasks_tests {
            file = "x\coopr\addons\tasks\tests";
            class tests_tasks_runSuite { postInit = 1 };
            class tests_countTasks {};
            class tests_strengthAccuracy {};
            class tests_minMaxForStrength {};
            class tests_determineTaskType {};
            class tests_checkTaskTracking {};
            class tests_initTaskTracker {};
        }
        class coopr_tasks_debug {
            file = "x\coopr\addons\tasks\debug";
            class addDebugTasks {};
        }
    }
}
