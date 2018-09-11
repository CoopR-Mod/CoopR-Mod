params ["_args"];

private _units = _args select 0;
private _addKilledEH = {
    if (isNil {_x getVariable "eh_killed"}) then {
        _x addEventHandler ["killed", { call X11_fnc_onKilled}];
        _x setVariable ["eh_killed", true];
    };
};
systemChat "addKilledEH called";
_addKilledEH forEach _units;
