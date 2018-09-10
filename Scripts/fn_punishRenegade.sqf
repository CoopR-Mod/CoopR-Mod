params ["_renegade"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

// set all prison relevant variables
private _oldPosition =  getPos _renegade;
private _allWeapons = weapons _renegade;
private _allMagazines = magazines _renegade;

{_renegade removeWeapon _x} forEach _allWeapons;
{_renegade removeMagazine _x} forEach _allWeapons;

_renegade setPos (getPos prison);
_renegade setVariable ["isRenegade", true];
_renegade setVariable ["prisonTimeStart", serverTime];

[{call X11_fnc_checkIfPrisontimeOver}, 3, [_renegade, _oldPosition, _allWeapons, _allMagazines]] call CBA_fnc_addPerFrameHandler;

systemChat format ["imprisoned at %1", _renegade getVariable "prisonTimeStart"];


