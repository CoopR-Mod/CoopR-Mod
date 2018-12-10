#include "script_component.hpp"

[] spawn {
    sleep 1;
    private _playerLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
    if(!_playerLoggedIn and isNull findDisplay 1103) then {
        createDialog "coopr_Login_Dialog";
        call coopr_fnc_initLoginDialog;
    }
}
