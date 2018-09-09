params ["_player", "_JIP"];

[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

call X11_fnc_initNpcs;

systemChat "...client initialized";
