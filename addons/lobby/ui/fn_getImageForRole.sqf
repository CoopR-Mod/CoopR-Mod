#include "script_component.hpp"

/*
 * Author: xetra11
 *
 * Returns the path to the image of a role given by the role id
 *
 * Arguments:
 * 0: _role <CONTROL> - id of the role
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_role", objNull]];

if (_role isEqualTo objNull) then { ERROR("_role was null") };

private _image = "";

switch (_role) do {
    case COOPR_ROLE_LEADER: { _image = "group-leader-256-white.paa" };
    case COOPR_ROLE_MEDIC: { _image = "medic-256-white.paa" };
    case COOPR_ROLE_ENGINEER: { _image = "engineer-256-white.paa" };
    case COOPR_ROLE_DMR: { _image = "designated-marksman-256-white.paa" };
    case COOPR_ROLE_MG: { _image = "mg-gunner-256-white.paa" };
    case COOPR_ROLE_NONE: { _image = "no-role-256-white.paa" };
    default { "no-role-256.paa" };
};

format ["\x\coopr\addons\lobby\data\images\%1", _image]; // return
