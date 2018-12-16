#include "script_component.hpp"

private _ctrl = _this select 0;
private _nameTextEdit = _ctrl getVariable ["_nameTextEdit", objNull];
private _infoText = _ctrl getVariable ["_infoText", objNull];
private _roleSelectBox = _ctrl getVariable ["_roleSelectBox", objNull];
private _rolesHash = _ctrl getVariable ["_rolesHash", objNull];
private _slot = _ctrl getVariable ["_slot", -1];

private _uid = getPlayerUID player;
private _name = ctrlText _nameTextEdit;
private _index = lbCurSel _roleSelectBox;
private _roleName = _roleSelectBox lbText _index;
private _roleId = [_rolesHash, _roleName] call CBA_fnc_hashGet;
private _loadOut = _roleId call coopr_fnc_getLoadoutForClass;

FFLOG("creating new character for %1 at slot %1", _uid, _slot);

private _character = [_uid, _slot, _name, _roleId, 0, 500] call coopr_fnc_createCharacterState;
[_character, COOPR_KEY_LOADOUT, _loadOut] call CBA_fnc_hashSet;

if(_name == "" or _roleName == "") exitWith {
    _infoText ctrlSetStructuredText parseText format["<t size='1' color='#ff0000'>%1</t>", localize "str.coopr.profiles.validator"];
};

[SERVER, "coopr_fnc_updateCharacter", [_uid, _character, _slot], //request-related
    [_pairs], {
        params ["_args", "_result"];
        closeDialog 1;
    }
] call Promise_Create;

