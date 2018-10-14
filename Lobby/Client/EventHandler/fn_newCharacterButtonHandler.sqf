#include "..\..\constants.hpp"

params ["_ctrl"];
private _slot = _ctrl getVariable ["_slot", -1];
closeDialog 1;
createDialog "X11_NewProfile_Dialog";
[_slot] spawn X11_fnc_showNewCharacterDialog;
