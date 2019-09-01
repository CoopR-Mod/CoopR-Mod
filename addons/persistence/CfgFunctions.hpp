class CfgFunctions {
    class coopr {
        class coopr_persistence_init {
            file = "x\coopr\addons\persistence\init";
            class initPersistenceAddon { postInit = 1; };
        }
        class coopr_persistence_local {
            file = "x\coopr\addons\persistence\local";
            class extDB3sql {};
            class getCharactersIDLocal {};
            class updateCharacterLocal {};
            class initPlayerPersistenceLocal {};
            class hasPlayerLocal {};
            class initPersistenceLocal {};
            class getCharactersLocal {};
            class createCharacterLocal{};
            class removeCharacterLocal {};
            class localDatabaseRefresh {};
            class saveMissionLocal {};
            class getMissionLocal {};
            class getMissionCountLocal {};
            class initServerMetaLocal {};
            class getReconAreaActivityLocal {};
            class setReconAreaActivityLocal {};
            class pushMissionQueueLocal {};
            class getAllQueuedMissionsLocal {};
            class getQueuedMissionsCountLocal {};
            class popQueuedMissionLocal {};
            class deleteQueuedMissionLocal {};
            class initReconReportLocal {};
            class getReportIdForCharacterLocal {};
            class saveReconEntryLocal {};
            class getEntriesForReportLocal {};
            class getEntriesForCharacterLocal {};
            class setReportStateLocal {};
            class removeReconEntryLocal {};
        }
        class coopr_persistence_functions {
            file = "x\coopr\addons\persistence\functions";
            class createCharacter {};
            class updateState {};
            class serializeCoopR {};
            class deserializeCoopR {};
            class getNewCharacterState {};
            class characterStatePrettyLog {};
            class sync {};
            class syncPlayers {};
            class removeCharacter {};
            class initPersistence {};
            class hasPlayer {};
            class initPlayerPersistence {};
            class getReconAreaActivity {};
            class setReconAreaActivity {};
            class updateCharacter {};
            class getCharactersID {};
            class getCharacters {};
            class saveMission {};
            class getMission {};
            class getMissionCount {};
            class initServerMeta {};
            class pushMissionQueue {};
            class getAllQueuedMissions {};
            class getQueuedMissionsCount {};
            class popQueuedMission {};
            class deleteQueuedMission {};
            class initReconReport {};
            class getReportIdForCharacter {};
            class saveReconEntry {};
            class getEntriesForReport {};
            class getEntriesForCharacter {};
            class setReportState {};
            class removeReconEntry {};
        }
    }
}
