params ["_player", "_JIP"];

call X11_fnc_initNpcs;
call X11_fnc_initEventsClient;

_player call X11_fnc_addPlayerActions;
_player call X11_fnc_addPlayerVariables;

systemChat "...client initialized";
