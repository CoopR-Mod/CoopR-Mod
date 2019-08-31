class CfgFunctions {
    class coopr {
        class coopr_lobby_functions {
            file = "x\coopr\addons\lobby\functions";
            class spawnAtOldPosition {};
            class spawnInLobby {};
            class login {};
            class logout {};
            class initCharacter {};
            class cleanUp {};
            class redrawCharacterMarker {};
        }
        class coopr_lobby_ui {
            file = "x\coopr\addons\lobby\ui";
            class showLoginDialog {};
            class selectRole {};
            class showCharacterSelectionDisplay {};
            class showCreationDialog {};
            class playAnimationForRole {};
            class initLobbyCam {};
            class initPerks {};
        }
        class coopr_lobby_init {
            file = "x\coopr\addons\lobby\init";
            class initLobbyAddon {};
        }
        class coopr_lobby_helper {
            file = "x\coopr\addons\lobby\helper";
            class togglePerkSelection {};
            class getSelectedPerksCtrl {};
        }
    }
}
