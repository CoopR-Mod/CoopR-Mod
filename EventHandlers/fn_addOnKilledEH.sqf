private _addKilledEH = {
    if (isNil {_x getVariable "eh_killed"}) then {
        _x addEventHandler ["killed", { call X11_fnc_onKilled}];
        _x setVariable ["eh_killed", true];
    };
};

_addKilledEH forEach allUnits;
