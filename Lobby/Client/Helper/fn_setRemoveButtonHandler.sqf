#include "..\..\constants.hpp"

params ["_button", "_slot"];


_button setVariable ["_slot", _slot];

_removeProfileSlotHandler = {
    params ["_ctrl"];

    private _slot = _ctrl getVariable ["_slot", -1];
    private _oldText = ctrlText _ctrl;

    [_slot, getPlayerUID player] spawn X11_fnc_removeProfileSlot;
    closeDialog 1;
    [] spawn X11_fnc_showLoginDialog;
};

_button ctrlAddEventHandler ["MouseButtonDown",  _removeProfileSlotHandler];
