params ["_renegade"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

// set all prison relevant variables
private _oldPosition =  getPos _renegade;
_renegade setPos (getPos prison);
_renegade setVariable ["isRenegade", true];
_renegade setVariable ["prisonTimeStart", serverTime];

[{call X11_fnc_checkIfPrisontimeOver}, 3, [_renegade, _oldPosition]] call CBA_fnc_addPerFrameHandler;

systemChat format ["imprisoned at %1", _renegade getVariable "prisonTimeStart"];


