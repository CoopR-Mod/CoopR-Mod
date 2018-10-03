#include "..\..\constants.hpp"

params ["_characterSlot", "_infoBox"];


private _name = [_characterSlot, KEY_NAME] call CBA_fnc_hashGet;
private _reputation = [_characterSlot, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_characterSlot, KEY_MONEY] call CBA_fnc_hashGet;
private _prisoner = [_characterSlot, KEY_IS_RENEGADE] call CBA_fnc_hashGet;

_infoBox ctrlSetStructuredText composeText [localize "str.dpl.profile.info.name", " ", _name, lineBreak,
                                         localize "str.dpl.profile.info.reputation", " ", str _reputation, lineBreak,
                                         localize "str.dpl.profile.info.money", " ", str _money, lineBreak,
                                         localize "str.dpl.profile.info.isprisoner", " ", str _prisoner, lineBreak];
