// VCOM AI stealing workaround
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

// regular events
[{saveProfileNamespace; systemChat "...profile saved!"}, 60, []] call CBA_fnc_addPerFrameHandler;

private _addKilledEventHandlerToAllUnits = {
    private _addKilledEH = {
        if (isNil {_x getVariable "eh_killed"}) then {
            _x addEventHandler ["killed", { call X11_fnc_onAiKilled}];
            _x setVariable ["eh_killed", true];
        };
    };
    _addKilledEH forEach allUnits;
};

[_addKilledEventHandlerToAllUnits, 5, []] call CBA_fnc_addPerFrameHandler;

// trigger events
escape_zone setTriggerStatements ["this", "call X11_fnc_onEscape", ""];

systemChat "...events initialized";
