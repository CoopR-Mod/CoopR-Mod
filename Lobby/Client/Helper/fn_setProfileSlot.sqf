
#include "..\..\constants.hpp"

params ["_profile", "_infoBox"];

if !(_profile call X11_fnc_isProfileEmpty) then {
    private _name = [_profile, KEY_NAME] call CBA_fnc_hashGet;
    private _reputation = [_profile, KEY_REPUTATION] call CBA_fnc_hashGet;
    private _money = [_profile, KEY_MONEY] call CBA_fnc_hashGet;
    private _prisoner = [_profile, KEY_IS_RENEGADE] call CBA_fnc_hashGet;

    _infoBox ctrlSetStructuredText composeText [localize "str.dpl.profile.info.name", _name, lineBreak,
                                             localize "str.dpl.profile.info.reputation", str _reputation, lineBreak,
                                             localize "str.dpl.profile.info.money", str _money, lineBreak,
                                             localize "str.dpl.profile.info.isprisoner", str _prisoner, lineBreak];
}else {
    _infoBox ctrlSetText localize "str.dpl.profiles.noprofile";
};
