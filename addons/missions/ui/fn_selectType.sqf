#include "script_component.hpp"

#define INFANTRY 0
#define MOTORIZED 1
#define ARMORED 2

params ["_ctrl", "_selectedIndex"];
private _strengthSel = _ctrl getVariable ["_strengthSelection", objNull];
private _behaviourSel = _ctrl getVariable ["_behaviourSelection", objNull];

// clear both listboxes
lbClear _strengthSel;
lbClear _behaviourSel;

if !(_selectedIndex isEqualTo INFANTRY) then {
    _strengthSel lbAdd "NOT USED";
    _behaviourSel lbAdd "NOT USED";
    _strengthSel lbSetData [0, "1"];
    _behaviourSel lbSetData [0, COOPR_MISSION_BEHAVIOUR_DEFENSIVE];
    _strengthSelection lbSetCurSel 0;
    _behaviourSelection lbSetCurSel 0;
    _strengthSel ctrlEnable false;
    _behaviourSel ctrlEnable false;
} else {
    { _strengthSel lbAdd _x; _strengthSel lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_STRENGTH_OPTIONS;
    { _behaviourSel lbAdd _x; _behaviourSel lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_BEHAVIOUR_OPTIONS;
    _strengthSel lbSetCurSel 0;
    _behaviourSel lbSetCurSel 0;
    _strengthSel ctrlEnable true;
    _behaviourSel ctrlEnable true;
};

