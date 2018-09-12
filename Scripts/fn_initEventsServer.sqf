// VCOM AI stealing workaround
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

// regular events
[{saveProfileNamespace; systemChat "...profile saved!"}, 60, []] call CBA_fnc_addPerFrameHandler;
["CAManBase", "killed", {call X11_fnc_onKilled}] call CBA_fnc_addClassEventHandler;

// trigger events
escape_zone setTriggerStatements ["this", "call X11_fnc_onEscape", ""];

systemChat "...server events initialized";
