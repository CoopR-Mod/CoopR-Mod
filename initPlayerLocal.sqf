params ["_player", "_JIP"];

call X11_fnc_initNpcs;

_player setVariable ["isRenegade", false];

systemChat "...client initialized";
