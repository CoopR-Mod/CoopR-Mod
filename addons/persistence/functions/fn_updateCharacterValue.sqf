#include "script_component.hpp"

params [["_slot", -1],
        ["_key", ""],
        ["_value", "",[]]];

DEBUG3("updating %1 with value %2", _key, _value);
private _uid = getPlayerUID player;

[EXEC_SERVER, "coopr_fnc_getCharacter", [_uid, _slot], //request-related
    [_uid, _slot, _key, _value], {
        params ["_args", "_result"];
        _args params ["_uid", "_slot", "_key", "_value"];

        private _character = _result;
        [_character, _key, _value] call CBA_fnc_hashSet;

        [EXEC_SERVER, "coopr_fnc_updateCharacter", [_uid, _character, _slot], //request-related
            [_key, _value], {
                params ["_args", "_result"];
                _args params ["_key", "_value"];
                DEBUG("update client char stats");
                player setVariable [_key, _value];
            }
        ] call Promise_Create;
    }
] call Promise_Create;


