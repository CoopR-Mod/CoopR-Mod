class CfgFunctions {
    class coopr {
        class coopr_persistence_local {
            file = "x\coopr\addons\persistence\local";
            class extDB3sql {};
            class getCharactersIDLocal {};
            class updateCharacterLocal {};
            class initUserLocal {};
            class hasUserLocal {};
            class initPersistenceLocal {};
            class getCharactersLocal {};
            class createCharacterLocal{};
        }
        class coopr_persistence_functions {
            file = "x\coopr\addons\persistence\functions";
            class setupPersistenceModule {};
            class updateCharacterSlots {};
            class createCharacter {};
            class updateState {};
            class serializeCoopR {};
            class getNewCharacterState {};
            class getAllProfiles {};
            class characterStatePrettyLog {};
            class sync {};
            class syncPlayersToServer {};
            class initPersistence {};
            class hasUser {};
            class initUser {};
            class updateCharacter {};
            class getCharactersID {};
            class getCharacters {};
        }
    }
}
