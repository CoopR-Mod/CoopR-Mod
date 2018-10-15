#include "..\..\constants.hpp"

[] spawn {
    sleep 1;
    private _playerLoggedIn = player getVariable [KEY_PLAYER_LOGGEDIN, false];
    if(!_playerLoggedIn and isNull findDisplay 1103) then {
        createDialog "X11_Login_Dialog";
        call X11_fnc_initLoginDialog;
    }
}
