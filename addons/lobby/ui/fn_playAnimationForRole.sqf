#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Plays a set of animations for a given role id on the COOPR_LOBBY_AGENT only.
 * WARNING: This function will NOT reset the animation. To reset the animation to default
 * behaviour the author has to set another animation in a later state of the code i.e:
 *
 * (COOPR_LOBBY_AGENT switchMove "AidlPercMstpSrasWrflDnon_G04";)
 *
 * Arguments:
 * 0: _roleClass <OBJECT> - unit this task is assigned to
 *
 * Return Value:
 * None
 *
 * Example:
 * [_roleClass] call coopr_fn_playAnimationForRole;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_roleClass", objNull]];

// reset position because of animation movement
COOPR_LOBBY_AGENT setPos getPos COOPR_LOBBY;

if (_roleClass isEqualTo objNull) then {
    private _fallbackAnimation = ["CoopR_BaseRole", "lobbyAnimations"] call coopr_fnc_getRoleData;
    COOPR_LOBBY_AGENT switchMove (_fallbackAnimation select 0);
} else {
    _roleAnimations = [_roleClass, "lobbyAnimations"] call coopr_fnc_getRoleData;
    _initAnimation = _roleAnimations deleteAt 0;
    COOPR_LOBBY_AGENT switchMove _initAnimation;
    { COOPR_LOBBY_AGENT playMove _x } forEach _roleAnimations;
};

