#include "..\..\constants.hpp"

params ["_characterSlot", "_infoBox"];


private _name = [_characterSlot, KEY_NAME] call CBA_fnc_hashGet;
private _reputation = [_characterSlot, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_characterSlot, KEY_MONEY] call CBA_fnc_hashGet;
private _prisoner = [_characterSlot, KEY_IS_PRISONER] call CBA_fnc_hashGet;
private _state = [_characterSlot, KEY_STATE] call CBA_fnc_hashGet;

if(_state isEqualTo STATE_KIA) exitWith {
    _infoBox ctrlSetStructuredText parseText format["<t size='2' color='#ff0000'>%1</t>", localize "str.dpl.character.state.kia"];
};

if(_state isEqualTo STATE_WIA) exitWith {
    _infoBox ctrlSetStructuredText parseText format["<t size='2' color='#ff0000'>%1</t>", localize "str.dpl.character.state.wia"];
};

_infoBox ctrlSetStructuredText composeText [localize "str.dpl.profile.info.name", " ", _name, lineBreak,
                                         localize "str.dpl.profile.info.reputation", " ", str _reputation, lineBreak,
                                         localize "str.dpl.profile.info.money", " ", str _money, lineBreak,
                                         localize "str.dpl.profile.info.isprisoner", " ", str _prisoner, lineBreak];
