// VCOM AI stealing workaround
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

// regular events
{_x addEventHandler ["killed", {call X11_fnc_onAiKilled;}];} forEach allUnits;

// trigger events
escape_zone setTriggerStatements ["this", "call X11_fnc_onEscape", ""];

systemChat "event initialized";
