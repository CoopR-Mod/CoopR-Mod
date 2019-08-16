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
 * 0: _roleId <OBJECT> - unit this task is assigned to
 *
 * Return Value:
 * None
 *
 * Example:
 * [_roleId] call coopr_fn_playAnimationForRole;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_roleId", "none"]];

// reset position because of animation movement
COOPR_LOBBY_AGENT setPos getPos COOPR_LOBBY;

switch (_roleId) do {
    case COOPR_ROLE_MEDIC : {
        COOPR_LOBBY_AGENT switchMove "Acts_TreatingWounded_in";
        COOPR_LOBBY_AGENT playMove "Acts_TreatingWounded05";
    };
    case COOPR_ROLE_ENGINEER : {
        COOPR_LOBBY_AGENT switchMove "AmovPercMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
    };
    case COOPR_ROLE_LEADER : {
        COOPR_LOBBY_AGENT switchMove "Acts_SignalToCheck";
        COOPR_LOBBY_AGENT playMove "Acts_listeningToRadio_in";
        COOPR_LOBBY_AGENT playMove "Acts_listeningToRadio_Loop";
    };
    case COOPR_ROLE_MG : {
        COOPR_LOBBY_AGENT switchMove "Acts_CrouchingFiringLeftRifle04";
    };
    case COOPR_ROLE_DMR : {
        COOPR_LOBBY_AGENT switchMove "AmovPsitMstpSrasWrflDnon_WeaponCheck1";
    };
    default {
        COOPR_LOBBY_AGENT switchMove "AidlPercMstpSrasWrflDnon_G04";
    };

};
