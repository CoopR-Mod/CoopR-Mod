#include "script_component.hpp"

params ["_characterSlot", "_infoBox"];

private _name = [_characterSlot, KEY_NAME] call CBA_fnc_hashGet;
private _reputation = [_characterSlot, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_characterSlot, KEY_MONEY] call CBA_fnc_hashGet;
private _prisoner = [_characterSlot, KEY_IS_PRISONER] call CBA_fnc_hashGet;
private _state = [_characterSlot, KEY_STATE] call CBA_fnc_hashGet;
private _deathTimeStamp = [_characterSlot, KEY_DEATH_TIMESTAMP] call CBA_fnc_hashGet;

private _hospilitationTimeLeft = _deathTimeStamp + (WIA_CD * 60) - serverTime;

private _composedInfoText = composeText [localize "str.coopr.profile.info.name", " ", _name, lineBreak,
                                         localize "str.coopr.profile.info.reputation", " ", str _reputation, lineBreak,
                                         localize "str.coopr.profile.info.money", " ", str _money, lineBreak,
                                         localize "str.coopr.profile.info.isprisoner", " ", str _prisoner, lineBreak];

if(_state isEqualTo STATE_WIA) then {
    private _parsedText = parseText format["<t size='2' color='#ff0000'>%1</t>", localize "str.coopr.character.state.wia"];
    _composedInfoText = composeText [_parsedText, lineBreak,
                                     localize "str.coopr.profile.info.wia.timeleft", " ", str ceil((_hospilitationTimeLeft / 60)), " min"];
};

_infoBox ctrlSetStructuredText _composedInfoText;
