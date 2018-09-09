params ["_unit", "_killer", "_instigator", "_useEffects"];

// workaround to get the killer unit. Something is screwing up the 'killed' handler
_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];

private _isSuicide = _unit == _killer;
private _nameOfKiller = name _killer;
private _isBlueOnBlue = [group _killer, group _unit] call X11_fnc_sameSide;

if (_isBlueOnBlue and not _isSuicide) then {
    [playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";
    _killer setPos (getPos prison)
};



