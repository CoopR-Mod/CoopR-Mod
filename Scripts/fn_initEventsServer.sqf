// VCOM AI stealing workaround
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

// regular events
[{saveProfileNamespace; systemChat "...profile saved!"}, 60, []] call CBA_fnc_addPerFrameHandler;

[{call X11_fnc_addOnKilledEH}, 5, []] call CBA_fnc_addPerFrameHandler;

// trigger events
escape_zone setTriggerStatements ["this", "call X11_fnc_onEscape", ""];

systemChat "...server events initialized";
