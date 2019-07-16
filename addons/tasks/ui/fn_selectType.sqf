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

if !(_selectedIndex == INFANTRY) then {
    _strengthSel lbAdd "NOT USED";
    _behaviourSel lbAdd "NOT USED";
    _strengthSelection lbSetCurSel 0;
    _behaviourSelection lbSetCurSel 0;
    ctrlEnable [_strengthSel, false];
    ctrlEnable [_behaviourSel, false];
} else {
    { _strengthSel lbAdd _x; _strengthSel lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_STRENGTH_OPTIONS;
    { _behaviourSel lbAdd _x; _behaviourSel lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_BEHAVIOUR_OPTIONS;
    _strengthSelection lbSetCurSel 0;
    _behaviourSelection lbSetCurSel 0;
    ctrlEnable [_strengthSel, true];
    ctrlEnable [_behaviourSel, true];
};

